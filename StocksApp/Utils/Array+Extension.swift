//
//  Array+Extension.swift
//  StocksApp
//
//  Created by 김정민 on 2021/08/05.
//

import Foundation

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}
