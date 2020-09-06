//
//  BenefitsModel.swift
//  modes-mobile-ios
//
//  Created by yada on 9/6/20.
//

import Foundation

class Benefit : Codable{

    var ID : Int?
    var Category : String?
    var Benefit : String?
    var CategoriesPrimary : String?
    var ShortDescription: String?
    var LongDescription: String?
    var ButtonText : String?
    var BenefitLink : String?
    var favorite: Bool?
}
