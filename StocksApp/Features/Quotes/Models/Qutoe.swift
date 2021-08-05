//
//  Qutoe.swift
//  StocksApp
//
//  Created by 김정민 on 2021/08/05.
//

import Foundation

struct Quote: Codable {
    var symbol: String
    var open: String
    var high: String
    var low: String
    var price: String
    var change: String
    var changePercent: String
    
    private enum CodingKeys: String, CodingKey {
        case symbol = "01. symbol"
        case open = "02. open"
        case high = "03. high"
        case low = "04. low"
        case price = "05. price"
        case change = "09. change"
        case changePercent = "10. change percent"
    }
}

extension Quote: Identifiable {
    var id: UUID {
        return UUID()
    }
}

/*
 {
     "Global Quote": {
         "01. symbol": "IBM",
         "02. open": "143.8000",
         "03. high": "144.1800",
         "04. low": "142.4700",
         "05. price": "142.7600",
         "06. volume": "2799201",
         "07. latest trading day": "2021-08-04",
         "08. previous close": "144.0700",
         "09. change": "-1.3100",
         "10. change percent": "-0.9093%"
     }
 }

 */
 
