//
//  GuidesModel.swift
//  modes-mobile-ios
//
//  Created by yada on 9/3/20.
//

import Foundation


class Article{

    var name : String?
    var url :  String?
    var image : String?
}

class RelatedBenefit{
    var id : String?
    var benefit : String?
    var description : String?
}

class Guide{
    var ID : Int?
    var Category : String?
    var Guide : String?
    var GuideHeader : String?
    var Overview : String?
    var GuideImage : String?
    var ArticleHeader : String?
    var Article1Text : String?
    var Article1URL : String?
    var Article1Image : String?
    var Article2Text : String?
    var Article2URL : String?
    var Article2Image : String?
    var Article3Text : String?
    var Article3URL : String?
    var Article3Image : String?
    var Article4Text : String?
    var Article4URL : String?
    var Article4Image : String?
    var MoreArticlesText : String?
    var MoreArticlesURL : String?
    var RelatedBenefitsHeader : String?
    var RelatedBenefits : [String?]?
    var MoreBenefitsText : String?
    var MoreBenefitsURL : String?
    var RelatedWebsitesText : [String?]?
    var RelatedWebsitesURL : [String?]?
    var ExpertsText :[String?]?

    var listArticles : [Article?]?
    var listRelatedBenefits : [RelatedBenefit]?

    var ExpertsHeader : String?
    var ExpertsHeader1: String?
    var favorite: Bool?
}

