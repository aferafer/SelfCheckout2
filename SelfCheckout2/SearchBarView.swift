//
//  SearchBarView.swift
//  SelfCheckout2
//
//  Created by Aidan Richards on 2022-12-22.
//

import SwiftUI
import Combine

struct SearchBarView: View {
    @Binding var productSearch: String
    @FocusState private var keyBoardIsFocused: Bool
    @Binding var clearKeyboard: Bool
    
    var body: some View {
        HStack {
            Spacer()
            HStack {
                TextField("Product Search", text: $productSearch)
                    .font(.system(size: 23))
                    .padding([.leading], 40)
                    .focused($keyBoardIsFocused)
                    .frame(width: 210, height: 50)
                    .border(Color.black)
                    .onReceive(Just(productSearch)) { newValue in
                        let filtered = newValue.filter { "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ".contains($0) }
                        if filtered != newValue {
                            self.productSearch = filtered
                        }
                        if (filtered == "") {
                            keyBoardIsFocused = false //if all text in search bar has been deleted then minimize keyboard
                        }
                    }
            }
            .overlay(Image(systemName: "magnifyingglass")
                .offset(x: -85))
            Spacer()
        }
        .onChange(of: clearKeyboard) { changedVal in
            keyBoardIsFocused = false
            clearKeyboard = false
            productSearch = ""
        }
        .onTapGesture {
            keyBoardIsFocused = true
        }
    }
}

