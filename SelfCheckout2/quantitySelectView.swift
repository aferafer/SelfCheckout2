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
    @State var quantityNumberFrameWidth = 55.00
    

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .offset(x: -300, y: -180)
                    .onTapGesture {
                        dismiss()
                    }
                Button("Return") {
                    dismiss()
                }
                .offset(x: -300, y: -180)
            }
            Text("How many " + productToAdd.displayTitle.lowercased() + " would you like to add to your cart?")
                .font(.system(size: 20))
            HStack {
                Spacer()
                Button("-") {
                    if (quantityDesired > 0) {
                        self.quantityDesired -= 1
                        if (quantityDesired == 9) { //decrease width from double digit to single digit spacing
                            quantityNumberFrameWidth = 55.00
                        }
                    }
                }
                .font(.system(size: 72))
                TextField("Quantity: ", value: $quantityDesired, formatter: NumberFormatter())
                    .disabled(true)
                    .font(.system(size: 100))
                    .frame(width: CGFloat(quantityNumberFrameWidth))
                Button("+") {
                    if (quantityDesired < 19) {
                        self.quantityDesired += 1
                        if (quantityDesired == 10) { //increase width to accomodate extra digit
                            quantityNumberFrameWidth = 110.00
                        }
                    }
                    
                }
                .font(.system(size: 72))
                Spacer()
            }
            Button("Add items to cart") {
                
                Cart.totalPrice += Double(Cart.priceDict[productToAdd.referenceName]!)! * Double(quantityDesired)
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


