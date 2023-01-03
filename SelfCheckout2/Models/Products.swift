//
//  Products.swift
//  SelfCheckout
//
//  Created by Aidan Richards on 2022-05-29.
//

import Foundation
import SwiftUI

struct Products: Hashable {
    var displayTitle: String //what is displayed on product cards
    var cartName: String //what's displayed in checkout cart
    var referenceName: String //used to refer to product. Same as displayTitle but using _ for spaces. Uses Enums in AdminView for this
    var searchName: String //used in product searches - 'Cylindra Beets' becomes 'Beets Cylindra' or 'Small Carrot Bag' -> 'Carrot Small
    var pic: String
    
    
    enum productCatagory {
        case produce
        case preparedFoods
        case meats
        case retail
    }
    
    enum customOptions {
        case uniquePrice //used for meats with custom prices based on weight. Prelabelled
        case uniqueSize //example: small carrot bag vs large bag
        case uniqueTypes //examples: cherry tomatoes vs beefsteak tomatoes. Green peppers vs colored peppers
        case noOptions //no additional information needed
        case subVariation //Its set to this setting when it is a variation and to be displayed when the search bar is active
        case sectionTitle //unclickable tile that is the title for the product section: "meats, chef offerings etc"
    }
    
    var catagory: productCatagory
    var options: customOptions
}

extension Products {
    static let productData: [Products] =
    [
        //productCatagory.produce
        Products(displayTitle: "Eggs", cartName: "Dozen Eggs", referenceName: "Eggs", searchName: "eggs", pic: "eggs", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Arugula", cartName: "Arugula Bag", referenceName: "Arugula", searchName: "arugula", pic: "arugala", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Asparagus", cartName: "Asparagus Bunch", referenceName: "Asparagus", searchName: "asparagus", pic: "asparagus", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Basil", cartName: "Basil Bunch", referenceName: "Basil", searchName: "basil", pic: "basil", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Beets", cartName: "Beet Bunch", referenceName: "Beets", searchName: "beets", pic: "beets", catagory: productCatagory.produce, options: customOptions.uniqueTypes), //options
        Products(displayTitle: "Boro Beets", cartName: "Boro Beet Bunch", referenceName: "Boro_Beets", searchName: "beets boro", pic: "boro_beets", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Cylindra Beets", cartName: "Cylindra Beet Bunch", referenceName: "Cylindra_Beets", searchName: "beets cylindra", pic: "cylindra_beets", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Golden Beets", cartName: "Golden Beet Bunch", referenceName: "Golden_Beets", searchName: "beets golden", pic: "golden_beets", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Striped Beets", cartName: "Striped Beet Bunch", referenceName: "Striped_Beets", searchName: "beets candy striped", pic: "striped_beets", catagory: productCatagory.produce, options: customOptions.subVariation),
        //parent product Beet Greens
        Products(displayTitle: "Beet Greens", cartName: "Beet Greens", referenceName: "Beet_Greens", searchName: "beet greens", pic: "beet_greens", catagory: productCatagory.produce, options: customOptions.uniqueTypes),
        Products(displayTitle: "Beet Greens Regular", cartName: "Beet Green bag", referenceName: "Beet_Greens", searchName: "beet greens", pic: "beet_greens", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Not A Pefect Leaf Beet Greens", cartName: "Not A Pefect Leaf Beet Greens", referenceName: "Holey_Beetgreens", searchName: "beet greens", pic: "holey_beet_greens", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Bok Choy", cartName: "Bok Choy Bunch", referenceName: "Bok_Choy", searchName: "bok choy", pic: "bok_choy", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Broccoli", cartName: "Broccoli", referenceName: "Broccoli", searchName: "broccoli", pic: "broccoli", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Brussel Sprouts", cartName: "Brussel Sprouts", referenceName: "Brussel_Sprouts", searchName: "brussel sprouts", pic: "brussel_sprouts", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Butterhead Lettuce", cartName: "Butterhead Lettuce", referenceName: "Butterhead_Lettuce", searchName: "lettuce butterhead", pic: "butterhead_lettuce", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Cabbage", cartName: "Cabbage", referenceName: "Cabbage", searchName: "cabbage", pic: "cabbage", catagory: productCatagory.produce, options: customOptions.noOptions),
        //Products(displayTitle: "Green Cabbage", cartName: "Green Cabbage Bag", referenceName: "Cabbage", searchName: "cabbage green", pic: "cabbage", catagory: productCatagory.produce, options: customOptions.noOptions), add in a sec
        //Products(displayTitle: "Red Cabbage", cartName: "Red Cabbage", referenceName: "Red_Cabbage", searchName: "cabbage red", pic: "red_cabbage", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Carrots", cartName: "Carrot Bag", referenceName: "Carrots", searchName: "carrots", pic: "carrots", catagory: productCatagory.produce, options: customOptions.uniqueSize), //options
        Products(displayTitle: "Small Carrot Bag", cartName: "Small Carrot Bag", referenceName: "Small_Carrots", searchName: "carrots small", pic: "carrots", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Large Carrot Bag", cartName: "Large Carrot Bag", referenceName: "Large_Carrots", searchName: "carrots large", pic: "carrots", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Celariac", cartName: "Celariac", referenceName: "Celariac", searchName: "celariac", pic: "celariac", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Cherry Tomatoes", cartName: "Cherry Tomatoes", referenceName: "Cherry_Tomatoes", searchName: "cherry tomatoes", pic: "cherry", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Cilantro", cartName: "Cilantro Bunch", referenceName: "Cilantro", searchName: "cilantro", pic: "cilantro", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Cucumbers", cartName: "Cucumber", referenceName: "Cucumbers", searchName: "cucumbers", pic: "cucumbers", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Juicing Cucumbers", cartName: "Juicing Cucumber", referenceName: "Juicing_Cucumbers", searchName: "juicing cucumbers", pic: "juicing_cucumbers", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Dill", cartName: "Dill Bunch", referenceName: "Dill", searchName: "dill", pic: "dill", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Egg Plant", cartName: "Egg Plant", referenceName: "Egg_Plant", searchName: "egg plant", pic: "egg_plant", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Endives", cartName: "Endives Bag", referenceName: "Endives", searchName: "endive", pic: "endives", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Fennel", cartName: "Fennel", referenceName: "Fennel", searchName: "fennel", pic: "fennel", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Filet Beans", cartName: "Filet Bean Bag", referenceName: "Filet_Beans", searchName: "beans filet", pic: "filet_beans", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Garlic", cartName: "Garlic Bulb", referenceName: "Garlic", searchName: "garlic", pic: "garlic", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Green Onions", cartName: "Green Onions", referenceName: "Green_Onions", searchName: "green onions", pic: "green_onions", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Kale", cartName: "Kale Bunch", referenceName: "Kale", searchName: "kale", pic: "kale", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Kohlrabi", cartName: "Kohlrabi", referenceName: "Kohlrabi", searchName: "kohlrabi", pic: "kohlrabi", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Leeks", cartName: "Leek Bunch", referenceName: "Leeks", searchName: "leeks", pic: "leeks", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Melons", cartName: "Melon", referenceName: "Melons", searchName: "melons", pic: "melons", catagory: productCatagory.produce, options: customOptions.uniqueSize), //options
        Products(displayTitle: "Small Melons", cartName: "Small Melon", referenceName: "Small_Melons", searchName: "melon small", pic: "melons", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Medium Melons", cartName: "Medium Melon", referenceName: "Medium_Melons", searchName: "melon medium", pic: "melons", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Large Melons", cartName: "Large Melon", referenceName: "Large_Melons", searchName: "melon large", pic: "melons", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Microgreens", cartName: "Microgreen Bag", referenceName: "Microgreens", searchName: "microgreens", pic: "microgreens", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Onions", cartName: "Onions", referenceName: "Onions", searchName: "onions", pic: "onions", catagory: productCatagory.produce, options: customOptions.uniqueSize),
        Products(displayTitle: "Individual Onion", cartName: "Individual Onion", referenceName: "Onion", searchName: "onion", pic: "onions", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Onion Bag", cartName: "Onion Bag", referenceName: "Onion_Bags", searchName: "onion bag", pic: "onion_bag", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Parsley", cartName: "Parsley Bunch", referenceName: "Parsley", searchName: "parsley", pic: "parsley", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Parsnips", cartName: "Parsnip Bag", referenceName: "Parsnips", searchName: "parsnips", pic: "parsnips", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Pea Shoots", cartName: "Pea Shoots", referenceName: "Pea_Shoots", searchName: "pea shoots", pic: "pea_shoots", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Peppers", cartName: "Pepper", referenceName: "Peppers", searchName: "peppers", pic: "peppers", catagory: productCatagory.produce, options: customOptions.uniqueTypes), //options
        Products(displayTitle: "Colored Pepper", cartName: "Colored Pepper", referenceName: "Colored_Peppers", searchName: "peppers colored", pic: "colored_peppers", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Pepper Bag", cartName: "Pepper Bag", referenceName: "Pepper_Bag", searchName: "Mixed Pepper Bag", pic: "pepper_bag", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Green Pepper", cartName: "Green Pepper", referenceName: "Green_Peppers", searchName: "peppers green", pic: "green_peppers", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Potatoes", cartName: "Potatoes", referenceName: "Potatoes", searchName: "potatoes", pic: "potatoes", catagory: productCatagory.produce, options: customOptions.uniqueTypes),
        Products(displayTitle: "Potato Bag", cartName: "Potato Bag", referenceName: "Potato_Bag", searchName: "potato", pic: "potato_bag", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Potato Basket", cartName: "Potato Basket", referenceName: "Potato_Basket", searchName: "potato", pic: "potato_basket", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Pumpkins", cartName: "Pumpkin", referenceName: "Pumpkins", searchName: "pumpkins", pic: "pumpkins", catagory: productCatagory.produce, options: customOptions.uniquePrice),
        Products(displayTitle: "Radishes", cartName: "Radish Bunch", referenceName: "Radishes", searchName: "radishes", pic: "radishes", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Red & Green Bag", cartName: "Red & Green Bag", referenceName: "RedGreen_Headlettuce", searchName: "lettuce headlettuce bag", pic: "red&green_head_lettuce", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Romaine Lettuce", cartName: "Romaine Bag", referenceName: "Romaine_Lettuce", searchName: "lettuce romaine", pic: "romaine_lettuce", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Rutabaga", cartName: "Rutabaga Bag", referenceName: "Rutabaga", searchName: "rutabaga", pic: "rutabaga", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Salad Greens", cartName: "Salad Green Bag", referenceName: "Salad_Greens", searchName: "salad greens mixed", pic: "salad_greens", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Snow Peas", cartName: "Snow Pea Bag", referenceName: "Snow_Peas", searchName: "snow peas", pic: "snow_peas", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Spinach", cartName: "Spinach", referenceName: "Spinach", searchName: "spinach", pic: "spinach", catagory: productCatagory.produce, options: customOptions.uniqueTypes),
        Products(displayTitle: "Spinach Regular", cartName: "Spinach Bag", referenceName: "Spinach", searchName: "spinach", pic: "spinach", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Not a Perfect Leaf Spinach", cartName: "Not a Perfect Leaf Spinach", referenceName: "Holey_Spinach", searchName: "spinach", pic: "holey_spinach", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Squash", cartName: "Squash", referenceName: "Squash", searchName: "squash", pic: "winter_squash", catagory: productCatagory.produce, options: customOptions.uniquePrice),
        //Products(displayTitle: "Acorn Squash", cartName: "Acorn Squash", referenceName: "Acorn_Squash", searchName: "squash acorn", pic: "acorn_squash", catagory: productCatagory.produce, options: customOptions.subVariation),
        //Products(displayTitle: "Butternut Squash", cartName: "Butternut Squash", referenceName: "Butternut_Squash", searchName: "squash butternut", pic: "winter_squash", catagory: productCatagory.produce, options: customOptions.subVariation),
        //Products(displayTitle: "Spaghetti Squash", cartName: "Spaghetti Squash", referenceName: "Spaghetti_Squash", searchName: "squash spaghetti", pic: "spaghetti_squash", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Sweet Potatoes", cartName: "Sweet Potato Bag", referenceName: "Sweet_Potatoes", searchName: "sweet potatoes", pic: "sweet_potatoes", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Swiss Chard", cartName: "Swiss Chard", referenceName: "Swiss_Chard", searchName: "swiss chard", pic: "swiss_chard", catagory: productCatagory.produce, options: customOptions.uniqueTypes),
        Products(displayTitle: "Swiss Chard Regular", cartName: "Swiss Chard", referenceName: "Swiss_Chard", searchName: "swiss chard", pic: "swiss_chard", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Not a Perfect Leaf Swiss Chard", cartName: "Not a Perfect Leaf Swiss Chard", referenceName: "Holey_Swiss_Chard", searchName: "swiss chard", pic: "holey_swiss_chard", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Tatsoi", cartName: "Tatsoi Bunch", referenceName: "Tatsoi", searchName: "tatsoi", pic: "tatsoi", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Tomatoes", cartName: "Tomato", referenceName: "Tomatoes", searchName: "tomatoes", pic: "beefsteak", catagory: productCatagory.produce, options: customOptions.uniqueTypes),
        Products(displayTitle: "Yellow Heirloom Bag", cartName: "Yellow Heirloom", referenceName: "Yellow_Heirloom", searchName: "tomatoes yellow heirloom", pic: "yellow_heirloom_bag", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Beefsteak Bag", cartName: "Beefsteak Bag", referenceName: "Beefsteak_Bag", searchName: "tomatoes beefsteak", pic: "beefsteak_bag", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Beefsteak Basket", cartName: "Beefsteak Basket", referenceName: "Beefsteak_Basket", searchName: "tomatoes beefsteak", pic: "beefsteak_basket", catagory: productCatagory.produce, options: customOptions.subVariation),
        Products(displayTitle: "Turnips", cartName: "Turnip Bunch", referenceName: "Turnips", searchName: "turnips", pic: "turnips", catagory: productCatagory.produce, options: customOptions.noOptions),
        Products(displayTitle: "Zucchini", cartName: "Zucchini", referenceName: "Summer_Squash", searchName: "zucchini", pic: "summer_squash", catagory: productCatagory.produce, options: customOptions.noOptions),
        
        //productCatagory.preparedFoods
        Products(displayTitle: "Baba Ganoush", cartName: "Baba Ganoush", referenceName: "Baba_Ganoush", searchName: "baba ganoush", pic: "baba_ganoush", catagory: productCatagory.preparedFoods, options: customOptions.noOptions),
        Products(displayTitle: "Baklava", cartName: "Baklava", referenceName: "Baklava", searchName: "baklava", pic: "baklava", catagory: productCatagory.preparedFoods, options: customOptions.noOptions),
        Products(displayTitle: "Butter Chicken Curry", cartName: "Butter Chicken", referenceName: "Butter_Chicken_Curry", searchName: "butter chicken curry", pic: "butter_chicken_curry", catagory: productCatagory.preparedFoods, options: customOptions.noOptions),
        Products(displayTitle: "Carrot Cake", cartName: "Carrot Cake", referenceName: "Carrot_Cake", searchName: "carrot cake", pic: "carrot_cake", catagory: productCatagory.preparedFoods, options: customOptions.noOptions),
        Products(displayTitle: "Date Cookies", cartName: "Date Cookies", referenceName: "Date_Cookies", searchName: "date cookies", pic: "date_cookies", catagory: productCatagory.preparedFoods, options: customOptions.noOptions),
        Products(displayTitle: "Falafels", cartName: "Falafel Pack", referenceName: "Falafels", searchName: "falafels", pic: "falafel", catagory: productCatagory.preparedFoods, options: customOptions.noOptions),
        Products(displayTitle: "Garlic Scape Butter", cartName: "Garlic S. Butter", referenceName: "Garlic_Scape_Butter", searchName: "garlic scape butter", pic: "garlic_scape_butter", catagory: productCatagory.preparedFoods, options: customOptions.uniquePrice),
        Products(displayTitle: "Gazpacho", cartName: "Gazpacho", referenceName: "Gazpacho", searchName: "gazpacho", pic: "gazpacho", catagory: productCatagory.preparedFoods, options: customOptions.noOptions),
        Products(displayTitle: "Hummus", cartName: "Hummus", referenceName: "Hummus", searchName: "hummus", pic: "hummus", catagory: productCatagory.preparedFoods, options: customOptions.noOptions),
        Products(displayTitle: "Kabsa", cartName: "Kabsa", referenceName: "Kabsa", searchName: "kabsa", pic: "kabsa", catagory: productCatagory.preparedFoods, options: customOptions.uniquePrice),
        //Products(displayTitle: "Beef Lasagna", cartName: "Beef Lasagana Meal", referenceName: "Beef_Lasagna", searchName: "lasagna beef", pic: "beef_lasagna", catagory: productCatagory.preparedFoods, options: customOptions.noOptions),
        Products(displayTitle: "Kohlrabi Slaw", cartName: "Kohlrabi Slaw", referenceName: "Kohlrabi_Slaw", searchName: "kohlrabi slaw", pic: "kohlrabi_slaw", catagory: productCatagory.preparedFoods, options: customOptions.noOptions),
        Products(displayTitle: "Lasagna", cartName: "Lasagna Meal", referenceName: "Lasagna", searchName: "lasagna", pic: "lamb_lasagna", catagory: productCatagory.preparedFoods, options: customOptions.uniquePrice),
        Products(displayTitle: "Pickled Vegetables", cartName: "Pickled Vegetable Jar", referenceName: "Pickled_Vegetables", searchName: "pickled", pic: "pickled_carrots", catagory: productCatagory.preparedFoods, options: customOptions.uniquePrice),
        Products(displayTitle: "Pot Pie", cartName: "Pot Pie", referenceName: "Turkey_Pot_Pie", searchName: "pot pie", pic: "turkey_pot_pie", catagory: productCatagory.preparedFoods, options: customOptions.uniquePrice),
        Products(displayTitle: "Relish", cartName: "Relish Jar", referenceName: "Relish", searchName: "relish zucchini", pic: "zuchinni_relish", catagory: productCatagory.preparedFoods, options: customOptions.uniquePrice),
        Products(displayTitle: "Salsa", cartName: "Salsa Jar", referenceName: "Salsa", searchName: "salsa", pic: "salsa", catagory: productCatagory.preparedFoods, options: customOptions.noOptions),
        Products(displayTitle: "Samosas", cartName: "Samosas", referenceName: "Samosas", searchName: "samosas", pic: "samosas", catagory: productCatagory.preparedFoods, options: customOptions.noOptions),
        Products(displayTitle: "Sfeeha", cartName: "Sfeeha", referenceName: "Sfeeha", searchName: "sfeeha", pic: "sfeeha", catagory: productCatagory.preparedFoods, options: customOptions.noOptions),
        Products(displayTitle: "Soup", cartName: "Soup", referenceName: "Soup", searchName: "soup", pic: "soup", catagory: productCatagory.preparedFoods, options: customOptions.uniquePrice),
        Products(displayTitle: "Yalanji", cartName: "Yalanji", referenceName: "Yalanji", searchName: "yalangi", pic: "yalanji", catagory: productCatagory.preparedFoods, options: customOptions.noOptions),
        Products(displayTitle: "Chef Special", cartName: "Chef Special", referenceName: "Chef_Special", searchName: "chef special", pic: "chef_special", catagory: productCatagory.preparedFoods, options: customOptions.uniquePrice),
        
        //productCatagory.meats
        Products(displayTitle: "Beef Burgers", cartName: "Beef Burger Pack", referenceName: "Beef_Burgers", searchName: "burgers beef", pic: "beef_burgers", catagory: productCatagory.meats, options: customOptions.noOptions),
        Products(displayTitle: "Beef Sausage", cartName: "Beef Sausage", referenceName: "Beef_Sausage", searchName: "sausage beef", pic: "beef_sausage", catagory: productCatagory.meats, options: customOptions.noOptions),
        Products(displayTitle: "Chicken Wings", cartName: "Chicken Wings", referenceName: "Chicken_Wings", searchName: "chicken wings", pic: "chicken_wings", catagory: productCatagory.meats, options: customOptions.uniquePrice),
        Products(displayTitle: "Chicken Breasts", cartName: "Chicken Breasts", referenceName: "Chicken_Breasts", searchName: "chicken breasts", pic: "chicken_breasts", catagory: productCatagory.meats, options: customOptions.uniquePrice),
        Products(displayTitle: "Bone-in Chicken ", cartName: "Bone-in Chicken", referenceName: "Bonein_Chicken", searchName: "bone-in bonein chicken ", pic: "bone-in_chicken", catagory: productCatagory.meats, options: customOptions.uniquePrice),
        Products(displayTitle: "Chicken Drums", cartName: "Chicken Drums", referenceName: "Chicken_Drums", searchName: "chicken drums", pic: "chicken_drums", catagory: productCatagory.meats, options: customOptions.uniquePrice),
        Products(displayTitle: "Ground Chicken", cartName: "Ground Chicken", referenceName: "Ground_Chicken", searchName: "ground chicken", pic: "ground_chicken", catagory: productCatagory.meats, options: customOptions.uniquePrice),
        Products(displayTitle: "Whole Chicken", cartName: "Whole Chicken", referenceName: "Whole_Chicken", searchName: "chicken whole", pic: "whole_chicken", catagory: productCatagory.meats, options: customOptions.uniquePrice),
        Products(displayTitle: "Ground Beef", cartName: "Ground Beef Pack", referenceName: "Ground_Beef", searchName: "ground beef", pic: "ground_beef", catagory: productCatagory.meats, options: customOptions.noOptions),
        Products(displayTitle: "Roast", cartName: "Roast", referenceName: "Roast", searchName: "roast", pic: "roast", catagory: productCatagory.meats, options: customOptions.uniquePrice),
        Products(displayTitle: "Steak", cartName: "Steak", referenceName: "TBone_Steak", searchName: "steak tbone sirloin", pic: "tbone_steak", catagory: productCatagory.meats, options: customOptions.uniquePrice),
        Products(displayTitle: "Stewing Beef", cartName: "Stewing Beef Pack", referenceName: "Stewing_Beef", searchName: "stewing beef", pic: "stewing_beef", catagory: productCatagory.meats, options: customOptions.noOptions),
        
        //productCatagory.retail
        Products(displayTitle: "Baguette", cartName: "Baguette", referenceName: "Baguette", searchName: "baguette bread", pic: "baguette", catagory: productCatagory.retail, options: customOptions.noOptions),
        Products(displayTitle: "French Loaf", cartName: "French Loaf", referenceName: "French_Loaf", searchName: "french loaf bread", pic: "french_loaf", catagory: productCatagory.retail, options: customOptions.noOptions),
        Products(displayTitle: "Sourdough", cartName: "Sourdough", referenceName: "Sourdough", searchName: "sourdough bread", pic: "sourdough", catagory: productCatagory.retail, options: customOptions.noOptions),
        Products(displayTitle: "Cacao Powder", cartName: "Cacao Powder", referenceName: "Cacao_Powder", searchName: "giddy yo cacao powder", pic: "cacao_powder", catagory: productCatagory.retail, options: customOptions.noOptions),
        Products(displayTitle: "Cheese", cartName: "Cheese Pack", referenceName: "Cheese", searchName: "cheese", pic: "cheese", catagory: productCatagory.retail, options: customOptions.uniquePrice),
        Products(displayTitle: "Chocolate Bar", cartName: "Chocolate Bar", referenceName: "Chocolate_Bar", searchName: "chocolate bar", pic: "giddy_yo", catagory: productCatagory.retail, options: customOptions.noOptions),
        Products(displayTitle: "Coconut Yogurt", cartName: "Coconut Yogurt", referenceName: "Coconut_Yogurt", searchName: "yogurt coconut", pic: "coconut_yogurt", catagory: productCatagory.retail, options: customOptions.noOptions),
        Products(displayTitle: "Coffee", cartName: "Coffee Bean Bag", referenceName: "Coffee", searchName: "coffee", pic: "coffee_beans", catagory: productCatagory.retail, options: customOptions.noOptions),
        Products(displayTitle: "Granola", cartName: "Granola", referenceName: "Granola", searchName: "granola", pic: "small_granola", catagory: productCatagory.retail, options: customOptions.uniqueTypes),
        Products(displayTitle: "Small Granola", cartName: "Small Granola", referenceName: "Small_Granola", searchName: "small granola", pic: "small_granola", catagory: productCatagory.retail, options: customOptions.subVariation),
        Products(displayTitle: "Large Granola", cartName: "Large Granola", referenceName: "Large_Granola", searchName: "large_granola", pic: "large_granola", catagory: productCatagory.retail, options: customOptions.subVariation),
        Products(displayTitle: "Honey", cartName: "Honey", referenceName: "Honey", searchName: "honey", pic: "white_cream_honey", catagory: productCatagory.retail, options: customOptions.uniqueTypes),
        Products(displayTitle: "Small Icecream", cartName: "Small Icecream", referenceName: "Small_Icecream", searchName: "icecream small", pic: "small_icecream", catagory: productCatagory.retail, options: customOptions.noOptions),
        Products(displayTitle: "Large Icecream", cartName: "Large Icecream", referenceName: "Large_Icecream", searchName: "icecream large", pic: "large_icecream", catagory: productCatagory.retail, options: customOptions.noOptions),
        Products(displayTitle: "Wildflower Honey", cartName: "Wildflower Honey Jar", referenceName: "Wildflower_Honey", searchName: "honey wildflower", pic: "wildflower_honey", catagory: productCatagory.retail, options: customOptions.subVariation),
        Products(displayTitle: "White Cream Honey", cartName: "White Cream Honey Jar", referenceName: "White_Cream_Honey", searchName: "honey white cream", pic: "white_cream_honey", catagory: productCatagory.retail, options: customOptions.subVariation),
        Products(displayTitle: "Cinamon Cream Honey", cartName: "Cinamon Cream Honey Jar", referenceName: "Cinamon_Cream_Honey", searchName: "honey cinamon cream", pic: "cinamon_cream_honey", catagory: productCatagory.retail, options: customOptions.subVariation),
        Products(displayTitle: "Wood Oil", cartName: "Wood Oil", referenceName: "Wood_Oil", searchName: "wood oil", pic: "wood_oil", catagory: productCatagory.retail, options: customOptions.noOptions),
        Products(displayTitle: "Wooden Spoon", cartName: "Wooden Spoon", referenceName: "Wooden_Spoon", searchName: "wooden spoon", pic: "wooden_spoon", catagory: productCatagory.retail, options: customOptions.noOptions),
        Products(displayTitle: "Cutting Board", cartName: "Cutting Board", referenceName: "Cutting_Board", searchName: "cutting board wooden", pic: "cutting_board", catagory: productCatagory.retail, options: customOptions.uniquePrice),
        
    ]
}
