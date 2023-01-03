//
//  sectionTitleView.swift
//  SelfCheckout2
//
//  Created by Aidan Richards on 2023-01-03.
//

import SwiftUI

struct sectionTitleView: View {
    let titleImage: String
    var body: some View {
        VStack() {
            Image(titleImage)
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 120)
            //Text(product.displayTitle).foregroundColor(.black)
        }.background(Rectangle().fill(Color.white).shadow(radius: 2))
    }
}

