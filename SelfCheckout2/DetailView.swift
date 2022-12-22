//
//  DetailView.swift
//  SelfCheckout
//
//  Created by Aidan Richards on 2022-05-31.
//

import SwiftUI
import Combine

struct DetailView: View {
    @ObservedObject var myCart: CheckoutClass
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var customPrice: String = ""
    @Binding var searchText: String
    @State private var showingSheet = false
    @State var selectedProduct = ProductType.variationData[0] //product that has just been clicked on
    
    let product: Products
    let referenceNames = ProductType.variationData
    var body: some View {
        VStack {
            if (product.options == Products.customOptions.uniquePrice) {
                Text("Please Enter the Price For Your Item")
                    .bold()
                Spacer()
                    .frame(height: 50)
                VStack {
                    HStack {
                        TextField("input price", text: $customPrice, onEditingChanged: {(isBegin) in
                            if isBegin {
                                print("User has begun editing")
                            }
                        },
                                  onCommit: {
                            myCart.cartObjects.append(CartObject(cartName: product.cartName, price: customPrice, quantity: 1))
                            myCart.totalPrice += Double(customPrice)!
                            searchText = "" //clear search before returning to main screen
                            action: do { self.presentationMode.wrappedValue.dismiss() }
                        })
                            //.keyboardType(.numberPad)
                            .padding(20)
                            .frame(width: 240, height: 100)
                            .font(.largeTitle)
                            .border(Color.black)
                            .onReceive(Just(customPrice)) { newValue in
                                let filtered = newValue.filter { "0123456789.".contains($0) }
                                if filtered != newValue {
                                    self.customPrice = filtered
                                }
                            }
                    }
                }
            }
            if (product.options == Products.customOptions.uniqueTypes || product.options == Products.customOptions.uniqueSize) {
                Text("Please Select One of the Below Options")
                    .bold()
                Spacer()
                    .frame(height: 50)
                let parentType: String = product.cartName //beets, peppers etc. Used to find associated subtypes like golden beets or colored peppers
                HStack {
                    ForEach(referenceNames, id: \.referenceName) { productType in
                        if (productType.parentProduct == parentType) { //display all product variations for parent product
                            Spacer()
                            ProductTypeView(myCart: myCart, productVariation: productType).onTapGesture {
                                selectedProduct = productType
                                showingSheet.toggle()
                                }
                        }
                    } //ForEach
                    Spacer()
                } //HStack
            }
        } //VStack
        .sheet(isPresented: $showingSheet) {
            specialQuantitySelect(Cart: myCart, productToAdd: $selectedProduct).onDisappear(){
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    } //body
} //view

struct specialQuantitySelect: View { //special quantity select is to work with the subvariations in detail view
    @Environment(\.dismiss) var dismiss
    @State var quantityDesired: Int=1
    @ObservedObject var Cart: CheckoutClass
    @Binding var productToAdd: ProductType
    @State var quantityNumberFrameWidth = 55.00
    

    var body: some View {
        VStack {
            Text("How many " + productToAdd.displayName.lowercased() + " would you like to add to your cart?")
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
                Cart.totalPrice += Double(Cart.priceDict[productToAdd.referenceName]!)!
                let findObject = CartObject.init(cartName: productToAdd.cartName, price: Cart.priceDict[productToAdd.referenceName]!, quantity: quantityDesired)
                let itemIndex = Cart.cartObjects.firstIndex(of: findObject)
                if (itemIndex == nil) {
                    Cart.cartObjects.append(CartObject(cartName: productToAdd.cartName, price: Cart.priceDict[productToAdd.referenceName]!, quantity: quantityDesired)) //create new checkout object for item since none currently exist
                } else {
                    Cart.cartObjects[itemIndex!].quantity += 1 //add one to already existing checkout item
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



