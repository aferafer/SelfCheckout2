//
//  displayProductGroup.swift
//  SelfCheckout
//
//  Created by Aidan Richards on 2022-07-08.
//

import SwiftUI

struct displayProductGroup: View {
    let products: [Products]
    @ObservedObject var cartClass: CheckoutClass
    @Binding var searchText: String
    @State private var showingSheet = false
    @State var selectedProduct = Products.productData[0] //product that has just been clicked on
    var catagory: Products.productCatagory
    @Binding var clearKeyboard: Bool
    var rows = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        LazyHGrid(rows: rows, spacing: 10) { //
            ForEach(products, id: \.displayTitle) { product in
                if (product.catagory == catagory && cartClass.isAvailable[product.referenceName]! && product.options != Products.customOptions.subVariation) {
                    if (product.options != Products.customOptions.noOptions) {
                        NavigationLink(destination: DetailView(myCart: cartClass, searchText: $searchText, product: product)) {
                            CardView(product: product)
                                
                        }
                    } else {
                        CardView(product: product).onTapGesture {
                            clearKeyboard = true
                            selectedProduct = product
                            showingSheet.toggle()
                        }
                    } //end if-else
                } //end if
                
            } //end forEach
        } //end lazyHGrid
        .sheet(isPresented: $showingSheet) {
            quantitySelectView(Cart: cartClass, productToAdd: $selectedProduct)
        }
    }
}
