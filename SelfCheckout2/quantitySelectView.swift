//
//  quantitySelectView.swift
//  SelfCheckout2
//
//  Created by Aidan Richards on 2022-12-22.
//

import SwiftUI

struct quantitySelectView: View {
    @Environment(\.dismiss) var dismiss
    @State var quantityDesired: Int=1
    @ObservedObject var Cart: CheckoutClass
    @Binding var productToAdd: Products
    

    var body: some View {
        VStack {
            Text("How many of this item would you like?")
            HStack {
                Spacer()
                Button("-") {
                    self.quantityDesired -= 1
                }
                .font(.system(size: 72))
                TextField("Quantity: ", value: $quantityDesired, formatter: NumberFormatter())
                    .font(.system(size: 100))
                    .frame(width: 55)
                Button("+") {
                    self.quantityDesired += 1
                }
                .font(.system(size: 72))
                Spacer()
            }
            Button("Add items to cart") {
                Cart.totalPrice += Double(Cart.priceDict[productToAdd.referenceName]!)!
                let findObject = CartObject.init(cartName: productToAdd.cartName, price: Cart.priceDict[productToAdd.referenceName]!, quantity: quantityDesired) //not quantity desired is not relevant for search but it needs to be the right quantity because if the product is not present, 'findObject' will get added to the cart
                let itemIndex = Cart.cartObjects.firstIndex(of: findObject)
                if (itemIndex == nil) {
                    Cart.cartObjects.append(findObject) //add new checkout object
                } else {
                    Cart.cartObjects[itemIndex!].quantity += quantityDesired //add one to already existing checkout item
                }
                dismiss()
            }
            .padding()
            .background(.blue)
            .foregroundColor(.black)
            .cornerRadius(12)
        }
    }
}


