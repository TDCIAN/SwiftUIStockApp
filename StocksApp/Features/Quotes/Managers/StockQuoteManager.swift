//
//  StockQuoteManager.swift
//  StocksApp
//
//  Created by 김정민 on 2021/08/05.
//

import Foundation

final class StockQuoteManager: QuoteManagerProtocol, ObservableObject {
    @Published var quotes: [Quote] = []
    
    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
        var internalQuotes = [Quote]()
        let downloadQueue = DispatchQueue(label: "TDCIAN")
        let downloadGroup = DispatchGroup()
        
        stocks.forEach { stock in
            downloadGroup.enter()
            let url = URL(string: API.quoteUrl(for: stock))!
            NetworkManager<GlobalQuoteResponse>().fetch(from: url) { result in
                switch result {
                case .failure(let err):
                    print("StockQuoteManager - download - err: \(err.localizedDescription)")
                    downloadQueue.async {
                        downloadGroup.leave()
                    }
                case .success(let response):
                    downloadQueue.async {
                        internalQuotes.append(response.quote)
                        downloadGroup.leave()
                    }
                }
            }
        }
        
        downloadGroup.notify(queue: DispatchQueue.global()) {
            completion(.success(internalQuotes))
            DispatchQueue.main.async {
                self.quotes.append(contentsOf: internalQuotes)
            }
        }
    }
    
    
}
