//
//  API.swift
//  StocksApp
//
//  Created by 김정민 on 2021/08/05.
//

import Foundation

struct API {
    static var baseUrl: String {
        return "https://www.alphavantage.co/query?"
    }
    
    static func symbolSearchUrl(for searchKey: String) -> String {
        return urlBy(symbol: .search, searchKey: searchKey)
    }
    
    static func quoteUrl(for searchKey: String) -> String {
        return urlBy(symbol: .quote, searchKey: searchKey)
    }
    
    private static func urlBy(symbol: SymbolFunction, searchKey: String) -> String {
        switch symbol {
        case .search:
            return "\(baseUrl)function=\(symbol.rawValue)&apikey=\(key)&keywords=\(searchKey)"
        case .quote:
            return "\(baseUrl)function=\(symbol.rawValue)&apikey=\(key)&symbol=\(searchKey)"
        }
    }
    
    enum SymbolFunction: String {
        case search = "SYMBOL_SEARCH"
        case quote = "GLOBAL_QUOTE"
    }
}

extension API {
// https://www.alphavantage.co/
    static var key: String {
        let keys: [String] = ["PX40A1II4YND2OGE", "5GIMV9VKZDVHLJTQ", "9ENLS3NPR86NE79F"]
        return keys.randomElement() ?? "PX40A1II4YND2OGE"
    }
}
