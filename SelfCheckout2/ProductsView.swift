//
//  ScrumsView.swift
//  SelfCheckout
//
//  Created by Aidan Richards on 2022-05-29.
//

import SwiftUI
 

struct ProductsView: View {
    let products: [Products]
    @ObservedObject var cartClass: CheckoutClass
    @ObservedObject var appState: AppInfo
    @State var total: Double
    @State var searchText = ""
    @State private var showingSheet = false
    @State var selectedProduct = Products.productData[0] //product that has just been clicked on
    @State var clearKeyboard = false //tells searchBarView to clear keyboard when an item has been clicked
    
    var searchRows = [ //only two rows should be displayed when using the product search bar due to keyboard covering content
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        //NavigationView {
        GeometryReader { _ in
            VStack {
                Spacer()
                    .frame(height: 10)
                VStack{
                    HStack {
                        Spacer()
                        Text("Produce")
                            .bold()
                        Spacer()
                        Text("Made With Am Braigh Ingredients")
                            .bold()
                        Spacer()
                        Text("Local Products")
                            .bold()
                        Spacer()
                    }
                    Spacer()
                        .frame(height: 25)
                    Text("Scroll sideways to view full selection of products")
                        .bold()
                        .font(.custom("San Francisco", size: 25))
                }
                .contentShape(Rectangle()) //used to make sure spacer() space can be clicked on
                .onTapGesture {
                    clearKeyboard = true
                }
                HStack  { //outer
                    ScrollViewReader { scrollView in
                        ScrollView(.horizontal) {
                            HStack {
                                if (searchText == "") { //If nothing is typed in product search bar
                                    displayProductGroup(products: products, cartClass: cartClass, searchText: $searchText, catagory: Products.productCatagory.produce, clearKeyboard: $clearKeyboard, titleImage: "eggs_and_produce")
                                    Spacer(minLength: 70)
                                    displayProductGroup(products: products, cartClass: cartClass, searchText: $searchText, catagory: Products.productCatagory.meats, clearKeyboard: $clearKeyboard, titleImage: "meats")
                                    Spacer(minLength: 70)
                                    displayProductGroup(products: products, cartClass: cartClass, searchText: $searchText, catagory: Products.productCatagory.preparedFoods, clearKeyboard: $clearKeyboard, titleImage: "prepared_foods")
                                    Spacer(minLength: 70)
                                    displayProductGroup(products: products, cartClass: cartClass, searchText: $searchText, catagory: Products.productCatagory.retail, clearKeyboard: $clearKeyboard, titleImage: "retail")
                                    
                                } else { //else if something has been typed into the product search bar
                                    LazyHGrid(rows: searchRows, spacing: 10) {
                                        ForEach(products, id: \.displayTitle) { product in
                                            if (cartClass.isAvailable[product.referenceName]! && product.searchName.hasPrefix(searchText.lowercased()) && (product.options != Products.customOptions.uniqueTypes) && (product.options != Products.customOptions.uniqueSize)) {
                                                if ((product.options != Products.customOptions.noOptions) && (product.options != Products.customOptions.subVariation)) {
                                                    NavigationLink(destination: DetailView(myCart: cartClass, searchText: $searchText, product: product).onDisappear() {
                                                        searchText = ""
                                                    }) {
                                                        CardView(product: product)
                                                            .id(product)
                                                    }
                                                } else {
                                                    CardView(product: product).id(product).onTapGesture {
                                                        selectedProduct = product
                                                        showingSheet.toggle()
                                                        searchText = "" //clear search after product has been selected
                                                    }
                                                } //end if-else
                                            } //close outer if statement
                                        } //close 'product search' ForEach used to display products highly relevant to search
                                        ForEach(products, id: \.displayTitle) { product in
                                            if (cartClass.isAvailable[product.referenceName]! && product.searchName.contains(searchText.lowercased()) &&  !product.searchName.hasPrefix(searchText.lowercased()) && (product.options != Products.customOptions.uniqueTypes) && (product.options != Products.customOptions.uniqueSize)) {
                                                if ((product.options != Products.customOptions.noOptions) && (product.options != Products.customOptions.subVariation)) {
                                                    NavigationLink(destination: DetailView(myCart: cartClass, searchText: $searchText, product: product).onDisappear() {
                                                        searchText = ""
                                                    }) {
                                                        CardView(product: product)
                                                            .id(product)
                                                    }
                                                } else {
                                                    CardView(product: product).id(product).onTapGesture {
                                                        selectedProduct = product
                                                        showingSheet.toggle()
                                                        searchText = ""
                                                    }
                                                } //end if-else
                                            } //close outer if statement
                                        } //close 'product search' ForEach used to display products less relevant to search
                                    } //close 'product search' lazyHGrid
                                } //close if-else that decides how to display products depending on if the product search bar is being used
                            } //close HStack containing scrollable product sections
                            .sheet(isPresented: $showingSheet) {
                                quantitySelectView(Cart: cartClass, productToAdd: $selectedProduct)
                            }
                            if (searchText != "") { //if product search bar is active push products to top of screen so they're visible
                                Spacer(minLength: 425)
                            }
                        } //close scrollview
                        .onChange(of: searchText) { changedText in
                            print("Text changed to \(changedText)!")
                            print("product: " + findFirstProduct().displayTitle)
                            let scrollBeggining = findFirstProduct()
                            scrollView.scrollTo(scrollBeggining)
                        }
                    } //close scrollview reader
                    .navigationBarTitle("Go back without purchasing").navigationBarHidden(true)
                        .statusBar(hidden: true)
                    CheckoutView(myCart: cartClass, appState: appState, productSearch: $searchText, clearKeyboard: $clearKeyboard)
                        .frame(width: 240, height: .infinity, alignment: .topTrailing)
                } //close HStack containing 3 product sections
                .contentShape(Rectangle()) //used to make sure spacer() space can be clicked on
                .onTapGesture {
                    clearKeyboard = true
                }
            } //close VStack containing entire view
        } //close geometry reader
        .ignoresSafeArea(.keyboard, edges: .all)
    } //body close
    
    //determines first product displayed when starting to use search bar
func findFirstProduct() -> Products {
    var itemAttempt = 0
    while ((itemAttempt < Products.productData.count-1)) { //high priority matches
        let productN = Products.productData[itemAttempt]//current product be checked to see if its displayed
        let productAvailable = cartClass.isAvailable[productN.referenceName]!
        let prefixMatch = productN.searchName.hasPrefix(searchText.lowercased())
        let isParentType = (productN.options == Products.customOptions.uniqueTypes) || (productN.options == Products.customOptions.uniqueSize)
        if (productAvailable && prefixMatch && !isParentType) { //then product is currently displayed
            return Products.productData[itemAttempt] //returns first item to be scrolled to
        } else {
            //print(productN.displayTitle + "item not displayed")
        }
        itemAttempt += 1
    } //close while
    itemAttempt = 0
    //Second while loop looks to see if there's a low priority search match
    while ((itemAttempt < Products.productData.count-1)) {
        let productN = Products.productData[itemAttempt]//current product be checked to see if its displayed
        let productAvailable = cartClass.isAvailable[productN.referenceName]!
        let doesContain = productN.searchName.contains(searchText.lowercased())
        let isParentType = (productN.options == Products.customOptions.uniqueTypes) || (productN.options == Products.customOptions.uniqueSize)
        if (productAvailable && doesContain && !isParentType) { //then product is currently displayed
            return Products.productData[itemAttempt] //returns first item to be scrolled to
        } else {
            //print(productN.displayTitle + "item not displayed")
        }
        itemAttempt += 1
    } //close while
    return Products(displayTitle: "error", cartName: "error", referenceName: "error", searchName: "error", pic: "error", catagory: Products.productCatagory.preparedFoods, options: Products.customOptions.noOptions)
    } //function close
} //view close
