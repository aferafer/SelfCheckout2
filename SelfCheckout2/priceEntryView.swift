//
//  priceEntryView.swift
//  SelfCheckout
//
//  Created by Aidan Richards on 2022-06-28.
//

import SwiftUI

struct priceEntryView: View {
    @Binding var cropPrice: String
    var price: String
    let name: String
    //var isNumber: Double? //value is nil if not a number
    var body: some View {
        let isNumber = NumberFormatter().number(from: price)?.doubleValue
        HStack {
            Text(name + " Price: ")
            TextField("Enter Item Price...", text: $cropPrice)
            if (isNumber == nil) {
                Spacer()
                Text("Error. Please enter a valid price").foregroundColor(Color.red).bold()
            }
        }
    }
}

