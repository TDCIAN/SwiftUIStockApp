//
//  SearchResponse.swift
//  StocksApp
//
//  Created by 김정민 on 2021/08/05.
//

import Foundation

struct SearchResponse: Codable {
    var bestMatches: [Search]
}
