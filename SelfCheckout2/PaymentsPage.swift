//
//  paymentsPage.swift
//  SelfCheckout
//
//  Created by Aidan Richards on 2022-07-06.
//

import SwiftUI
import Foundation
//import SquarePointOfSaleSDK
import Firebase
//import FirebaseFunctions
import FirebaseFirestore
import FirebaseFirestoreSwift

struct PaymentsPage: View {
    @ObservedObject var appState: AppInfo
    @ObservedObject var myCart: CheckoutClass
    //lazy var functions = Functions.functions()
    let db = Firestore.firestore()
    var body: some View {
        VStack {
            paymentsPageBar(appState: appState)
            Spacer()
            Text("How would you like to pay today?")
                .font(.system(size: 25))
            Spacer()
            HStack {
                Spacer()
                VStack {
                    VStack() {
                        Image("credit")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 90)
                        Text("credit").foregroundColor(.black)
                    }.background(Rectangle().fill(Color.white).shadow(radius: 2))
                    Text("(2.4% Surcharge)").bold().offset(y:10)
                }.offset(y:10).onTapGesture {
                    print("before: " + String(myCart.totalPrice))
                    print("after: " + String(myCart.totalPrice))
                    //makePayment(dollarAmount: myCart.totalPrice * 1.035)
                    db.collection("transactions").addDocument(data: createPurchaseString(paymentType: 1))
                    myCart.cartObjects = []
                    myCart.totalPrice = 0
                    appState.appState = "cardThankyouPage"
                }
                Spacer()
                VStack() {
                    Image("interac")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height: 90)
                    Text("debit").foregroundColor(.black)
                }.background(Rectangle().fill(Color.white).shadow(radius: 2)).onTapGesture {
                    //makePayment(dollarAmount: myCart.totalPrice)
                    db.collection("transactions").addDocument(data: createPurchaseString(paymentType: 2))
                    myCart.cartObjects = []
                    myCart.totalPrice = 0
                    appState.appState = "cardThankyouPage"
                }
                Spacer()
                VStack() {
                    Image("cash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height: 90)
                    Text("cash").foregroundColor(.black)
                }.background(Rectangle().fill(Color.white).shadow(radius: 2)).onTapGesture {
                    //db.collection("transactions").addDocument(data: ["total": Int(Float(myCart.totalPrice) * 100), "purchase string": createPurchaseString()])
                    appState.appState = "cashPage"
                }
                Spacer()
            }.offset(y:-60)
            Spacer()
        }
    }
    
    /*
    func makePayment(dollarAmount: Double) {
        //let purchaseString = createPurchaseString()
        var centAmount = Int(dollarAmount*100)
        //myCart.totalPrice = 0 //reset total
        //myCart.cartObjects = [] //empty cart
                // Replace with your app's URL scheme.
        let callbackURL = URL(string: "SelfCheckout://")!
                // Your client ID is the same as your Square Application ID.
                // Note: You only need to set your client ID once, before creating your first request.
        SCCAPIRequest.setApplicationID("sq0idp-LoMFQygUZp-dJvfaO2EN4w")
        do {
            // Specify the amount of money to charge.
            let money = try SCCMoney(amountCents: centAmount, currencyCode: "CAD")
            print("new transaction made")
            // Create the request.
            let apiRequest =
                try SCCAPIRequest(
                    callbackURL: callbackURL,
                    amount: money,
                    userInfoString: nil,
                    locationID: nil,
                    notes: "food purchase",
                    customerID: nil,
                    supportedTenderTypes: .card,
                    clearsDefaultFees: false,
                    returnsAutomaticallyAfterPayment: true,
                    disablesKeyedInCardEntry: true,
                    skipsReceipt: true
                )
            // Open Point of Sale to complete the payment.
            try SCCAPIConnection.perform(apiRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    } //close function
     */
    
    //creates string that contains data from purchase to be sent to square and included in purchase notes section
    func createPurchaseString(paymentType: Int) -> [String: Any] {
        var purchaseList = [String:Int]()
        var itemsAdded: [CartObject] = []
        let seconds = Date().timeIntervalSince1970
        purchaseList["transactionOrder"] = Int(seconds)
        if (paymentType == 1) {
            purchaseList["total"] = Int(Float(myCart.totalPrice) * 102.4) //2.4% surcharge on credit payments
                purchaseList["payment type"] = 1
        }
        if (paymentType == 2) {
            purchaseList["total"] = Int(Float(myCart.totalPrice) * 100)
            purchaseList["payment type"] = 2
        }
        for purchaseItem in myCart.cartObjects {
            if ((itemsAdded).contains(purchaseItem)) { //combine custom price values
                print("to start: purchase item price is")
                print(purchaseItem.price)
                let itemIndex = itemsAdded.firstIndex(of: purchaseItem)!
                let oldItem = itemsAdded[itemIndex] //save old item to be deleted
                print("old item price: " + String(oldItem.price))
                let oldItemPrice = Int(oldItem.price)! //price of the old item
                let newItemPrice = Int((Float(purchaseItem.price)!) * 100)
                itemsAdded.remove(at: itemIndex)
                let combinedPrice = oldItemPrice + newItemPrice //add old items price
                var purchaseItemCopy = purchaseItem //copy of purchase item
                purchaseItemCopy.price = String(combinedPrice)
                itemsAdded.append(purchaseItemCopy)
                //print(purchaseItemCopy)
                //print(purchaseItemCopy.price)
                purchaseList[purchaseItemCopy.cartName] = nil //remove from actual dictionary as well
                purchaseList[purchaseItemCopy.cartName] = combinedPrice //updated value with new price
            } else { //add new product as usual
                var purchaseItemCopy2 = purchaseItem
                purchaseItemCopy2.price = String(Int((Float(purchaseItem.price)!) * 100))
                itemsAdded.append(purchaseItemCopy2)
                
                purchaseList[purchaseItem.cartName] = purchaseItem.quantity * Int((Float(purchaseItem.price)!) * 100)
            }
        }
        print("look here:")
        print(purchaseList)
        return purchaseList
    }
}


