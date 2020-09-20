//
//  HomeModel.swift
//  modes-mobile-ios
//
//  Created by Joseph Sortino on 8/24/20.
//
import Foundation


class HomeModel : Codable{
    
    var value : String? = "Hello World"
    
}

class HomePageGuide : Codable{
    var ID : Int?
    var GuideTitle : String?
    var GuideImage : String?
}


class HomePageCardModel : Codable{

    var id : Int?
    var cardType : String?
    var cardTitle : String?
    var recommended : Bool?
}
