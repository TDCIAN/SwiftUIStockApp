//
//  SearchManager.swift
//  StocksApp
//
//  Created by 김정민 on 2021/08/05.
//

import Foundation

final class SearchManager: ObservableObject {
    @Published var searches = [Search]()
    
    func searchStocks(keyword: String) {
        NetworkManager<SearchResponse>().fetch(from: URL(string: API.symbolSearchUrl(for: keyword))!) { result in
            switch result {
            case .failure(let err):
                print("SearchManager - searchStocks - err: \(err.localizedDescription)")
            case .success(let response):
                DispatchQueue.main.async {
                    self.searches = response.bestMatches
                }
            }
        }
    }
}
