//
//  cashThankyouView.swift
//  SelfCheckout
//
//  Created by Aidan Richards on 2022-08-26.
//

import SwiftUI

struct cashThankyouView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image("farm_logo")
                    .resizable()
                    .frame(width: 375, height: 135)
                    .offset(x: 0, y: 10)
                Spacer()
            } //close hstack
            .frame(width: .infinity, height: 175)
            .background(Color.green)
        } //close vstack
        Spacer()
        VStack {
            Spacer()
            Text("Thank you for coming to Am Braigh Farm!")
                .bold()
                .font(.custom("San Francisco", size: 25))
                .offset(x: 0, y: -20)
            Text("Your purchase has been recorded")
                .bold()
                .font(.custom("San Francisco", size: 25))
                .offset(x: 0, y: 20)
            Spacer()
        }
    } //close body
} //close view

struct cashThankyouView_Previews: PreviewProvider {
    static var previews: some View {
        cardThankyouView()
    }
}

