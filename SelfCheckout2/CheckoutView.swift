//
//  CheckoutView.swift
//  SelfCheckout
//
//  Created by Aidan Richards on 2022-06-01.
//

import SwiftUI
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

struct CheckoutView: View {
    //let db = Firestore.firestore()
    @ObservedObject var myCart: CheckoutClass
    @ObservedObject var appState: AppInfo
    @State private var showAlert = false
    @State private var transactionError = false
    @State private var displayMessage = "no message"
    @State var isLinkActive = false
    @Binding var productSearch: String
    //@FocusState private var keyBoardIsFocused: Bool
    let backgroundColor = Color(red: 102/255, green: 178/255, blue: 255/255)
    var body: some View {
        VStack {
            Text("Your Items")
                .underline()
            Divider()
            /*
            Group {
                HStack {
                    Spacer()
                    HStack {
                        TextField("Product Search", text: $productSearch)
                            .padding(40)
                            .focused($keyBoardIsFocused)
                            .frame(width: 210, height: 50)
                            .border(Color.black)
                            .onReceive(Just(productSearch)) { newValue in
                                //print(newValue)
                                let filtered = newValue.filter { "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ".contains($0) }
                                if filtered != newValue {
                                    self.productSearch = filtered
                                }
                                if (filtered == "") {
                                    keyBoardIsFocused = false //if all text in search bar has been deleted then minimize keyboard
                                }
                            }
                    }
                    .overlay(Image(systemName: "magnifyingglass")
                        .offset(x: -85))
                    Spacer()
                }
                //.padding(30)
                //.border(Color.black)
            }
            .onTapGesture {
                keyBoardIsFocused = true
            }
            */
            SearchBarView(productSearch: $productSearch)
            ScrollViewReader { scrollView in
                ScrollView {
                    VStack {
                        ForEach($myCart.cartObjects) { $item in
                            if (item.quantity > 0) {
                                CheckoutObjectView(myCart: myCart, item: $item)
                                    .id(myCart.cartObjects.count)
                            }
                        }
                    }
                }
                .onChange(of: myCart.cartObjects) { _ in
                    print("count: " + String(myCart.cartObjects.count))
                    scrollView.scrollTo(myCart.cartObjects.count)
                }
                if (myCart.cartObjects.count > 17) {
                    Text("Display space exceeded. Scroll down to view new checkout items")
                }
            }
            Spacer()
            HStack {
                Text("Your Total: ")
                Text("$" + String(format: "%.2f", myCart.totalPrice))
            }
            HStack {
                NavigationLink(destination: Text("OtherView"), isActive: $isLinkActive) {
                    Button {
                        if (myCart.totalPrice > 0) {
                            //writeToDatabase()
                            appState.appState = "paymentsPage"
                        }
                    } label: {
                        Text("Checkout")
                            .padding(10)
                            .foregroundColor(Color.black)
                            .background(Color.accentColor)
                            .cornerRadius(12)
                    }
                }
                Button {
                    //print(myCart.isAvailable)
                    //print(myCart.cartObjects)
                    myCart.cartObjects = []
                    myCart.totalPrice = 0
                    productSearch = ""
                } label: {
                    Text("Clear All")
                        .padding(10)
                        .foregroundColor(Color.black)
                        .background(Color.red)
                        .cornerRadius(12)
                }
            } //close HStack
        } //Close Vstack
        .background(backgroundColor)
        .padding(.top, 1)
    } //close body
}
