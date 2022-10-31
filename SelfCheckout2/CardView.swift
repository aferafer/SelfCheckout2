//
//  CardView.swift
//  SelfCheckout
//
//  Created by Aidan Richards on 2022-05-29.
//

import SwiftUI

struct CardView: View {
    let product: Products
    var body: some View {
        VStack() {
            Image(product.pic)
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 90)
            Text(product.displayTitle).foregroundColor(.black)
        }.background(Rectangle().fill(Color.white).shadow(radius: 2))
    }
}

struct CardView_Previews: PreviewProvider {
    static var product = Products.productData[0]
    static var previews: some View {
        CardView(product: product)
            .previewLayout(.fixed(width: 100, height: 400))
    }
}
