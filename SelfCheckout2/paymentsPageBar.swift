//
//  paymentsPageBar.swift
//  SelfCheckout
//
//  Created by Aidan Richards on 2022-07-06.
//

import SwiftUI

struct paymentsPageBar: View {
    @ObservedObject var appState: AppInfo
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .offset(x: 20, y: -60)
                    .foregroundColor(.black)
                if (appState.appState == "cashPage") {
                    Button("Return to payment choices") {
                        appState.appState = "paymentsPage"
                    }
                    .offset(x: 20, y: -60)
                    .foregroundColor(.black)

                } else {
                    Button("Return to shopping cart") {
                        appState.appState = "itemsPage"
                    }
                    .offset(x: 20, y: -60)
                    .foregroundColor(.black)

                }
                Spacer()
                Image("farm_logo")
                    .resizable()
                    .frame(width: 375, height: 135)
                    .offset(x: -100, y: 10)
                Spacer()
            } //close hstack
            .frame(width: .infinity, height: 175)
            .background(Color.green)
        } //close vstack
    } //close view
} //close body

struct paymentsPageBar_Previews: PreviewProvider {
    static var previews: some View {
        paymentsPageBar(appState: AppInfo.init())
    }
}
