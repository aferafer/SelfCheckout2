
//  Products.swift
//  SelfCheckout
//
//  Created by Aidan Richards on 2022-05-29.
//

import Foundation
import SwiftUI

struct ProductType {
    var parentProduct: String //example: Beets
    var referenceName: String //example: Striped Beets
    var displayName: String
    var cartName: String
    var pic: String
}

extension ProductType {
    static let variationData: [ProductType] =
    [
        //****************Very important: parentProduct references the cartname of the parent and the cartnames of the suboptions from products are also referenced
        //unique types
        ProductType(parentProduct: "Beet Bunch", referenceName: "Boro_Beets", displayName: "Boro Beets", cartName: "Boro Beet Bag", pic: "boro_beets"),
        ProductType(parentProduct: "Beet Bunch", referenceName: "Striped_Beets", displayName: "Striped Beets", cartName: "Striped Beet Bag", pic: "striped_beets"),
        ProductType(parentProduct: "Beet Bunch", referenceName: "Cylindra_Beets", displayName: "Cylindra Beets", cartName: "Cylindra Beet Bag", pic: "cylindra_beets"),
        ProductType(parentProduct: "Beet Bunch", referenceName: "Golden_Beets", displayName: "Golden Beets", cartName: "Golden Beet Bag", pic: "golden_beets"),
        
        ProductType(parentProduct: "Beet Greens", referenceName: "Beet_Greens", displayName: "Beet Greens", cartName: "Beet Greens", pic: "beet_greens"),
        ProductType(parentProduct: "Beet Greens", referenceName: "Holey_Beetgreens", displayName: "Not a Perfect Leaf", cartName: "Not a Perfect Leaf Beet Greens", pic: "holey_beet_greens"),
        
        ProductType(parentProduct: "Granola", referenceName: "Small_Granola", displayName: "Regular Granola", cartName: "Regular Granola", pic: "small_granola"),
        ProductType(parentProduct: "Granola", referenceName: "Large_Granola", displayName: "Grain Free Granola", cartName: "Grain Free Granola", pic: "large_granola"),
        ProductType(parentProduct: "Onions", referenceName: "Onions", displayName: "Individual Onion", cartName: "Individual Onion", pic: "onions"),
        ProductType(parentProduct: "Onions", referenceName: "Onion_Bags", displayName: "Onion Bag", cartName: "Onion Bag", pic: "onion_bag"),
        
        ProductType(parentProduct: "Pepper", referenceName: "Green_Peppers", displayName: "Green Pepper", cartName: "Green Pepper", pic: "green_peppers"),
        ProductType(parentProduct: "Pepper", referenceName: "Colored_Peppers", displayName: "Colored Pepper", cartName: "Colored Pepper", pic: "colored_peppers"),
        ProductType(parentProduct: "Pepper", referenceName: "Pepper_Bag", displayName: "Pepper Bag", cartName: "Pepper Bag", pic: "pepper_bag"),
        
        ProductType(parentProduct: "Potatoes", referenceName: "Potato_Bag", displayName: "Potato Bag", cartName: "Potato Bag", pic: "potato_bag"),
        ProductType(parentProduct: "Potatoes", referenceName: "Potato_Basket", displayName: "Potato Basket", cartName: "Potato Basket", pic: "potato_basket"),
        
        ProductType(parentProduct: "Spinach", referenceName: "Spinach", displayName: "Spinach", cartName: "Spinach Bag", pic: "spinach"),
        ProductType(parentProduct: "Spinach", referenceName: "Holey_Spinach", displayName: "Not a Perfect Leaf Spinach", cartName: "Not a Perfect Leaf Spinach", pic: "holey_spinach"),
        
        ProductType(parentProduct: "Swiss Chard", referenceName: "Swiss_Chard", displayName: "Swiss Chard", cartName: "Swiss Chard", pic: "swiss_chard"),
        ProductType(parentProduct: "Swiss Chard", referenceName: "Holey_Swiss_Chard", displayName: "Not a Perfect Leaf", cartName: "Not a Perfect Leaf Swiss Chard", pic: "holey_swiss_chard"),
        
        ProductType(parentProduct: "Squash", referenceName: "Butternut_Squash", displayName: "Butternut Squash", cartName: "Butternut Squash", pic: "winter_squash"),
        ProductType(parentProduct: "Squash", referenceName: "Acorn_Squash", displayName: "Acorn Squash", cartName: "Acorn Squash", pic: "acorn_squash"),
        ProductType(parentProduct: "Squash", referenceName: "Spaghetti_Squash", displayName: "Spaghetti Squash", cartName: "Spaghetti Squash", pic: "spaghetti_squash"),
        ProductType(parentProduct: "Tomato", referenceName: "Beefsteak_Bag", displayName: "Beefsteak Bag", cartName: "Beefsteak Tomato Bag", pic: "beefsteak_bag"),
        ProductType(parentProduct: "Tomato", referenceName: "Beefsteak_Basket", displayName: "Beefsteak Basket", cartName: "Beefsteak Tomato Basket", pic: "beefsteak_basket"),
        ProductType(parentProduct: "Tomato", referenceName: "Yellow_Heirloom", displayName: "Yellow Heirloom", cartName: "Yellow Heirloom Tomatoes", pic: "yellow_heirloom_bag"),
        
        
        //unique sizes
        ProductType(parentProduct: "Carrot Bag", referenceName: "Small_Carrots", displayName: "Small Carrot Bag", cartName: "Small Carrot Bag", pic: "carrots"),
        ProductType(parentProduct: "Carrot Bag", referenceName: "Large_Carrots", displayName: "Large Carrot Bag", cartName: "Large Carrot Bag", pic: "carrots"),
        ProductType(parentProduct: "Melon", referenceName: "Small_Melons", displayName: "Small Melons", cartName: "Small Melon", pic: "melons"),
        ProductType(parentProduct: "Melon", referenceName: "Medium_Melons", displayName: "Medium Melons", cartName: "Medium Melon", pic: "melons"),
        ProductType(parentProduct: "Melon", referenceName: "Large_Melons", displayName: "Large Melons", cartName: "Large Melon", pic: "melons"),
        
        ProductType(parentProduct: "Honey", referenceName: "Wildflower_Honey", displayName: "Wildflower", cartName: "Wildflower Honey Jar", pic: "wildflower_honey"),
        ProductType(parentProduct: "Honey", referenceName: "White_Cream_Honey", displayName: "White Cream", cartName: "White Cream Honey Jar", pic: "white_cream_honey"),
        ProductType(parentProduct: "Honey", referenceName: "Cinamon_Cream_Honey", displayName: "Cinamon Cream", cartName: "Cinamon Cream Honey Jar", pic: "cinamon_cream_honey"),
    ]
}

