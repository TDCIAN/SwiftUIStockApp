//
//  GlobalQuote.swift
//  StocksApp
//
//  Created by 김정민 on 2021/08/05.
//

import Foundation

struct GlobalQuoteResponse: Codable {
    var quote: Quote
    
    private enum CodingKeys: String, CodingKey {
        case quote = "Global Quote"
    }
}

