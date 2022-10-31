//
//  productTypesView.swift
//  SelfCheckout
//
//  Created by Aidan Richards on 2022-06-12.
//

import SwiftUI

struct ProductTypeView: View {
    @ObservedObject var myCart: CheckoutClass
    let productVariation: ProductType
    var body: some View {
        VStack() {
            Image(productVariation.pic)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 150)
            Text(productVariation.displayName).foregroundColor(.black)
            Text(myCart.priceDict[productVariation.referenceName]!)
        }.background(Rectangle().fill(Color.white).shadow(radius: 2))
    }
}


