//
//  cashThankyouView.swift
//  SelfCheckout
//
//  Created by Aidan Richards on 2022-08-26.
//

import SwiftUI

struct cardThankyouView: View {
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
        HStack {
            Spacer(minLength: 100)
            VStack {
                Spacer()
                Text("Please wait a moment for the payment terminal to receive your transaction. When the payment terminal screen becomes blue, follow the instructions on the terminal to complete your card payment. ")
                    .bold()
                    .font(.custom("San Francisco", size: 25))
                    .offset(x: 0, y: -20)
                Text("Thank you for coming to Am Braigh Farm!")
                    .bold()
                    .font(.custom("San Francisco", size: 25))
                    .offset(x: 0, y: 20)
                Spacer()
            }
            Spacer(minLength: 100)
        }
    } //close body
} //close view

struct cardThankyouView_Previews: PreviewProvider {
    static var previews: some View {
        cardThankyouView()
    }
}

