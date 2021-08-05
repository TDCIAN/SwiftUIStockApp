//
//  CustomTextField.swift
//  StocksApp
//
//  Created by 김정민 on 2021/08/05.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: Text
    
    @Binding var text: String
    
    var editingChanged: (Bool) -> Void = { _ in }
    var commit: () -> Void = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
            }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
