//
//  QuoteManagerProtocol.swift
//  StocksApp
//
//  Created by 김정민 on 2021/08/05.
//

import Foundation

protocol QuoteManagerProtocol {
    var quotes: [Quote] { get set }
    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void)
}
