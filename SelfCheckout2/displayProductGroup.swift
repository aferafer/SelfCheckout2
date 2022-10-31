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
    var catagory: Products.productCatagory
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
                            searchText = "" //clear search after product has been selected
                            cartClass.totalPrice += Double(cartClass.priceDict[product.referenceName]!)!
                            let findObject = CartObject.init(cartName: product.cartName, price: cartClass.priceDict[product.referenceName]!, quantity: 1)
                            let itemIndex = cartClass.cartObjects.firstIndex(of: findObject)
                            if (itemIndex == nil) {
                                cartClass.cartObjects.append(findObject) //add new checkout object
                            } else {
                                cartClass.cartObjects[itemIndex!].quantity += 1 //add one to already existing checkout item
                            }
                        }
                    } //end if-else
                } //end if
                
            } //end forEach
        } //end lazyHGrid
    }
}
