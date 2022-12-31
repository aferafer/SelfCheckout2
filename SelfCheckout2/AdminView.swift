//
//  SwiftUIView.swift
//  SelfCheckout
//
//  Created by Aidan Richards on 2022-06-18.
//

import SwiftUI



struct AdminView: View {
    var products: [Products]
    @ObservedObject var cartData: CheckoutClass
    @ObservedObject var Switch: AppInfo
    
    func toReference(priceEnum: price) -> String {
        //converts a price Enum to a product reference String. Example: price.PCarrots returns "Carrots"
        var stringForm = priceEnum.rawValue
        stringForm.remove(at: stringForm.startIndex)
        return stringForm
    }
        
    //whether or not item is available and should be displayed
    @AppStorage(isVisible.Carrots.rawValue) var CarrotsVisible = true //options
    @AppStorage(isVisible.Small_Carrots.rawValue) var SmallCarrotsVisible = true
    @AppStorage(isVisible.Large_Carrots.rawValue) var LargeCarrotsVisible = true
    //@AppStorage(isVisible.Head_Lettuce.rawValue) var HeadLettuceVisible = true
    @AppStorage(isVisible.Salad_Greens.rawValue) var SaladGreensVisible = true
    @AppStorage(isVisible.Kale.rawValue) var KaleVisible = true
    @AppStorage(isVisible.Swiss_Chard.rawValue) var SwissChardVisible = true
    @AppStorage(isVisible.Beets.rawValue) var BeetsVisible = true
    @AppStorage(isVisible.Leeks.rawValue) var LeeksVisible = true
    @AppStorage(isVisible.Spinach.rawValue) var SpinachVisible = true
    @AppStorage(isVisible.Tomatoes.rawValue) var TomatoesVisible = true
    @AppStorage(isVisible.Beefsteak_Bag.rawValue) var BeefsteakBagVisible = true
    @AppStorage(isVisible.Beefsteak_Basket.rawValue) var BeefsteakBasketVisible = true
    @AppStorage(isVisible.Yellow_Heirloom.rawValue) var YellowHeirloomVisible = true
    @AppStorage(isVisible.Cherry_Tomatoes.rawValue) var CherryTomatoesVisible = true
    @AppStorage(isVisible.Peppers.rawValue) var PeppersVisible = true
    @AppStorage(isVisible.Green_Peppers.rawValue) var GreenPeppersVisible = true
    @AppStorage(isVisible.Colored_Peppers.rawValue) var ColoredPeppersVisible = true
    @AppStorage(isVisible.Egg_Plant.rawValue) var EggPlantVisible = true
    @AppStorage(isVisible.Cucumbers.rawValue) var CucumbersVisible = true
    @AppStorage(isVisible.Parsley.rawValue) var ParsleyVisible = true
    @AppStorage(isVisible.Cilantro.rawValue) var CilantroVisible = true
    @AppStorage(isVisible.Dill.rawValue) var DillVisible = true
    @AppStorage(isVisible.Basil.rawValue) var BasilVisible = true
    @AppStorage(isVisible.Fennel.rawValue) var FennelVisible = true
    @AppStorage(isVisible.Kohlrabi.rawValue) var KohlrabiVisible = true
    @AppStorage(isVisible.Green_Onions.rawValue) var GreenOnionsVisible = true
    @AppStorage(isVisible.Garlic.rawValue) var GarlicVisible = true
    @AppStorage(isVisible.Onion.rawValue) var OnionVisible = true
    @AppStorage(isVisible.Onions.rawValue) var OnionsVisible = true
    @AppStorage(isVisible.Summer_Squash.rawValue) var SummerSquashVisible = true
    @AppStorage(isVisible.Squash.rawValue) var SquashVisible = true
    @AppStorage(isVisible.Melons.rawValue) var MelonsVisible = true
    @AppStorage(isVisible.Small_Melons.rawValue) var SmallMelonsVisible = true
    @AppStorage(isVisible.Medium_Melons.rawValue) var MediumMelonsVisible = true
    @AppStorage(isVisible.Large_Melons.rawValue) var LargeMelonsVisible = true
    @AppStorage(isVisible.Snow_Peas.rawValue) var SnowPeasVisible = true
    @AppStorage(isVisible.Microgreens.rawValue) var MicrogreensVisible = true
    @AppStorage(isVisible.Radishes.rawValue) var RadishesVisible = true
    @AppStorage(isVisible.Turnips.rawValue) var TurnipsVisible = true
    @AppStorage(isVisible.Cabbage.rawValue) var CabbageVisible = true
    @AppStorage(isVisible.Potatoes.rawValue) var PotatoesVisible = true
    @AppStorage(isVisible.Potato_Bag.rawValue) var PotatoBagVisible = true
    @AppStorage(isVisible.Arugula.rawValue) var ArugulaVisible = true
    @AppStorage(isVisible.Asparagus.rawValue) var AsparagusVisible = true
    @AppStorage(isVisible.Tatsoi.rawValue) var TatsoiVisible = true
    @AppStorage(isVisible.Bok_Choy.rawValue) var Bok_ChoyVisible = true
    @AppStorage(isVisible.Broccoli.rawValue) var BroccoliVisible = true
    @AppStorage(isVisible.Celariac.rawValue) var CelariacVisible = true
    @AppStorage(isVisible.Brussel_Sprouts.rawValue) var Brussel_SproutsVisible = true
    @AppStorage(isVisible.Endives.rawValue) var EndivesVisible = true
    @AppStorage(isVisible.Parsnips.rawValue) var ParsnipsVisible = true
    @AppStorage(isVisible.Pumpkins.rawValue) var PumpkinsVisible = true
    @AppStorage(isVisible.Rutabaga.rawValue) var RutabagaVisible = true
    @AppStorage(isVisible.Sweet_Potatoes.rawValue) var Sweet_PotatoesVisible = true
    @AppStorage(isVisible.Butterhead_Lettuce.rawValue) var Butterhead_LettuceVisible = true
    @AppStorage(isVisible.RedGreen_Headlettuce.rawValue) var RedGreen_HeadlettuceVisible = true
    @AppStorage(isVisible.Onion_Bags.rawValue) var Onion_BagsVisible = true
    @AppStorage(isVisible.Filet_Beans.rawValue) var Filet_BeansVisible = true
    @AppStorage(isVisible.Eggs.rawValue) var EggsVisible = true
    @AppStorage(isVisible.Beet_Greens.rawValue) var Beet_GreensVisible = true
    @AppStorage(isVisible.Romaine_Lettuce.rawValue) var Romaine_LettuceVisible = true
    
    @AppStorage(isVisible.Salsa.rawValue) var SalsaVisible = true
    //@AppStorage(isVisible.Phil_Sauce.rawValue) var PhilSauceVisible = true
    //@AppStorage(isVisible.Pickled_Onions.rawValue) var PickledOnionsVisible = true
    @AppStorage(isVisible.Soup.rawValue) var SoupVisible = true
    //@AppStorage(isVisible.Pickled_Beets.rawValue) var PickledBeetsVisible = true
    @AppStorage(isVisible.Pickled_Vegetables.rawValue) var PickledVegetablesVisible = true
    //@AppStorage(isVisible.Sweet_Carrots.rawValue) var SweetCarrotsVisible = true
    @AppStorage(isVisible.Lasagna.rawValue) var LasagnaVisible = true
    @AppStorage(isVisible.Carrot_Cake.rawValue) var CarrotCakeVisible = true
    @AppStorage(isVisible.Baguette.rawValue) var BaguetteVisible = true
    @AppStorage(isVisible.Cheese.rawValue) var CheeseVisible = true
    @AppStorage(isVisible.Chicken.rawValue) var ChickenVisible = true
    @AppStorage(isVisible.Coffee.rawValue) var CoffeeVisible = true
    @AppStorage(isVisible.Ground_Beef.rawValue) var GroundBeefVisible = true
    @AppStorage(isVisible.Stewing_Beef.rawValue) var StewingBeefVisible = true
    @AppStorage(isVisible.Whole_Chicken.rawValue) var WholeChickenVisible = true
    
    //@AppStorage(isVisible.Dill_Carrots.rawValue) var Dill_CarrotsVisible = true
    //@AppStorage(isVisible.Pickled_Asparagus.rawValue) var Pickled_AsparagusVisible = true
    @AppStorage(isVisible.Red_Onion_Jam.rawValue) var Red_Onion_JamVisible = true
    //@AppStorage(isVisible.Pickled_Cauliflower.rawValue) var Pickled_CauliflowerVisible = true
    @AppStorage(isVisible.Relish.rawValue) var RelishVisible = true
    @AppStorage(isVisible.Beef_Burgers.rawValue) var Beef_BurgersVisible = true
    @AppStorage(isVisible.Wildflower_Honey.rawValue) var Wildflower_HoneyVisible = true
    @AppStorage(isVisible.White_Cream_Honey.rawValue) var White_Cream_HoneyVisible = true
    @AppStorage(isVisible.Chocolate_Bar.rawValue) var Chocolate_BarVisible = true
    @AppStorage(isVisible.Cinamon_Cream_Honey.rawValue) var Cinamon_Cream_HoneyVisible = true
    @AppStorage(isVisible.Honey.rawValue) var HoneyVisible = true
    
    @AppStorage(isVisible.French_Loaf.rawValue) var French_LoafVisible = true
    @AppStorage(isVisible.Baba_Ganoush.rawValue) var Baba_GanoushVisible = true
    @AppStorage(isVisible.TBone_Steak.rawValue) var TBone_SteakVisible = true
    @AppStorage(isVisible.Yalanji.rawValue) var YalanjiVisible = true
    @AppStorage(isVisible.Date_Cookies.rawValue) var Date_CookiesVisible = true
    @AppStorage(isVisible.Turkey_Pot_Pie.rawValue) var Turkey_Pot_PieVisible = true
    @AppStorage(isVisible.Beef_Sausage.rawValue) var Beef_SausageVisible = true
    @AppStorage(isVisible.Butter_Chicken_Curry.rawValue) var Butter_Chicken_CurryVisible = true
    //@AppStorage(isVisible.Beef_Lasagna.rawValue) var Beef_LasagnaVisible = true
    @AppStorage(isVisible.Chutney.rawValue) var ChutneyVisible = true
    @AppStorage(isVisible.Kabsa.rawValue) var KabsaVisible = true
    @AppStorage(isVisible.Samosas.rawValue) var SamosasVisible = true
    @AppStorage(isVisible.Coconut_Yogurt.rawValue) var Coconut_YogurtVisible = true
    @AppStorage(isVisible.Falafels.rawValue) var FalafelsVisible = true
    
    @AppStorage(isVisible.Pepper_Bag.rawValue) var Pepper_BagsVisible = true
    @AppStorage(isVisible.Juicing_Cucumbers.rawValue) var Juicing_CucumbersVisible = true
    @AppStorage(isVisible.Baklava.rawValue) var BaklavaVisible = true
    @AppStorage(isVisible.Hummus.rawValue) var HummusVisible = true
    @AppStorage(isVisible.Sfeeha.rawValue) var SfeehaVisible = true
    @AppStorage(isVisible.Garlic_Scape_Butter.rawValue) var Garlic_Scape_ButterVisible = true
    @AppStorage(isVisible.Gazpacho.rawValue) var GazpachoVisible = true
    @AppStorage(isVisible.Chicken_Breasts.rawValue) var Chicken_BreastsVisible = true
    @AppStorage(isVisible.Chicken_Wings.rawValue) var Chicken_WingsVisible = true
    @AppStorage(isVisible.Bonein_Chicken.rawValue) var Bonein_ChickenVisible = true
    @AppStorage(isVisible.Chicken_Drums.rawValue) var Chicken_DrumsVisible = true
    @AppStorage(isVisible.Ground_Chicken.rawValue) var Ground_ChickenVisible = true
    @AppStorage(isVisible.Cacao_Powder.rawValue) var Cacao_PowderVisible = true
    
    @AppStorage(isVisible.Granola.rawValue) var GranolaVisible = true
    @AppStorage(isVisible.Small_Granola.rawValue) var Small_GranolaVisible = true
    @AppStorage(isVisible.Large_Granola.rawValue) var Large_GranolaVisible = true
    @AppStorage(isVisible.Small_Icecream.rawValue) var Small_IcecreamVisible = true
    @AppStorage(isVisible.Large_Icecream.rawValue) var Large_IcecreamVisible = true
    
    @AppStorage(isVisible.Spaghetti_Squash.rawValue) var Spagetti_SquashVisible = true
    @AppStorage(isVisible.Acorn_Squash.rawValue) var AcornSquashVisible = true
    @AppStorage(isVisible.Butternut_Squash.rawValue) var ButternutSquashVisible = true
    @AppStorage(isVisible.Potato_Basket.rawValue) var Potato_BasketVisible = true
    //@AppStorage(isVisible.Green_Cabbage.rawValue) var GreenCabbageVisible = true
    @AppStorage(isVisible.Red_Cabbage.rawValue) var RedCabbageVisible = true
    @AppStorage(isVisible.Pea_Shoots.rawValue) var PeaShootsVisible = true
    @AppStorage(isVisible.Holey_Spinach.rawValue) var HoleySpinachVisible = true
    @AppStorage(isVisible.Holey_Beetgreens.rawValue) var Holey_BeetgreensVisible = true
    
    @AppStorage(isVisible.Cutting_Board.rawValue) var CuttingBoardVisible = true
    @AppStorage(isVisible.Wooden_Spoon.rawValue) var WoodenSpoonVisible = true
    @AppStorage(isVisible.Wood_Oil.rawValue) var WoodOilVisible = true
    @AppStorage(isVisible.Kohlrabi_Slaw.rawValue) var KohlrabiSlawVisible = true
    @AppStorage(isVisible.Sourdough.rawValue) var SourdoughVisible = true
    

    //item prices
    //@AppStorage(price.PCarrots.rawValue) var CarrotsPrice = "3.25" //variations
    @AppStorage(price.PSmall_Carrots.rawValue) var SmallCarrotsPrice = "3.75"
    @AppStorage(price.PLarge_Carrots.rawValue) var LargeCarrotsPrice = "6.50"
    
    @AppStorage(price.PHead_Lettuce.rawValue) var HeadLettucePrice = "3.75"
    @AppStorage(price.PSalad_Greens.rawValue) var SaladGreensPrice = "5.50"
    @AppStorage(price.PKale.rawValue) var KalePrice = "5.25"
    @AppStorage(price.PSwiss_Chard.rawValue) var SwissChardPrice = "5.25"
    //@AppStorage(price.PBeets.rawValue) var BeetsPrice = "3.00" //variations
    @AppStorage(price.PStriped_Beets.rawValue) var StripedBeetsPrice = "3.75"
    @AppStorage(price.PCylindra_Beets.rawValue) var CylindraBeetsPrice = "3.75"
    @AppStorage(price.PGolden_Beets.rawValue) var GoldenBeetsPrice = "3.75"
    @AppStorage(price.PBoro_Beets.rawValue) var BoroBeetsPrice = "3.75"
    
    @AppStorage(price.PLeeks.rawValue) var LeeksPrice = "5.00"
    @AppStorage(price.PSpinach.rawValue) var SpinachPrice = "5.50"
    @AppStorage(price.PTomatoes.rawValue) var TomatoesPrice = "5.00"
    @AppStorage(price.PBeefsteak_Bag.rawValue) var BeefsteakBagPrice = "5.00"
    @AppStorage(price.PBeefsteak_Bag.rawValue) var BeefsteakBasketPrice = "12.00"
    @AppStorage(price.PYellow_Heirloom.rawValue) var YellowHeirloomPrice = "5.00"
    
    @AppStorage(price.PCherry_Tomatoes.rawValue) var CherryTomatoesPrice = "3.00"
    //@AppStorage(price.PPeppers.rawValue) var PeppersPrice = "3.00" //variations
    @AppStorage(price.PGreen_Peppers.rawValue) var GreenPeppersPrice = "1.50"
    @AppStorage(price.PColored_Peppers.rawValue) var ColoredPeppersPrice = "3.00"
    
    @AppStorage(price.PEgg_Plant.rawValue) var EggPlantPrice = "2.00"
    @AppStorage(price.PCucumbers.rawValue) var CucumbersPrice = "2.00"
    @AppStorage(price.PJuicing_Cucumbers.rawValue) var Juicing_CucumbersPrice = "5.00"
    @AppStorage(price.PParsley.rawValue) var ParsleyPrice = "3.00"
    @AppStorage(price.PCilantro.rawValue) var CilantroPrice = "3.00"
    @AppStorage(price.PDill.rawValue) var DillPrice = "3.00"
    @AppStorage(price.PBasil.rawValue) var BasilPrice = "3.00"
    @AppStorage(price.PFennel.rawValue) var FennelPrice = "4.00"
    @AppStorage(price.PKohlrabi.rawValue) var KohlrabiPrice = "3.75"
    @AppStorage(price.PGreen_Onions.rawValue) var GreenOnionsPrice = "3.25"
    @AppStorage(price.PGarlic.rawValue) var GarlicPrice = "3.00"
    @AppStorage(price.POnion.rawValue) var OnionPrice = "2.00" //and 1.75 * 5 for 5 pound bags
    @AppStorage(price.POnions.rawValue) var OnionsPrice = "2.00" //and 1.75 * 5 for 5 pound bags
    @AppStorage(price.PSummer_Squash.rawValue) var SummerSquashPrice = "1.50"
    //@AppStorage(price.PMelons.rawValue) var MelonsPrice = "3.00" //variations
    @AppStorage(price.PSmall_Melons.rawValue) var SmallMelonsPrice = "3.00"
    @AppStorage(price.PMedium_Melons.rawValue) var MediumMelonsPrice = "4.00"
    @AppStorage(price.PLarge_Melons.rawValue) var LargeMelonsPrice = "5.00"
    
    @AppStorage(price.PSnow_Peas.rawValue) var SnowPeasPrice = "2.25" //starts off at 2.25 then doubles in size and changes to 4
    @AppStorage(price.PMicrogreens.rawValue) var MicrogreensPrice = "5.00"
    @AppStorage(price.PRadishes.rawValue) var RadishesPrice = "3.00"
    @AppStorage(price.PTurnips.rawValue) var TurnipsPrice = "3.50"
    @AppStorage(price.PCabbage.rawValue) var CabbagePrice = "5.00"
    @AppStorage(price.PPotatoes.rawValue) var PotatoesPrice = "6.25"
    @AppStorage(price.PPotato_Bag.rawValue) var PotatoBagPrice = "6.25"
    
    @AppStorage(price.PArugula.rawValue) var ArugulaPrice = "5.25"
    @AppStorage(price.PAsparagus.rawValue) var AsparagusPrice = "5.00"
    @AppStorage(price.PTatsoi.rawValue) var TatsoiPrice = "99.99" //tbd
    @AppStorage(price.PBok_Choy.rawValue) var Bok_ChoyPrice = "99.99" //tbd
    @AppStorage(price.PBroccoli.rawValue) var BroccoliPrice = "5.00"
    @AppStorage(price.PCelariac.rawValue) var CelariacPrice = "5.00"
    @AppStorage(price.PBrussel_Sprouts.rawValue) var Brussel_SproutsPrice = "99.99"//
    @AppStorage(price.PEndives.rawValue) var EndivesPrice = "5.25"
    @AppStorage(price.PParsnips.rawValue) var ParsnipsPrice = "5.00"
    @AppStorage(price.PPumpkins.rawValue) var PumpkinsPrice = "5.00"//do the same as melons
    @AppStorage(price.PRutabaga.rawValue) var RutabagaPrice = "5.00"
    @AppStorage(price.PSweet_Potatoes.rawValue) var Sweet_PotatoesPrice = "5.00"
    @AppStorage(price.PButterhead_Lettuce.rawValue) var Butterhead_LettucePrice = "3.75"
    @AppStorage(price.PRedGreen_Headlettuce.rawValue) var RedGreen_HeadlettucePrice = "6.50"
    @AppStorage(price.POnion_Bags.rawValue) var Onion_BagsPrice = "8.75"
    @AppStorage(price.PFilet_Beans.rawValue) var Filet_BeansPrice = "99.99" //check store
    @AppStorage(price.PEggs.rawValue) var EggsPrice = "7.25"
    @AppStorage(price.PBeet_Greens.rawValue) var Beet_GreensPrice = "5.25"
    @AppStorage(price.PRomaine_Lettuce.rawValue) var Romaine_LettucePrice = "3.75"
    
    @AppStorage(price.PSalsa.rawValue) var SalsaPrice = "10.00"
    //@AppStorage(price.PPhil_Sauce.rawValue) var PhilSaucePrice = "5.00"
    //@AppStorage(price.PPickled_Onions.rawValue) var PickledOnionsPrice = "6.50"
    @AppStorage(price.PSoup.rawValue) var SoupPrice = "10.00"
    //@AppStorage(price.PPickled_Beets.rawValue) var PickledBeetsPrice = "6.50"
    @AppStorage(price.PPickled_Vegetables.rawValue) var PickledVegetablesPrice = "8.50"
    //@AppStorage(price.PSweet_Carrots.rawValue) var SweetCarrotsPrice = "3.00" //delete
    @AppStorage(price.PLasagna.rawValue) var LasagnaPrice = "26.00"
    @AppStorage(price.PCarrot_Cake.rawValue) var CarrotCakePrice = "8.50"
    @AppStorage(price.PBaguette.rawValue) var BaguettePrice = "5.00"
    @AppStorage(price.PCheese.rawValue) var CheesePrice = "3.00"
    @AppStorage(price.PChicken.rawValue) var ChickenPrice = "3.00" //unique price
    @AppStorage(price.PCoffee.rawValue) var CoffeePrice = "16.00"
    @AppStorage(price.PGround_Beef.rawValue) var GroundBeefPrice = "6.50"
    @AppStorage(price.PStewing_Beef.rawValue) var StewingBeefPrice = "3.00" //check store. Not sure if by weight or constant price
    @AppStorage(price.PWhole_Chicken.rawValue) var WholeChickenPrice = "3.00" //custom price
    
    //@AppStorage(price.PDill_Carrots.rawValue) var Dill_CarrotsPrice = "8.50"
    //@AppStorage(price.PPickled_Asparagus.rawValue) var Pickled_AsparagusPrice = "11.00" //check store
    @AppStorage(price.PRed_Onion_Jam.rawValue) var Red_Onion_JamPrice = "6.50" //hockley pickling and vegan meals trying to get rid of
    //@AppStorage(price.PPickled_Cauliflower.rawValue) var Pickled_CauliflowerPrice = "12.00" //check store
    @AppStorage(price.PRelish.rawValue) var RelishPrice = "7.00"
    @AppStorage(price.PBeef_Burgers.rawValue) var Beef_BurgersPrice = "13.00"
    @AppStorage(price.PWildflower_Honey.rawValue) var Wildflower_HoneyPrice = "15.00"//
    @AppStorage(price.PWhite_Cream_Honey.rawValue) var White_Cream_HoneyPrice = "16.65"//
    @AppStorage(price.PChocolate_Bar.rawValue) var Chocolate_BarPrice = "6.75"
    @AppStorage(price.PCinamon_Cream_Honey.rawValue) var Cinamon_Cream_HoneyPrice = "16.65"//
    @AppStorage(price.PFrench_Loaf.rawValue) var French_LoafPrice = "6.00"
    @AppStorage(price.PBaba_Ganoush.rawValue) var Baba_GanoushPrice = "5.50"
    @AppStorage(price.PTBone_Steak.rawValue) var TBone_SteakPrice = "5.00"
    @AppStorage(price.PYalanji.rawValue) var YalanjiPrice = "6.00" //
    @AppStorage(price.PDate_Cookies.rawValue) var Date_CookiesPrice = "5.00"
    @AppStorage(price.PTurkey_Pot_Pie.rawValue) var Turkey_Pot_PiePrice = "12.00" //
    @AppStorage(price.PBeef_Sausage.rawValue) var Beef_SausagePrice = "12.00" //check if custom price
    @AppStorage(price.PButter_Chicken_Curry.rawValue) var Butter_Chicken_CurryPrice = "26.00"
    //@AppStorage(price.PBeef_Lasagna.rawValue) var Beef_LasagnaPrice = "26.00"
    @AppStorage(price.PChutney.rawValue) var ChutneyPrice = "5.00"
    @AppStorage(price.PKabsa.rawValue) var KabsaPrice = "5.00" //variations with nuts its 5.50
    @AppStorage(price.PSamosas.rawValue) var SamosasPrice = "60.00"
    @AppStorage(price.PCoconut_Yogurt.rawValue) var Coconut_YogurtPrice = "12.00"
    @AppStorage(price.PFalafels.rawValue) var FalafelsPrice = "7.00"
    
    @AppStorage(price.PPepper_Bag.rawValue) var Pepper_BagsPrice = "5.50"
    @AppStorage(price.PBaklava.rawValue) var BaklavaPrice = "6.00"
    @AppStorage(price.PHummus.rawValue) var HummusPrice = "5.00"
    @AppStorage(price.PSfeeha.rawValue) var SfeehaPrice = "12.00"
    @AppStorage(price.PGarlic_Scape_Butter.rawValue) var Garlic_Scape_ButterPrice = "12.00"
    @AppStorage(price.PGazpacho.rawValue) var GazpachoPrice = "10.00"
    @AppStorage(price.PChicken_Breasts.rawValue) var Chicken_BreastsPrice = "5.00"
    @AppStorage(price.PChicken_Wings.rawValue) var Chicken_WingsPrice = "5.00"
    @AppStorage(price.PBonein_Chicken.rawValue) var Bonein_ChickenPrice = "5.00"
    @AppStorage(price.PChicken_Drums.rawValue) var Chicken_DrumsPrice = "5.00"
    @AppStorage(price.PGround_Chicken.rawValue) var Ground_ChickenPrice = "5.00"
    @AppStorage(price.PCacao_Powder.rawValue) var Cacao_PowderPrice = "24.00"
    
    @AppStorage(price.PGranola.rawValue) var GranolaPrice = "14.00"
    @AppStorage(price.PSmall_Granola.rawValue) var Small_GranolaPrice = "14.00"
    @AppStorage(price.PLarge_Granola.rawValue) var Large_GranolaPrice = "17.00"
    @AppStorage(price.PSmall_Icecream.rawValue) var Small_IcecreamPrice = "3.75"
    @AppStorage(price.PLarge_Icecream.rawValue) var Large_IcecreamPrice = "7.00"
    
    @AppStorage(price.PSpaghetti_Squash.rawValue) var Spagetti_SquashPrice = "99.99"
    @AppStorage(price.PAcorn_Squash.rawValue) var AcornSquashPrice = "99.99"
    @AppStorage(price.PButternut_Squash.rawValue) var ButternutSquashPrice = "99.99"
    @AppStorage(price.PPotato_Basket.rawValue) var Potato_BasketPrice = "99.99"
    //@AppStorage(price.PGreen_Cabbage.rawValue) var GreenCabbagePrice = "99.99"
    @AppStorage(price.PRed_Cabbage.rawValue) var RedCabbagePrice = "99.99"
    @AppStorage(price.PPea_Shoots.rawValue) var PeaShootsPrice = "99.99"
    @AppStorage(price.PHoley_Spinach.rawValue) var HoleySpinachPrice = "99.99"
    @AppStorage(price.PHoley_Beetgreens.rawValue) var Holey_BeetgreensPrice = "99.99"
    
    @AppStorage(price.PCutting_Board.rawValue) var CuttingBoardPrice = "99.99"
    @AppStorage(price.PWooden_Spoon.rawValue) var WoodenSpoonPrice = "99.99"
    @AppStorage(price.PWood_Oil.rawValue) var WoodOilPrice = "99.99"
    @AppStorage(price.PKohlrabi_Slaw.rawValue) var KohlrabiSlawPrice = "99.99"
    @AppStorage(price.PSourdough.rawValue) var SourdoughPrice = "99.99"
    
    
    

    var body: some View {
        Spacer(minLength: 10)
        Button {
            print("loading")
            cartData.isAvailable[isVisible.Beets.rawValue] = BeetsVisible
            cartData.isAvailable[isVisible.Boro_Beets.rawValue] = BeetsVisible
            cartData.isAvailable[isVisible.Cylindra_Beets.rawValue] = BeetsVisible
            cartData.isAvailable[isVisible.Golden_Beets.rawValue] = BeetsVisible
            cartData.isAvailable[isVisible.Striped_Beets.rawValue] = BeetsVisible
            cartData.isAvailable[isVisible.Basil.rawValue] = BasilVisible
            cartData.isAvailable[isVisible.Cabbage.rawValue] = CabbageVisible
            cartData.isAvailable[isVisible.Carrots.rawValue] = CarrotsVisible
            cartData.isAvailable[isVisible.Small_Carrots.rawValue] = CarrotsVisible
            cartData.isAvailable[isVisible.Large_Carrots.rawValue] = CarrotsVisible
            cartData.isAvailable[isVisible.Cherry_Tomatoes.rawValue] = CherryTomatoesVisible
            cartData.isAvailable[isVisible.Cilantro.rawValue] = CilantroVisible
            cartData.isAvailable[isVisible.Cucumbers.rawValue] = CucumbersVisible
            cartData.isAvailable[isVisible.Juicing_Cucumbers.rawValue] = Juicing_CucumbersVisible
            cartData.isAvailable[isVisible.Dill.rawValue] = DillVisible
            cartData.isAvailable[isVisible.Egg_Plant.rawValue] = EggPlantVisible
            cartData.isAvailable[isVisible.Fennel.rawValue] = FennelVisible
            cartData.isAvailable[isVisible.Garlic.rawValue] = GarlicVisible
            cartData.isAvailable[isVisible.Green_Onions.rawValue] = GreenOnionsVisible
            //cartData.isAvailable[isVisible.Head_Lettuce.rawValue] = HeadLettuceVisible
            cartData.isAvailable[isVisible.Kale.rawValue] = KaleVisible
            cartData.isAvailable[isVisible.Kohlrabi.rawValue] = KohlrabiVisible
            cartData.isAvailable[isVisible.Leeks.rawValue] = LeeksVisible
            cartData.isAvailable[isVisible.Small_Melons.rawValue] = SmallMelonsVisible
            cartData.isAvailable[isVisible.Medium_Melons.rawValue] = MediumMelonsVisible
            cartData.isAvailable[isVisible.Large_Melons.rawValue] = LargeMelonsVisible
            cartData.isAvailable[isVisible.Melons.rawValue] = MelonsVisible
            cartData.isAvailable[isVisible.Microgreens.rawValue] = MicrogreensVisible
            cartData.isAvailable[isVisible.Onion.rawValue] = OnionVisible
            cartData.isAvailable[isVisible.Onions.rawValue] = OnionsVisible
            cartData.isAvailable[isVisible.Parsley.rawValue] = ParsleyVisible
            cartData.isAvailable[isVisible.Peppers.rawValue] = PeppersVisible
            cartData.isAvailable[isVisible.Green_Peppers.rawValue] = GreenPeppersVisible
            cartData.isAvailable[isVisible.Colored_Peppers.rawValue] = ColoredPeppersVisible
            cartData.isAvailable[isVisible.Potatoes.rawValue] = PotatoesVisible
            cartData.isAvailable[isVisible.Potato_Bag.rawValue] = PotatoBagVisible
            cartData.isAvailable[isVisible.Radishes.rawValue] = RadishesVisible
            cartData.isAvailable[isVisible.Salad_Greens.rawValue] = SaladGreensVisible
            cartData.isAvailable[isVisible.Snow_Peas.rawValue] = SnowPeasVisible
            cartData.isAvailable[isVisible.Spinach.rawValue] = SpinachVisible
            cartData.isAvailable[isVisible.Squash.rawValue] = SquashVisible
            cartData.isAvailable[isVisible.Summer_Squash.rawValue] = SummerSquashVisible
            cartData.isAvailable[isVisible.Swiss_Chard.rawValue] = SwissChardVisible
            cartData.isAvailable[isVisible.Tomatoes.rawValue] = TomatoesVisible
            cartData.isAvailable[isVisible.Beefsteak_Bag.rawValue] = TomatoesVisible
            cartData.isAvailable[isVisible.Beefsteak_Basket.rawValue] = TomatoesVisible
            cartData.isAvailable[isVisible.Yellow_Heirloom.rawValue] = TomatoesVisible
            
            cartData.isAvailable[isVisible.Turnips.rawValue] = TurnipsVisible
            cartData.isAvailable[isVisible.Arugula.rawValue] = ArugulaVisible
            cartData.isAvailable[isVisible.Asparagus.rawValue] = AsparagusVisible
            cartData.isAvailable[isVisible.Tatsoi.rawValue] = TatsoiVisible
            cartData.isAvailable[isVisible.Bok_Choy.rawValue] = Bok_ChoyVisible
            cartData.isAvailable[isVisible.Broccoli.rawValue] = BroccoliVisible
            cartData.isAvailable[isVisible.Celariac.rawValue] = CelariacVisible
            cartData.isAvailable[isVisible.Brussel_Sprouts.rawValue] = Brussel_SproutsVisible
            cartData.isAvailable[isVisible.Endives.rawValue] = EndivesVisible
            cartData.isAvailable[isVisible.Parsnips.rawValue] = ParsnipsVisible
            cartData.isAvailable[isVisible.Pumpkins.rawValue] = PumpkinsVisible
            cartData.isAvailable[isVisible.Rutabaga.rawValue] = RutabagaVisible
            cartData.isAvailable[isVisible.Sweet_Potatoes.rawValue] = Sweet_PotatoesVisible
            cartData.isAvailable[isVisible.Butterhead_Lettuce.rawValue] = Butterhead_LettuceVisible
            cartData.isAvailable[isVisible.RedGreen_Headlettuce.rawValue] = RedGreen_HeadlettuceVisible
            cartData.isAvailable[isVisible.Onion_Bags.rawValue] = Onion_BagsVisible
            cartData.isAvailable[isVisible.Filet_Beans.rawValue] = Filet_BeansVisible
            cartData.isAvailable[isVisible.Eggs.rawValue] = EggsVisible
            cartData.isAvailable[isVisible.Beet_Greens.rawValue] = Beet_GreensVisible
            cartData.isAvailable[isVisible.Romaine_Lettuce.rawValue] = Romaine_LettuceVisible
            
            cartData.isAvailable[isVisible.Salsa.rawValue] = SalsaVisible
            //cartData.isAvailable[isVisible.Phil_Sauce.rawValue] = PhilSauceVisible
            //cartData.isAvailable[isVisible.Pickled_Onions.rawValue] = PickledOnionsVisible
            cartData.isAvailable[isVisible.Soup.rawValue] = SoupVisible
           //cartData.isAvailable[isVisible.Pickled_Beets.rawValue] = PickledBeetsVisible
            cartData.isAvailable[isVisible.Pickled_Vegetables.rawValue] = PickledVegetablesVisible
            //cartData.isAvailable[isVisible.Sweet_Carrots.rawValue] = SweetCarrotsVisible
            cartData.isAvailable[isVisible.Lasagna.rawValue] = LasagnaVisible
            cartData.isAvailable[isVisible.Carrot_Cake.rawValue] = CarrotCakeVisible
            cartData.isAvailable[isVisible.Baguette.rawValue] = BaguetteVisible
            cartData.isAvailable[isVisible.Cheese.rawValue] = CheeseVisible
            cartData.isAvailable[isVisible.Chicken.rawValue] = ChickenVisible
            cartData.isAvailable[isVisible.Coffee.rawValue] = CoffeeVisible
            cartData.isAvailable[isVisible.Ground_Beef.rawValue] = GroundBeefVisible
            cartData.isAvailable[isVisible.Stewing_Beef.rawValue] = StewingBeefVisible
            cartData.isAvailable[isVisible.Whole_Chicken.rawValue] = WholeChickenVisible
            
            //cartData.isAvailable[isVisible.Dill_Carrots.rawValue] = Dill_CarrotsVisible
            //cartData.isAvailable[isVisible.Pickled_Asparagus.rawValue] = Pickled_AsparagusVisible
            cartData.isAvailable[isVisible.Red_Onion_Jam.rawValue] = Red_Onion_JamVisible
            //cartData.isAvailable[isVisible.Pickled_Cauliflower.rawValue] = Pickled_CauliflowerVisible
            cartData.isAvailable[isVisible.Relish.rawValue] = RelishVisible
            cartData.isAvailable[isVisible.Beef_Burgers.rawValue] = Beef_BurgersVisible
            cartData.isAvailable[isVisible.Wildflower_Honey.rawValue] = Wildflower_HoneyVisible
            cartData.isAvailable[isVisible.White_Cream_Honey.rawValue] = White_Cream_HoneyVisible
            cartData.isAvailable[isVisible.Chocolate_Bar.rawValue] = Chocolate_BarVisible
            cartData.isAvailable[isVisible.Cinamon_Cream_Honey.rawValue] = Cinamon_Cream_HoneyVisible
            cartData.isAvailable[isVisible.Honey.rawValue] = HoneyVisible
            cartData.isAvailable[isVisible.French_Loaf.rawValue] = French_LoafVisible
            cartData.isAvailable[isVisible.Baba_Ganoush.rawValue] = Baba_GanoushVisible
            cartData.isAvailable[isVisible.TBone_Steak.rawValue] = TBone_SteakVisible
            cartData.isAvailable[isVisible.Yalanji.rawValue] = YalanjiVisible
            cartData.isAvailable[isVisible.Date_Cookies.rawValue] = Date_CookiesVisible
            cartData.isAvailable[isVisible.Turkey_Pot_Pie.rawValue] = Turkey_Pot_PieVisible
            cartData.isAvailable[isVisible.Beef_Sausage.rawValue] = Beef_SausageVisible
            cartData.isAvailable[isVisible.Butter_Chicken_Curry.rawValue] = Butter_Chicken_CurryVisible
            //cartData.isAvailable[isVisible.Beef_Lasagna.rawValue] = Beef_LasagnaVisible
            cartData.isAvailable[isVisible.Chutney.rawValue] = ChutneyVisible
            cartData.isAvailable[isVisible.Kabsa.rawValue] = KabsaVisible
            cartData.isAvailable[isVisible.Samosas.rawValue] = SamosasVisible
            cartData.isAvailable[isVisible.Coconut_Yogurt.rawValue] = Coconut_YogurtVisible
            cartData.isAvailable[isVisible.Falafels.rawValue] = FalafelsVisible
            
            cartData.isAvailable[isVisible.Pepper_Bag.rawValue] = Pepper_BagsVisible
            cartData.isAvailable[isVisible.Baklava.rawValue] = BaklavaVisible
            cartData.isAvailable[isVisible.Sfeeha.rawValue] = SfeehaVisible
            cartData.isAvailable[isVisible.Garlic_Scape_Butter.rawValue] = Garlic_Scape_ButterVisible
            cartData.isAvailable[isVisible.Gazpacho.rawValue] = GazpachoVisible
            cartData.isAvailable[isVisible.Chicken_Breasts.rawValue] = Chicken_BreastsVisible
            cartData.isAvailable[isVisible.Chicken_Wings.rawValue] = Chicken_WingsVisible
            cartData.isAvailable[isVisible.Bonein_Chicken.rawValue] = Bonein_ChickenVisible
            cartData.isAvailable[isVisible.Chicken_Drums.rawValue] = Chicken_DrumsVisible
            cartData.isAvailable[isVisible.Ground_Chicken.rawValue] = Ground_ChickenVisible
            cartData.isAvailable[isVisible.Cacao_Powder.rawValue] = Cacao_PowderVisible
            cartData.isAvailable[isVisible.Hummus.rawValue] = HummusVisible
            
            cartData.isAvailable[isVisible.Granola.rawValue] = GranolaVisible
            cartData.isAvailable[isVisible.Small_Granola.rawValue] = Small_GranolaVisible
            cartData.isAvailable[isVisible.Large_Granola.rawValue] = Large_GranolaVisible
            cartData.isAvailable[isVisible.Small_Icecream.rawValue] = Small_IcecreamVisible
            cartData.isAvailable[isVisible.Large_Icecream.rawValue] = Large_IcecreamVisible
            
            cartData.isAvailable[isVisible.Spaghetti_Squash.rawValue] = Spagetti_SquashVisible
            cartData.isAvailable[isVisible.Acorn_Squash.rawValue] = AcornSquashVisible
            cartData.isAvailable[isVisible.Butternut_Squash.rawValue] = ButternutSquashVisible
            cartData.isAvailable[isVisible.Potato_Basket.rawValue] = Potato_BasketVisible
            //cartData.isAvailable[isVisible.Green_Cabbage.rawValue] = GreenCabbageVisible
            cartData.isAvailable[isVisible.Red_Cabbage.rawValue] = RedCabbageVisible
            cartData.isAvailable[isVisible.Pea_Shoots.rawValue] = PeaShootsVisible
            cartData.isAvailable[isVisible.Holey_Spinach.rawValue] = HoleySpinachVisible
            cartData.isAvailable[isVisible.Holey_Beetgreens.rawValue] = Holey_BeetgreensVisible
            
            cartData.isAvailable[isVisible.Cutting_Board.rawValue] = CuttingBoardVisible
            cartData.isAvailable[isVisible.Wooden_Spoon.rawValue] = WoodenSpoonVisible
            cartData.isAvailable[isVisible.Wood_Oil.rawValue] = WoodOilVisible
            cartData.isAvailable[isVisible.Kohlrabi_Slaw.rawValue] = KohlrabiSlawVisible
            cartData.isAvailable[isVisible.Sourdough.rawValue] = SourdoughVisible
            
            
            
            print(cartData.isAvailable)
            
            //cartData.priceDict[toReference(priceEnum: price.PHead_Lettuce)] = HeadLettucePrice
            cartData.priceDict[toReference(priceEnum: price.PSmall_Carrots)] = SmallCarrotsPrice
            cartData.priceDict[toReference(priceEnum: price.PLarge_Carrots)] = LargeCarrotsPrice
            cartData.priceDict[toReference(priceEnum: price.PSalad_Greens)] = SaladGreensPrice
            cartData.priceDict[toReference(priceEnum: price.PKale)] = KalePrice
            cartData.priceDict[toReference(priceEnum: price.PSwiss_Chard)] = SwissChardPrice
            cartData.priceDict[toReference(priceEnum: price.PBoro_Beets)] = StripedBeetsPrice
            cartData.priceDict[toReference(priceEnum: price.PStriped_Beets)] = StripedBeetsPrice
            cartData.priceDict[toReference(priceEnum: price.PCylindra_Beets)] = CylindraBeetsPrice
            cartData.priceDict[toReference(priceEnum: price.PGolden_Beets)] = GoldenBeetsPrice
            cartData.priceDict[toReference(priceEnum: price.PLeeks)] = LeeksPrice
            cartData.priceDict[toReference(priceEnum: price.PSpinach)] = SpinachPrice
            cartData.priceDict[toReference(priceEnum: price.PBeefsteak_Bag)] = BeefsteakBagPrice
            cartData.priceDict[toReference(priceEnum: price.PBeefsteak_Basket)] = BeefsteakBasketPrice
            cartData.priceDict[toReference(priceEnum: price.PYellow_Heirloom)] = YellowHeirloomPrice
            
            cartData.priceDict[toReference(priceEnum: price.PCherry_Tomatoes)] = CherryTomatoesPrice
            cartData.priceDict[toReference(priceEnum: price.PGreen_Peppers)] = GreenPeppersPrice
            cartData.priceDict[toReference(priceEnum: price.PColored_Peppers)] = ColoredPeppersPrice
            cartData.priceDict[toReference(priceEnum: price.PEgg_Plant)] = EggPlantPrice
            cartData.priceDict[toReference(priceEnum: price.PCucumbers)] = CucumbersPrice
            cartData.priceDict[toReference(priceEnum: price.PJuicing_Cucumbers)] = Juicing_CucumbersPrice
            
            cartData.priceDict[toReference(priceEnum: price.PParsley)] = ParsleyPrice
            cartData.priceDict[toReference(priceEnum: price.PCilantro)] = CilantroPrice
            cartData.priceDict[toReference(priceEnum: price.PDill)] = DillPrice
            cartData.priceDict[toReference(priceEnum: price.PBasil)] = BasilPrice
            cartData.priceDict[toReference(priceEnum: price.PFennel)] = FennelPrice
            cartData.priceDict[toReference(priceEnum: price.PKohlrabi)] = KohlrabiPrice
            cartData.priceDict[toReference(priceEnum: price.PGreen_Onions)] = GreenOnionsPrice
            cartData.priceDict[toReference(priceEnum: price.PGarlic)] = GarlicPrice
            cartData.priceDict[toReference(priceEnum: price.POnion)] = OnionPrice
            cartData.priceDict[toReference(priceEnum: price.POnions)] = OnionsPrice
            cartData.priceDict[toReference(priceEnum: price.PSummer_Squash)] = SummerSquashPrice
            cartData.priceDict[toReference(priceEnum: price.PRadishes)] = RadishesPrice
            //cartData.priceDict[toReference(priceEnum: price.PSquash)] = SquashPrice
            cartData.priceDict[toReference(priceEnum: price.PSmall_Melons)] = SmallMelonsPrice
            cartData.priceDict[toReference(priceEnum: price.PMedium_Melons)] = MediumMelonsPrice
            cartData.priceDict[toReference(priceEnum: price.PLarge_Melons)] = LargeMelonsPrice
            cartData.priceDict[toReference(priceEnum: price.PSnow_Peas)] = SnowPeasPrice
            cartData.priceDict[toReference(priceEnum: price.PMicrogreens)] = MicrogreensPrice
            //cartData.priceDict[toReference(priceEnum: price.PBeets)] = BeetsPrice
            cartData.priceDict[toReference(priceEnum: price.PTurnips)] = TurnipsPrice
            cartData.priceDict[toReference(priceEnum: price.PCabbage)] = CabbagePrice
            cartData.priceDict[toReference(priceEnum: price.PPotatoes)] = PotatoesPrice
            cartData.priceDict[toReference(priceEnum: price.PPotato_Bag)] = PotatoBagPrice
            
            cartData.priceDict[toReference(priceEnum: price.PArugula)] = ArugulaPrice
            cartData.priceDict[toReference(priceEnum: price.PAsparagus)] = AsparagusPrice
            cartData.priceDict[toReference(priceEnum: price.PTatsoi)] = TatsoiPrice
            cartData.priceDict[toReference(priceEnum: price.PBok_Choy)] = Bok_ChoyPrice
            cartData.priceDict[toReference(priceEnum: price.PBroccoli)] = BroccoliPrice
            cartData.priceDict[toReference(priceEnum: price.PCelariac)] = CelariacPrice
            cartData.priceDict[toReference(priceEnum: price.PBrussel_Sprouts)] = Brussel_SproutsPrice
            cartData.priceDict[toReference(priceEnum: price.PEndives)] = EndivesPrice
            cartData.priceDict[toReference(priceEnum: price.PParsnips)] = ParsnipsPrice
            cartData.priceDict[toReference(priceEnum: price.PPumpkins)] = PumpkinsPrice
            cartData.priceDict[toReference(priceEnum: price.PRutabaga)] = RutabagaPrice
            cartData.priceDict[toReference(priceEnum: price.PSweet_Potatoes)] = Sweet_PotatoesPrice
            cartData.priceDict[toReference(priceEnum: price.PButterhead_Lettuce)] = Butterhead_LettucePrice
            cartData.priceDict[toReference(priceEnum: price.PRedGreen_Headlettuce)] = RedGreen_HeadlettucePrice
            cartData.priceDict[toReference(priceEnum: price.POnion_Bags)] = Onion_BagsPrice
            cartData.priceDict[toReference(priceEnum: price.PFilet_Beans)] = Filet_BeansPrice
            cartData.priceDict[toReference(priceEnum: price.PEggs)] = EggsPrice
            cartData.priceDict[toReference(priceEnum: price.PBeet_Greens)] = Beet_GreensPrice
            cartData.priceDict[toReference(priceEnum: price.PRomaine_Lettuce)] = Romaine_LettucePrice
            
            cartData.priceDict[toReference(priceEnum: price.PSalsa)] = SalsaPrice
            //cartData.priceDict[toReference(priceEnum: price.PPhil_Sauce)] = PhilSaucePrice
            //cartData.priceDict[toReference(priceEnum: price.PPickled_Onions)] = PickledOnionsPrice
            cartData.priceDict[toReference(priceEnum: price.PSoup)] = SoupPrice
            //cartData.priceDict[toReference(priceEnum: price.PPickled_Beets)] = PickledBeetsPrice
            cartData.priceDict[toReference(priceEnum: price.PPickled_Vegetables)] = PickledVegetablesPrice
            //cartData.priceDict[toReference(priceEnum: price.PSweet_Carrots)] = SweetCarrotsPrice
            cartData.priceDict[toReference(priceEnum: price.PLasagna)] = LasagnaPrice
            cartData.priceDict[toReference(priceEnum: price.PCarrot_Cake)] = CarrotCakePrice
            cartData.priceDict[toReference(priceEnum: price.PBaguette)] = BaguettePrice
            cartData.priceDict[toReference(priceEnum: price.PCheese)] = CheesePrice
            cartData.priceDict[toReference(priceEnum: price.PChicken)] = ChickenPrice
            cartData.priceDict[toReference(priceEnum: price.PCoffee)] = CoffeePrice
            cartData.priceDict[toReference(priceEnum: price.PGround_Beef)] = GroundBeefPrice
            cartData.priceDict[toReference(priceEnum: price.PStewing_Beef)] = StewingBeefPrice
            cartData.priceDict[toReference(priceEnum: price.PWhole_Chicken)] = WholeChickenPrice
            
            //cartData.priceDict[toReference(priceEnum: price.PDill_Carrots)] = Dill_CarrotsPrice
            //cartData.priceDict[toReference(priceEnum: price.PPickled_Asparagus)] = Pickled_AsparagusPrice
            cartData.priceDict[toReference(priceEnum: price.PRed_Onion_Jam)] = Red_Onion_JamPrice
            //cartData.priceDict[toReference(priceEnum: price.PPickled_Cauliflower)] = Pickled_CauliflowerPrice
            cartData.priceDict[toReference(priceEnum: price.PRelish)] = RelishPrice
            cartData.priceDict[toReference(priceEnum: price.PBeef_Burgers)] = Beef_BurgersPrice
            cartData.priceDict[toReference(priceEnum: price.PWildflower_Honey)] = Wildflower_HoneyPrice
            cartData.priceDict[toReference(priceEnum: price.PWhite_Cream_Honey)] = White_Cream_HoneyPrice
            cartData.priceDict[toReference(priceEnum: price.PChocolate_Bar)] = Chocolate_BarPrice
            cartData.priceDict[toReference(priceEnum: price.PCinamon_Cream_Honey)] = Cinamon_Cream_HoneyPrice
            cartData.priceDict[toReference(priceEnum: price.PFrench_Loaf)] = French_LoafPrice
            cartData.priceDict[toReference(priceEnum: price.PBaba_Ganoush)] = Baba_GanoushPrice
            cartData.priceDict[toReference(priceEnum: price.PTBone_Steak)] = TBone_SteakPrice
            cartData.priceDict[toReference(priceEnum: price.PYalanji)] = YalanjiPrice
            cartData.priceDict[toReference(priceEnum: price.PDate_Cookies)] = Date_CookiesPrice
            cartData.priceDict[toReference(priceEnum: price.PTurkey_Pot_Pie)] = Turkey_Pot_PiePrice
            cartData.priceDict[toReference(priceEnum: price.PBeef_Sausage)] = Beef_SausagePrice
            cartData.priceDict[toReference(priceEnum: price.PButter_Chicken_Curry)] = Butter_Chicken_CurryPrice
            //cartData.priceDict[toReference(priceEnum: price.PBeef_Lasagna)] = Beef_LasagnaPrice
            cartData.priceDict[toReference(priceEnum: price.PChutney)] = ChutneyPrice
            cartData.priceDict[toReference(priceEnum: price.PKabsa)] = KabsaPrice
            cartData.priceDict[toReference(priceEnum: price.PSamosas)] = SamosasPrice
            cartData.priceDict[toReference(priceEnum: price.PCoconut_Yogurt)] = Coconut_YogurtPrice
            cartData.priceDict[toReference(priceEnum: price.PFalafels)] = FalafelsPrice
            
            cartData.priceDict[toReference(priceEnum: price.PPepper_Bag)] = Pepper_BagsPrice
            cartData.priceDict[toReference(priceEnum: price.PBaklava)] = BaklavaPrice
            cartData.priceDict[toReference(priceEnum: price.PSfeeha)] = SfeehaPrice
            cartData.priceDict[toReference(priceEnum: price.PGarlic_Scape_Butter)] = Garlic_Scape_ButterPrice
            cartData.priceDict[toReference(priceEnum: price.PGazpacho)] = GazpachoPrice
            cartData.priceDict[toReference(priceEnum: price.PChicken_Breasts)] = Chicken_BreastsPrice
            cartData.priceDict[toReference(priceEnum: price.PChicken_Wings)] = Chicken_WingsPrice
            cartData.priceDict[toReference(priceEnum: price.PBonein_Chicken)] = Bonein_ChickenPrice
            cartData.priceDict[toReference(priceEnum: price.PChicken_Drums)] = Chicken_DrumsPrice
            cartData.priceDict[toReference(priceEnum: price.PGround_Chicken)] = Ground_ChickenPrice
            cartData.priceDict[toReference(priceEnum: price.PCacao_Powder)] = Cacao_PowderPrice
            cartData.priceDict[toReference(priceEnum: price.PHummus)] = HummusPrice
            
            cartData.priceDict[toReference(priceEnum: price.PGranola)] = GranolaPrice
            cartData.priceDict[toReference(priceEnum: price.PSmall_Granola)] = Small_GranolaPrice
            cartData.priceDict[toReference(priceEnum: price.PLarge_Granola)] = Large_GranolaPrice
            cartData.priceDict[toReference(priceEnum: price.PSmall_Icecream)] = Small_IcecreamPrice
            cartData.priceDict[toReference(priceEnum: price.PLarge_Icecream)] = Large_IcecreamPrice
            
            cartData.priceDict[toReference(priceEnum: price.PSpaghetti_Squash)] = Spagetti_SquashPrice
            cartData.priceDict[toReference(priceEnum: price.PAcorn_Squash)] = AcornSquashPrice
            cartData.priceDict[toReference(priceEnum: price.PButternut_Squash)] = ButternutSquashPrice
            cartData.priceDict[toReference(priceEnum: price.PPotato_Basket)] = Potato_BasketPrice
            //cartData.priceDict[toReference(priceEnum: price.PGreen_Cabbage)] = GreenCabbagePrice
            cartData.priceDict[toReference(priceEnum: price.PRed_Cabbage)] = RedCabbagePrice
            cartData.priceDict[toReference(priceEnum: price.PPea_Shoots)] = PeaShootsPrice
            cartData.priceDict[toReference(priceEnum: price.PHoley_Spinach)] = HoleySpinachPrice
            cartData.priceDict[toReference(priceEnum: price.PHoley_Beetgreens)] = Holey_BeetgreensPrice
            
            cartData.priceDict[toReference(priceEnum: price.PCutting_Board)] = CuttingBoardPrice
            cartData.priceDict[toReference(priceEnum: price.PWooden_Spoon)] = WoodenSpoonPrice
            cartData.priceDict[toReference(priceEnum: price.PWood_Oil)] = WoodOilPrice
            cartData.priceDict[toReference(priceEnum: price.PKohlrabi_Slaw)] = KohlrabiSlawPrice
            cartData.priceDict[toReference(priceEnum: price.PSourdough)] = SourdoughPrice
            
            print(cartData.priceDict)
            Switch.appState = "itemsPage"
        } label: {
            Text("Continue To App")
                .padding(10)
                .foregroundColor(Color.black)
                .background(Color.accentColor)
                .cornerRadius(12)
        }
        Spacer(minLength: 20)
        Text("Price and Availability Settings")
        HStack { //outmost HStack to make prices and visibility toggles side by side
            Form {
                VStack { //outer VStack
                    VStack { //farm produce VStack
                        Text("Farm Produce")
                            .bold()
                            .font(.custom("San Francisco", size: 25))
                        Group {
                            Toggle(isOn: $ArugulaVisible) {Text("Arugula Visible?")}
                            Toggle(isOn: $AsparagusVisible) {Text("Asparagus Visible?")}
                            Toggle(isOn: $BasilVisible) {Text("Basil Visible?")}
                            Toggle(isOn: $Beet_GreensVisible) {Text("Beet Greens Visible?")}
                            Toggle(isOn: $Holey_BeetgreensVisible) {Text("Imperfect leaf Beet Greens Visible?")}
                            Toggle(isOn: $BeetsVisible) {Text("Beets Visible?")}
                            Toggle(isOn: $Bok_ChoyVisible) {Text("Bok Choy Visible?")}
                            Toggle(isOn: $Butterhead_LettuceVisible) {Text("Butterhead Lettuce Visible?")}
                            Toggle(isOn: $CabbageVisible) {Text("Cabbage Visible?")}
                            Toggle(isOn: $CarrotsVisible) {Text("Carrots Visible?")}
                        }
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                        Group {
                            Toggle(isOn: $CelariacVisible) {Text("Celariac Visible?")}
                            Toggle(isOn: $CherryTomatoesVisible) {Text("Cherry Tomatoes Visible?")}
                            Toggle(isOn: $CilantroVisible) {Text("Cilantro Visible?")}
                            Toggle(isOn: $CucumbersVisible) {Text("Cucumbers Visible?")}
                            Toggle(isOn: $Juicing_CucumbersVisible) {Text("Juicing Cucumbers Visible?")}
                            Toggle(isOn: $DillVisible) {Text("Dill Visible?")}
                            Toggle(isOn: $EggPlantVisible) {Text("Egg Plant Visible?")}
                            Toggle(isOn: $EggsVisible) {Text("Eggs Visible?")}
                            Toggle(isOn: $Filet_BeansVisible) {Text("Filet Beans Visible?")}
                        }
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                        Group {
                            Toggle(isOn: $FennelVisible) {Text("Fennel Visible?")}
                            Toggle(isOn: $GarlicVisible) {Text("Garlic Visible?")}
                            Toggle(isOn: $GreenOnionsVisible) {Text("Green Onions Visible?")}
                            //Toggle(isOn: $HeadLettuceVisible) {Text("Head Lettuce Visible?")}
                            Toggle(isOn: $KaleVisible) {Text("Kale Visible?")}
                            Toggle(isOn: $KohlrabiVisible) {Text("Kohlrabi Visible?")}
                            Toggle(isOn: $LeeksVisible) {Text("Leeks Visible?")}
                            Toggle(isOn: $MelonsVisible) {Text("Melons Visible?")}
                            Toggle(isOn: $MicrogreensVisible) {Text("Microgreens Visible?")}
                        }
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                        Group {
                            Toggle(isOn: $OnionVisible) {Text("Onions Visible?")}
                            Toggle(isOn: $Onion_BagsVisible) {Text("Onion Bags Visible?")}
                            Toggle(isOn: $ParsleyVisible) {Text("Parsley Visible?")}
                            Toggle(isOn: $ParsnipsVisible) {Text("Parsnips Visible?")}
                            Toggle(isOn: $PeppersVisible) {Text("Peppers Visible?")}
                            Toggle(isOn: $PeaShootsVisible) {Text("Pea Shoots Visible?")}
                            Toggle(isOn: $PumpkinsVisible) {Text("Pumpkins Visible?")}
                            Toggle(isOn: $RadishesVisible) {Text("Radishes Visible?")}
                            Toggle(isOn: $Romaine_LettuceVisible) {Text("Romaine Lettuce Visible?")}
                            Toggle(isOn: $RedGreen_HeadlettuceVisible) {Text("Red and Green Salvanova Visible?")}
                        }
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                        
                        Group {
                            Toggle(isOn: $SaladGreensVisible) {Text("Salad Greens Visible?")}
                            Toggle(isOn: $SnowPeasVisible) {Text("Snow Peas Visible?")}
                            Toggle(isOn: $SpinachVisible) {Text("Spinach Visible?")}
                            Toggle(isOn: $HoleySpinachVisible) {Text("Imperfect Leaf Spinach Visible?")}
                            Toggle(isOn: $SquashVisible) {Text("Squash Visible?")}
                            Toggle(isOn: $SummerSquashVisible) {Text("Summer Squash Visible?")}
                            Toggle(isOn: $SwissChardVisible) {Text("Swiss Chard Visible?")}
                            Toggle(isOn: $TatsoiVisible) {Text("Tatsoi Visible?")}
                            Toggle(isOn: $TomatoesVisible) {Text("Tomatoes Visible?")}
                            Toggle(isOn: $TurnipsVisible) {Text("Turnips Visible?")}
                        }
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                    } //close produce VStack
                    VStack { //imported Produce VStack
                        Spacer(minLength: 35)
                        Text("Imported Produce")
                            .bold()
                            .font(.custom("San Francisco", size: 25))
                        Group {
                            Toggle(isOn: $BroccoliVisible) {Text("Broccoli Visible?")}
                            Toggle(isOn: $Brussel_SproutsVisible) {Text("Brussel Sprouts Visible?")}
                            Toggle(isOn: $EndivesVisible) {Text("Endives Visible?")}
                            Toggle(isOn: $PotatoesVisible) {Text("Potatoes Visible?")}
                            Toggle(isOn: $RutabagaVisible) {Text("Rutabaga Visible?")}
                            Toggle(isOn: $Sweet_PotatoesVisible) {Text("Sweet Potatoes Visible?")}
                        }
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                    } //end Imported Produce VStack
                    
                    VStack { //Made with Am Braigh Ingredients VStack
                        Spacer(minLength: 35)
                        Text("Made with Am Braigh Ingredients")
                            .bold()
                            .font(.custom("San Francisco", size: 25))
                        Group {
                            Toggle(isOn: $BaklavaVisible) {Text("Baklava Visible?")}
                            Toggle(isOn: $CarrotCakeVisible) {Text("Carrot Cake Visible?")}
                            Toggle(isOn: $ChutneyVisible) {Text("Chutney Visible?")}
                            //Toggle(isOn: $DillVisible) {Text("Pickled Dill Carrots Visible?")}
                            Toggle(isOn: $Garlic_Scape_ButterVisible) {Text("Garlic Scape Butter Visible?")}
                            Toggle(isOn: $GazpachoVisible) {Text("Gazpacho Visible?")}
                            Toggle(isOn: $HummusVisible) {Text("Hummus Visible?")}
                            Toggle(isOn: $KohlrabiSlawVisible) {Text("Kohlrabi Slaw Visible?")}
                            //Toggle(isOn: $PickledBeetsVisible) {Text("Pickled Beets Visible?")}
                            Toggle(isOn: $PickledVegetablesVisible) {Text("Pickled Vegetables Visible?")}
                        }
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                        Group {
                            //Toggle(isOn: $PickledOnionsVisible) {Text("Pickled Onions Visible?")}
                            //Toggle(isOn: $Red_Onion_JamVisible) {Text("Red Onion Jam Visible?")}
                            Toggle(isOn: $SalsaVisible) {Text("Salsa Visible?")}
                            Toggle(isOn: $SfeehaVisible) {Text("Sfeeha Visible?")}
                            Toggle(isOn: $SoupVisible) {Text("Soup Visible?")}
                            //Toggle(isOn: $SweetCarrotsVisible) {Text("Sweet Carrots Visible?")}
                            Toggle(isOn: $RelishVisible) {Text("Relish Visible?")}
                        }
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))

                    } //end made with am braigh ingredients VStack
                                    
                    VStack { //retail Vstack
                        Spacer(minLength: 35)
                        Text("Retail")
                            .bold()
                            .font(.custom("San Francisco", size: 25))
                        Group {
                            Toggle(isOn: $Baba_GanoushVisible) {Text("Baba Ganoush Visible?")}
                            Toggle(isOn: $BaguetteVisible) {Text("Baguettes Visible?")}
                            Toggle(isOn: $Beef_BurgersVisible) {Text("Beef Burgers Visible?")}
                            //Toggle(isOn: $Beef_LasagnaVisible) {Text("Beef Lasagna Visible?")}
                            Toggle(isOn: $Beef_SausageVisible) {Text("Beef Sausage Visible?")}
                            Toggle(isOn: $Butter_Chicken_CurryVisible) {Text("Butter Chicken Curry Visible?")}
                            Toggle(isOn: $Cacao_PowderVisible) {Text("Cacao Powder Visible?")}
                            Toggle(isOn: $CheeseVisible) {Text("Cheese Visible?")}
                            Toggle(isOn: $Chocolate_BarVisible) {Text("Chocolate bars Visible?")}
                            Toggle(isOn: $CuttingBoardVisible) {Text("Cutting Board Visible?")}
                        }
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                        Group {
                            //Toggle(isOn: $Cinamon_Cream_HoneyVisible) {Text("Cinamon Cream Honey Visible?")}
                            Toggle(isOn: $Coconut_YogurtVisible) {Text("Coconut Yogurt Visible?")}
                            Toggle(isOn: $CoffeeVisible) {Text("Coffee Visible?")}
                            Toggle(isOn: $Date_CookiesVisible) {Text("Date Cookies Visible?")}
                            Toggle(isOn: $FalafelsVisible) {Text("Falafels Visible?")}
                            Toggle(isOn: $French_LoafVisible) {Text("French Loaf Visible?")}
                            Toggle(isOn: $GroundBeefVisible) {Text("Ground Beef Visible?")}
                            Toggle(isOn: $GranolaVisible) {Text("Granola Visible?")}
                            //Toggle(isOn: $Small_GranolaVisible) {Text("Small Granola Visible?")}
                            //Toggle(isOn: $Large_GranolaVisible) {Text("Large Granola Visible?")}
                            Toggle(isOn: $Small_IcecreamVisible) {Text("Small Icecream Visible?")}
                            Toggle(isOn: $Large_IcecreamVisible) {Text("Large Icecream Visible?")}
                        }
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                        Group {
                            Toggle(isOn: $HoneyVisible) {Text("Honey Visible?")}
                            Toggle(isOn: $KabsaVisible) {Text("Kabsa Visible?")}
                            Toggle(isOn: $LasagnaVisible) {Text("Lasagna Visible?")}
                            //Toggle(isOn: $Pickled_AsparagusVisible) {Text("Pickled Asparagus Visible?")}
                            //Toggle(isOn: $Pickled_CauliflowerVisible) {Text("Pickled Cauliflower Visible?")}
                            Toggle(isOn: $SamosasVisible) {Text("Samosas Visible?")}
                            Toggle(isOn: $StewingBeefVisible) {Text("Stewing Beef Visible?")}
                            Toggle(isOn: $TBone_SteakVisible) {Text("Steak Visible?")}
                            Toggle(isOn: $Turkey_Pot_PieVisible) {Text("Pot Pie Visible?")}
                            Toggle(isOn: $SourdoughVisible) {Text("Sourdough Bread Visible?")}
                        }
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                        Group {
                            Toggle(isOn: $WoodenSpoonVisible) {Text("Wooden Spoon Visible?")}
                            Toggle(isOn: $WoodOilVisible) {Text("Wood Oil Visible?")}
                            Toggle(isOn: $YalanjiVisible) {Text("Yalanji Visible?")}
                            Toggle(isOn: $WholeChickenVisible) {Text("Whole Chicken Visible?")}
                            Toggle(isOn: $Chicken_BreastsVisible) {Text("Chicken Breasts Visible?")}
                            Toggle(isOn: $Chicken_WingsVisible) {Text("Chicken Wings Visible?")}
                            Toggle(isOn: $Bonein_ChickenVisible) {Text("Bone-in Chicken Visible?")}
                            Toggle(isOn: $Chicken_DrumsVisible) {Text("Chicken Drums Visible?")}
                            Toggle(isOn: $Ground_ChickenVisible) {Text("Ground Chicken Visible?")}
                            
                            
                        }
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                    }//end retail VStack
                }// close outer VStack
            } //close form
            
            //priceEntryView(cropPrice: $BasilPrice, price: BasilPrice, name: "Basil")
            //priceEntryView(cropPrice: $GarlicPrice, price: GarlicPrice, name: "Garlic")
            Form {
                VStack { //outer VStack for textfields
                    VStack { //farm produce VStack
                        Text("Farm Produce")
                            .bold()
                            .font(.custom("San Francisco", size: 25))
                        Group {
                            priceEntryView(cropPrice: $ArugulaPrice, price: ArugulaPrice, name: "Arugula")
                            priceEntryView(cropPrice: $AsparagusPrice, price: AsparagusPrice, name: "Asparagus")
                            priceEntryView(cropPrice: $BasilPrice, price: BasilPrice, name: "Basil")
                            priceEntryView(cropPrice: $Beet_GreensPrice, price: Beet_GreensPrice, name: "Beet Greens")
                            priceEntryView(cropPrice: $Holey_BeetgreensPrice, price: Holey_BeetgreensPrice, name: "Imperfect Leaf Beet Greens")
                            //priceEntryView(cropPrice: $BeetsPrice, price: BeetsPrice, name: "Beets") //variations
                            priceEntryView(cropPrice: $BoroBeetsPrice, price: BoroBeetsPrice, name: "Boro Beets")
                            priceEntryView(cropPrice: $StripedBeetsPrice, price: StripedBeetsPrice, name: "Candy Striped Beets")
                            priceEntryView(cropPrice: $CylindraBeetsPrice, price: CylindraBeetsPrice, name: "Cylindra Beets")
                            priceEntryView(cropPrice: $GoldenBeetsPrice, price: GoldenBeetsPrice, name: "Cylindra Beets")
                            priceEntryView(cropPrice: $Bok_ChoyPrice, price: Bok_ChoyPrice, name: "Bok Choy")
                        }
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                        Group {
                            //priceEntryView(cropPrice: $CarrotsPrice, price: CarrotsPrice, name: "Carrots") //variations
                            priceEntryView(cropPrice: $Butterhead_LettucePrice, price: Butterhead_LettucePrice, name: "Butterhead Lettuce")
                            priceEntryView(cropPrice: $CabbagePrice, price: CabbagePrice, name: "Cabbage")
                            priceEntryView(cropPrice: $SmallCarrotsPrice, price: SmallCarrotsPrice, name: "Small Carrots")
                            priceEntryView(cropPrice: $LargeCarrotsPrice, price: LargeCarrotsPrice, name: "Large Carrots")
                            priceEntryView(cropPrice: $CelariacPrice, price: CelariacPrice, name: "Celariac")
                            priceEntryView(cropPrice: $CherryTomatoesPrice, price: CherryTomatoesPrice, name: "Cherry Tomatoes")
                            priceEntryView(cropPrice: $CilantroPrice, price: CilantroPrice, name: "Cilantro")
                            priceEntryView(cropPrice: $CucumbersPrice, price: CucumbersPrice, name: "Cucumbers")
                            priceEntryView(cropPrice: $Juicing_CucumbersPrice, price: Juicing_CucumbersPrice, name: "Juicing Cucumbers")
                            //priceEntryView(cropPrice: $DillPrice, price: DillPrice, name: "Dill")
                        }
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                        Group {
                            priceEntryView(cropPrice: $EggPlantPrice, price: EggPlantPrice, name: "Egg Plant")
                            priceEntryView(cropPrice: $EggsPrice, price: EggsPrice, name: "Eggs")
                            priceEntryView(cropPrice: $Filet_BeansPrice, price: Filet_BeansPrice, name: "Filet Beans")
                            priceEntryView(cropPrice: $FennelPrice, price: FennelPrice, name: "Fennel")
                            priceEntryView(cropPrice: $GarlicPrice, price: GarlicPrice, name: "Garlic")
                            priceEntryView(cropPrice: $GreenOnionsPrice, price: GreenOnionsPrice, name: "Green Onions")
                            priceEntryView(cropPrice: $HeadLettucePrice, price: HeadLettucePrice, name: "Head Lettuce")
                            priceEntryView(cropPrice: $KalePrice, price: KalePrice, name: "Kale")
                            priceEntryView(cropPrice: $KohlrabiPrice, price: KohlrabiPrice, name: "Kohlrabi")
                            priceEntryView(cropPrice: $LeeksPrice, price: LeeksPrice, name: "Leeks")
                            //priceEntryView(cropPrice: $MelonsPrice, price: MelonsPrice, name: "Melons") //variations
                        }
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                        Group {
                            priceEntryView(cropPrice: $SmallMelonsPrice, price: SmallMelonsPrice, name: "Small Melons")
                            priceEntryView(cropPrice: $MediumMelonsPrice, price: MediumMelonsPrice, name: "Medium Melons")
                            priceEntryView(cropPrice: $LargeMelonsPrice, price: LargeMelonsPrice, name: "Large Melons")
                            priceEntryView(cropPrice: $MicrogreensPrice, price: MicrogreensPrice, name: "Microgreens")
                            priceEntryView(cropPrice: $OnionPrice, price: OnionPrice, name: "Onion")
                            priceEntryView(cropPrice: $Onion_BagsPrice, price: Onion_BagsPrice, name: "Onion Bags")
                            priceEntryView(cropPrice: $ParsleyPrice, price: ParsleyPrice, name: "Parsley")
                            priceEntryView(cropPrice: $ParsnipsPrice, price: ParsnipsPrice, name: "Parsnips")
                            //priceEntryView(cropPrice: $PeppersPrice, price: PeppersPrice, name: "Peppers") //variations
                            priceEntryView(cropPrice: $GreenPeppersPrice, price: GreenPeppersPrice, name: "Green Peppers")
                            priceEntryView(cropPrice: $ColoredPeppersPrice, price: ColoredPeppersPrice, name: "Colored Peppers")
                        }
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                        
                        Group {
                            priceEntryView(cropPrice: $PeaShootsPrice, price: PeaShootsPrice, name: "Pea Shoots")
                            priceEntryView(cropPrice: $PumpkinsPrice, price: PumpkinsPrice, name: "Pumpkins")
                            priceEntryView(cropPrice: $Pepper_BagsPrice, price: Pepper_BagsPrice, name: "Pepper Bags")
                            priceEntryView(cropPrice: $RadishesPrice, price: RadishesPrice, name: "Radishes")
                            priceEntryView(cropPrice: $Romaine_LettucePrice, price: Romaine_LettucePrice, name: "Romaine Lettuce")
                            priceEntryView(cropPrice: $RedGreen_HeadlettucePrice, price: RedGreen_HeadlettucePrice, name: "Red and Green Salvanova")
                            priceEntryView(cropPrice: $SaladGreensPrice, price: SaladGreensPrice, name: "Salad Greens")
                            priceEntryView(cropPrice: $SnowPeasPrice, price: SnowPeasPrice, name: "Snow Peas")
                            priceEntryView(cropPrice: $SpinachPrice, price: SpinachPrice, name: "Spinach")
                            priceEntryView(cropPrice: $HoleySpinachPrice, price: HoleySpinachPrice, name: "Imperfect Leaf Spinach")
                        }
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                        
                        Group {
                            priceEntryView(cropPrice: $SummerSquashPrice, price: SummerSquashPrice, name: "Summer Squash")
                            priceEntryView(cropPrice: $SwissChardPrice, price: SwissChardPrice, name: "Swiss Chard")
                            priceEntryView(cropPrice: $BeefsteakBagPrice, price: BeefsteakBagPrice, name: "Beefsteak Bag")
                            priceEntryView(cropPrice: $BeefsteakBasketPrice, price: BeefsteakBasketPrice, name: "Beefsteak Basket")
                            priceEntryView(cropPrice: $YellowHeirloomPrice, price: YellowHeirloomPrice, name: "Yellow Heirloom Bag")
                        }
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                    } //close produce VStack
                    VStack { //imported Produce VStack
                        Spacer(minLength: 1)
                        Text("Imported Produce")
                            .bold()
                            .font(.custom("San Francisco", size: 25))
                        Group {
                            priceEntryView(cropPrice: $TatsoiPrice, price: TatsoiPrice, name: "Tatsoi")
                            priceEntryView(cropPrice: $TurnipsPrice, price: TurnipsPrice, name: "Turnips")
                            priceEntryView(cropPrice: $BroccoliPrice, price: BroccoliPrice, name: "Broccoli")
                            priceEntryView(cropPrice: $Brussel_SproutsPrice, price: Brussel_SproutsPrice, name: "Brussel Sprouts")
                            priceEntryView(cropPrice: $EndivesPrice, price: EndivesPrice, name: "Endives")
                            priceEntryView(cropPrice: $PotatoBagPrice, price: PotatoBagPrice, name: "Potatoes")
                            priceEntryView(cropPrice: $Potato_BasketPrice, price: Potato_BasketPrice, name: "Potato Baskets")
                            priceEntryView(cropPrice: $RutabagaPrice, price: RutabagaPrice, name: "Rutabaga")
                            priceEntryView(cropPrice: $Sweet_PotatoesPrice, price: Sweet_PotatoesPrice, name: "Sweet Potatoes")
                        }
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                    } //end Imported Produce VStack
                    
                    VStack { //Made with Am Braigh Ingredients VStack
                        Spacer(minLength: 35)
                        Text("Made with Am Braigh Ingredients")
                            .bold()
                            .font(.custom("San Francisco", size: 25))
                        Group {
                            priceEntryView(cropPrice: $BaklavaPrice, price: BaklavaPrice, name: "Baklava")
                            priceEntryView(cropPrice: $CarrotCakePrice, price: CarrotCakePrice, name: "Carrot Cake")
                            priceEntryView(cropPrice: $ChutneyPrice, price: ChutneyPrice, name: "Chutney")
                            priceEntryView(cropPrice: $Garlic_Scape_ButterPrice, price: Garlic_Scape_ButterPrice, name: "Garlic Scape Butter")
                            priceEntryView(cropPrice: $GazpachoPrice, price: GazpachoPrice, name: "Gazpacho")
                            priceEntryView(cropPrice: $HummusPrice, price: HummusPrice, name: "Hummus")
                            //priceEntryView(cropPrice: $PickledBeetsPrice, price: PickledBeetsPrice, name: "Pickled Beets")
                            priceEntryView(cropPrice: $KohlrabiSlawPrice, price: KohlrabiSlawPrice, name: "Kohlrabi Slaw")
                            priceEntryView(cropPrice: $DillPrice, price: DillPrice, name: "Pickled Dill Carrots")
                        }
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                        Group {
                            priceEntryView(cropPrice: $PickledVegetablesPrice, price: PickledVegetablesPrice, name: "Pickled Vegetables")
                            //priceEntryView(cropPrice: $PickledOnionsPrice, price: PickledOnionsPrice, name: "Pickled Onions")
                            //priceEntryView(cropPrice: $Red_Onion_JamPrice, price: Red_Onion_JamPrice, name: "Red Onion Jam")
                            priceEntryView(cropPrice: $SalsaPrice, price: SalsaPrice, name: "Salsa")
                            priceEntryView(cropPrice: $SfeehaPrice, price: SfeehaPrice, name: "Sfeeha")
                            priceEntryView(cropPrice: $SoupPrice, price: SoupPrice, name: "Soup")
                            //priceEntryView(cropPrice: $SweetCarrotsPrice, price: SweetCarrotsPrice, name: "Sweet Carrots")
                            //priceEntryView(cropPrice: $RelishPrice, price: RelishPrice, name: "Relish")
                        }
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))

                    } //end made with am braigh ingredients VStack
                                    
                    VStack { //retail Vstack
                        Spacer(minLength: 35)
                        Text("Retail")
                            .bold()
                            .font(.custom("San Francisco", size: 25))
                        Group {
                            priceEntryView(cropPrice: $Baba_GanoushPrice, price: Baba_GanoushPrice, name: "Baba Ganoush")
                            priceEntryView(cropPrice: $BaguettePrice, price: BaguettePrice, name: "Baguettes")
                            priceEntryView(cropPrice: $Beef_BurgersPrice, price: Beef_BurgersPrice, name: "Beef Burgers")
                            //priceEntryView(cropPrice: $Beef_LasagnaPrice, price: Beef_LasagnaPrice, name: "Beef Lasagna")
                            priceEntryView(cropPrice: $Beef_SausagePrice, price: Beef_SausagePrice, name: "Beef Sausage")
                            priceEntryView(cropPrice: $Butter_Chicken_CurryPrice, price: Butter_Chicken_CurryPrice, name: "Butter Chicken Curry")
                            priceEntryView(cropPrice: $Cacao_PowderPrice, price: Cacao_PowderPrice, name: "Cacao Powder")
                            priceEntryView(cropPrice: $CheesePrice, price: CheesePrice, name: "Cheese")
                            priceEntryView(cropPrice: $ChickenPrice, price: ChickenPrice, name: "Chicken")
                            priceEntryView(cropPrice: $Chocolate_BarPrice, price: Chocolate_BarPrice, name: "Chocolate bars")
                        }
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                        Group {
                            priceEntryView(cropPrice: $Cinamon_Cream_HoneyPrice, price: Cinamon_Cream_HoneyPrice, name: "Cinamon Cream Honey")
                            priceEntryView(cropPrice: $Coconut_YogurtPrice, price: Coconut_YogurtPrice, name: "Coconut Yogurt")
                            priceEntryView(cropPrice: $CoffeePrice, price: CoffeePrice, name: "Coffee")
                            //priceEntryView(cropPrice: $CuttingBoardPrice, price: CuttingBoardPrice, name: "Cutting Board Price")
                            priceEntryView(cropPrice: $Date_CookiesPrice, price: Date_CookiesPrice, name: "Date Cookies")
                            priceEntryView(cropPrice: $FalafelsPrice, price: FalafelsPrice, name: "Falafels")
                            priceEntryView(cropPrice: $French_LoafPrice, price: French_LoafPrice, name: "French Loaf")
                            priceEntryView(cropPrice: $GroundBeefPrice, price: GroundBeefPrice, name: "Ground Beef")
                            priceEntryView(cropPrice: $Small_GranolaPrice, price: Small_GranolaPrice, name: "Small Granola")
                            priceEntryView(cropPrice: $Large_GranolaPrice, price: Large_GranolaPrice, name: "Large Granola")
                            
                        }
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                        Group {
                            priceEntryView(cropPrice: $Small_IcecreamPrice, price: Small_IcecreamPrice, name: "Small Icecream")
                            priceEntryView(cropPrice: $Large_IcecreamPrice, price: Large_IcecreamPrice, name: "Large Icecream")
                            priceEntryView(cropPrice: $KabsaPrice, price: KabsaPrice, name: "Kabsa")
                            priceEntryView(cropPrice: $LasagnaPrice, price: LasagnaPrice, name: "Lasagna")
                            //priceEntryView(cropPrice: $Pickled_AsparagusPrice, price: Pickled_AsparagusPrice, name: "Pickled Asparagus")
                            //priceEntryView(cropPrice: $Pickled_CauliflowerPrice, price: Pickled_CauliflowerPrice, name: "Pickled Cauliflower")
                            priceEntryView(cropPrice: $SamosasPrice, price: SamosasPrice, name: "Samosas")
                            priceEntryView(cropPrice: $SourdoughPrice, price: SourdoughPrice, name: "Sourdough Bread")
                            priceEntryView(cropPrice: $StewingBeefPrice, price: StewingBeefPrice, name: "Stewing Beef")
                            priceEntryView(cropPrice: $TBone_SteakPrice, price: TBone_SteakPrice, name: "Steak")
                        }
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                        Group {
                            priceEntryView(cropPrice: $Turkey_Pot_PiePrice, price: Turkey_Pot_PiePrice, name: "Pot Pie")
                            priceEntryView(cropPrice: $WholeChickenPrice, price: WholeChickenPrice, name: "Whole Chicken")
                            priceEntryView(cropPrice: $White_Cream_HoneyPrice, price: White_Cream_HoneyPrice, name: "White Cream Honey")
                            priceEntryView(cropPrice: $Wildflower_HoneyPrice, price: Wildflower_HoneyPrice, name: "Wildflower Honey")
                            priceEntryView(cropPrice: $WoodenSpoonPrice, price: WoodenSpoonPrice, name: "Wooden Spoon Price")
                            priceEntryView(cropPrice: $WoodOilPrice, price: WoodOilPrice, name: "Wood Oil Price")
                            priceEntryView(cropPrice: $YalanjiPrice, price: YalanjiPrice, name: "Yalanji")
                        }
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0))
                    }//end retail VStack
                } // Close Vstack for textfields
            } //close form for textfields
        } //close outer HStack
    } //close body
} //close view

extension AdminView {
    //the price Enum type has P as a prefix to all of its cases. So Carrots becomes PCarrots etc. This is to differentiate them from the isVisible Enum cases. These Enum types get converted into Strings and are the keys used to identify their values in app storage. The P prefix from the price Enum cases is removed before storing it as a String in PriceDict in CartData so that the Strings can be formatted in the same way as reference names for products.
    enum price: String {
        case PSmall_Carrots
        case PLarge_Carrots
        case PStriped_Beets
        case PCylindra_Beets
        case PGolden_Beets
        case PGreen_Peppers
        case PColored_Peppers
        case PDill
        case PGarlic
        case PSnow_Peas
        case PPotato_Bag
        case PSalad_Greens
        case PLeeks
        case PEgg_Plant
        case PBasil
        case POnions
        case PMicrogreens
        case PHead_Lettuce
        case PSpinach
        case PCucumbers
        case PFennel
        case PSummer_Squash
        case PRadishes
        case PKale
        case PTomatoes
        case PParsley
        case PKohlrabi
        case PSquash
        case PTurnips
        case PSwiss_Chard
        case PCherry_Tomatoes
        case PCilantro
        case PGreen_Onions
        case PSmall_Melons
        case PMedium_Melons
        case PLarge_Melons
        case PCabbage
        
        case PArugula
        case PAsparagus
        case PTatsoi
        case PBok_Choy
        case PBroccoli
        case PCelariac
        case PBrussel_Sprouts
        case PEndives
        case PParsnips
        case PPumpkins
        case PRutabaga
        case PSweet_Potatoes
        case PButterhead_Lettuce
        case PRedGreen_Headlettuce
        case POnion_Bags
        case PFilet_Beans
        case PEggs
        case PBeet_Greens
        case PRomaine_Lettuce
        
        
        case PSalsa
        case PPickled_Vegetables
        //case PPhil_Sauce
        //case PSweet_Carrots
        //case PPickled_Onions
        case PLasagna
        case PSoup
        case PCarrot_Cake
        //case PPickled_Beets
        case PBaguette
        case PStewing_Beef
        case PCheese
        case PWhole_Chicken
        case PChicken
        case PCoffee
        case PGround_Beef
        
        //case PDill_Carrots
        //case PPickled_Asparagus
        case PRed_Onion_Jam
        //case PPickled_Cauliflower
        case PRelish
        case PBeef_Burgers
        case PWildflower_Honey
        case PWhite_Cream_Honey
        case PChocolate_Bar
        case PCinamon_Cream_Honey
        case PHoney
        case PFrench_Loaf
        case PBaba_Ganoush
        case PTBone_Steak
        case PYalanji
        case PDate_Cookies
        case PTurkey_Pot_Pie
        case PBeef_Sausage
        case PButter_Chicken_Curry
        //case PBeef_Lasagna
        case PChutney
        case PKabsa
        case PSamosas
        case PCoconut_Yogurt
        case PFalafels
        
        case PPepper_Bag
        case PJuicing_Cucumbers
        case PBaklava
        case PHummus
        case PSfeeha
        case PGarlic_Scape_Butter
        case PGazpacho
        case PChicken_Breasts
        case PChicken_Wings
        case PBonein_Chicken
        case PChicken_Drums
        case PGround_Chicken
        case PCacao_Powder
        
        case PSmall_Icecream
        case PLarge_Icecream
        case PSmall_Granola
        case PLarge_Granola
        
        case PBoro_Beets
        case PBeefsteak_Bag
        case PBeefsteak_Basket
        case PYellow_Heirloom
        
        case PAcorn_Squash
        case PButternut_Squash
        case PSpaghetti_Squash
        case PPotato_Basket
        //case Green_Cabbage
        case PRed_Cabbage
        case PPea_Shoots
        case PHoley_Beetgreens
        case PHoley_Spinach
        
        case PGranola
        case POnion
        case PPotatoes
        
        case PCutting_Board
        case PWooden_Spoon
        case PWood_Oil
        case PKohlrabi_Slaw
        case PSourdough
        //case PRoast
        
    }
    
    enum isVisible: String {
        case Carrots
        case Small_Carrots
        case Large_Carrots
        case Beets
        case Striped_Beets
        case Cylindra_Beets
        case Golden_Beets
        case Green_Peppers
        case Colored_Peppers
        case Peppers
        case Dill
        case Garlic
        case Snow_Peas
        case Potato_Bag
        case Salad_Greens
        case Leeks
        case Egg_Plant
        case Basil
        case Onions
        case Microgreens
        case Head_Lettuce
        case Spinach
        case Cucumbers
        case Fennel
        case Summer_Squash
        case Radishes
        case Kale
        case Tomatoes
        case Parsley
        case Kohlrabi
        case Squash
        case Turnips
        case Swiss_Chard
        case Cherry_Tomatoes
        case Cilantro
        case Green_Onions
        case Melons
        case Small_Melons
        case Medium_Melons
        case Large_Melons
        case Cabbage
        
        case Arugula
        case Asparagus
        case Tatsoi
        case Bok_Choy
        case Broccoli
        case Celariac
        case Brussel_Sprouts
        case Endives
        case Parsnips
        case Pumpkins
        case Rutabaga
        case Sweet_Potatoes
        case Butterhead_Lettuce
        case RedGreen_Headlettuce
        case Onion_Bags
        case Filet_Beans
        case Eggs
        case Beet_Greens
        case Romaine_Lettuce
        
        case Salsa
        case Pickled_Vegetables
        //case Phil_Sauce
        //case Sweet_Carrots
        //case Pickled_Onions
        case Lasagna
        case Soup
        case Carrot_Cake
        //case Pickled_Beets
        case Baguette
        case Stewing_Beef
        case Cheese
        case Whole_Chicken
        case Chicken
        case Coffee
        case Ground_Beef
        
        //case Dill_Carrots
        //case Pickled_Asparagus
        case Red_Onion_Jam
        //case Pickled_Cauliflower
        case Relish
        case Beef_Burgers
        case Wildflower_Honey
        case White_Cream_Honey
        case Cinamon_Cream_Honey
        case Chocolate_Bar
        case Honey
        case French_Loaf
        case Baba_Ganoush
        case TBone_Steak
        case Yalanji
        case Date_Cookies
        case Turkey_Pot_Pie
        case Beef_Sausage
        case Butter_Chicken_Curry
        //case Beef_Lasagna
        case Chutney
        case Kabsa
        case Samosas
        case Coconut_Yogurt
        case Falafels
        
        case Pepper_Bag
        case Juicing_Cucumbers
        case Baklava
        case Hummus
        case Sfeeha
        case Garlic_Scape_Butter
        case Gazpacho
        case Chicken_Breasts
        case Chicken_Wings
        case Bonein_Chicken
        case Chicken_Drums
        case Ground_Chicken
        case Cacao_Powder
        case Small_Icecream
        case Large_Icecream
        case Small_Granola
        case Large_Granola
        
        case Boro_Beets
        case Beefsteak_Bag
        case Beefsteak_Basket
        case Yellow_Heirloom
        
        case Acorn_Squash
        case Butternut_Squash
        case Spaghetti_Squash
        case Potato_Basket
        //case Green_Cabbage
        case Red_Cabbage
        case Pea_Shoots
        case Holey_Beetgreens
        case Holey_Spinach
        
        case Granola
        case Onion
        case Potatoes
        
        case Cutting_Board
        case Wooden_Spoon
        case Wood_Oil
        case Kohlrabi_Slaw
        case Sourdough
        //case Roast
    }
}
