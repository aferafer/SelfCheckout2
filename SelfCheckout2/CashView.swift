//
//  CashView.swift
//  SelfCheckout
//
//  Created by Aidan Richards on 2022-07-07.
//

import SwiftUI
//import SquarePointOfSaleSDK
import Foundation
import Firebase
//import FirebaseFunctions
import FirebaseFirestore
import FirebaseFirestoreSwift

struct CashView: View {
    @ObservedObject var appState: AppInfo
    @ObservedObject var myCart: CheckoutClass
    //lazy var functions = Functions.functions()
    let db = Firestore.firestore()
    var body: some View {
        paymentsPageBar(appState: appState)
        Spacer()
        Text("Please deposit your cash in the cash box, making change for youself as needed. Please press the 'Confirm Purchase' button when you are done to record your purchase or press 'return' in the upper left hand corner to return to the previous screen.")
            .padding(.leading, 100)
            .padding(.trailing, 100)
        Spacer()
        Text("Your total is $" + String(format: "%.2f", myCart.totalPrice)).bold().font(.custom("San Francisco", size: 25)).offset(y: -50)
        Spacer()
        Button {
            db.collection("transactions").addDocument(data: createPurchaseString(paymentType: 3))
            
            myCart.cartObjects = []
            myCart.totalPrice = 0
            appState.appState = "cashThankyouPage"
        } label: {
            Text("Confirm Purchase")
                .font(.custom("San Francisco", size: 20))
                .padding(25)
                .foregroundColor(Color.black)
                .background(Color.accentColor)
                .cornerRadius(20)
        }.offset(y:-50)
        Spacer()
        
    }
    
    func createPurchaseString(paymentType: Int) -> [String: Any]{
        var purchaseList = [String:Int]()
        let seconds = Date().timeIntervalSince1970
        purchaseList["transactionOrder"] = Int(seconds)
        purchaseList["payment type"] = 3
        purchaseList["CashTotal"] = Int(Float(myCart.totalPrice) * 100)
        for purchaseItem in myCart.cartObjects {
            purchaseList[purchaseItem.cartName] = purchaseItem.quantity * Int((Float(purchaseItem.price)!) * 100)
        }
        return purchaseList
    }
}
