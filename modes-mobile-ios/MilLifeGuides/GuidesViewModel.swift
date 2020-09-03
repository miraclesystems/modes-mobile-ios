//
//  GuidesViewModel.swift
//  modes-mobile-ios
//
//  Created by yada on 9/3/20.
//

import Foundation

class GuidesViewModel{
    
    var selectedGuide = ""
    var selectedCategory = ""
    var categories = [String](arrayLiteral: "New to MilLife",
            "Moving & Housing",
            "Deployment",
            "Transition Assistance",
            "Pandemic & Disaster Preparedness",
            "Survivors & Casualty Assistance",
            "Relationships",
            "Military Family Life",
            "Financial & Legal",
            "Personal Development & Employment",
            "Confidential Help & Support",
            "Health & Wellness*",
            "Recreation & Travel",
            "Shopping & Exclusive Offers",
            "National Guard & Reserve")



    /*
    func getGuideCategories():[String]{
        return categories
    }


    fun getBenefitById(id : String): RelatedBenefit{

        var benefit = RelatedBenefit(null,null, null)
        var results = ModesDb.getBenefitById(id)

        results!!.moveToFirst()
        benefit.id = id
        benefit.benefit = results.getString(results.getColumnIndex("Benefit"))
        benefit.description = results.getString(results.getColumnIndex("Short Description"))

        return benefit


    }
    fun getGuide():Guide {
        var guide = Guide(
            null, null, null, null, null, null,
            null, null, null, null,
            null, null, null, null, null, null,
            null, null, null, null, null, null, null,
            null, null, null, null, null, null, null,
            null, null
        )


        var results = ModesDb.getGuideByName(this.selectedGuide)

        results!!.moveToFirst()
        // now lets setup the guide
        guide.ID = results.getInt(results.getColumnIndex("ID"))
        guide.Category = results.getString(results.getColumnIndex("Category"))
        guide.Guide = results.getString(results.getColumnIndex("Guide"))
        guide.GuideHeader = results.getString(results.getColumnIndex("Guide Header"))
        guide.Overview = results.getString(results.getColumnIndex("Overview -- Guide Intro Copy"))
        guide.GuideImage = results.getString(results.getColumnIndex("Guide Image"))
        guide.ArticleHeader =
            results.getString(results.getColumnIndex("Article block Header (STYLED)"))
        guide.Article1Text = results.getString(results.getColumnIndex("Article 1 Text"))
        guide.Article1URL = results.getString(results.getColumnIndex("Article 1 URL"))
        guide.Article1Image = results.getString(results.getColumnIndex("Article 1 Image"))
        guide.Article2Text = results.getString(results.getColumnIndex("Article 2 Text"))
        guide.Article2URL = results.getString(results.getColumnIndex("Article 2 URL"))
        guide.Article2Image = results.getString(results.getColumnIndex("Article 2 Image"))
        guide.Article3Text = results.getString(results.getColumnIndex("Article 3 Text"))
        guide.Article3URL = results.getString(results.getColumnIndex("Article 3 URL"))
        guide.Article3Image = results.getString(results.getColumnIndex("Article 3 Image"))
        guide.Article4Text = results.getString(results.getColumnIndex("Article 4 Text"))
        guide.Article4URL = results.getString(results.getColumnIndex("Article 4 URL"))
        guide.Article4Image = results.getString(results.getColumnIndex("Article 4 Image"))
        guide.MoreArticlesText = results.getString(results.getColumnIndex("Article Button"))
        guide.MoreArticlesURL = results.getString(results.getColumnIndex("Article Button URL"))
        guide.RelatedBenefitsHeader =
            results.getString(results.getColumnIndex("Benefits Section Header Text Styled"))

        var relatedBenefits = results.getString(results.getColumnIndex("Related Benefits"))
        guide.RelatedBenefits = relatedBenefits.split(",")

        guide.listRelatedBenefits = mutableListOf<RelatedBenefit>()
        for (item in guide.RelatedBenefits!!) {
            var benefit = getBenefitById(item)
            (guide.listRelatedBenefits as MutableList<RelatedBenefit>).add(benefit)
        }

        guide.MoreBenefitsText = results.getString(results.getColumnIndex("Benefits button text"))
        guide.MoreBenefitsURL = results.getString(results.getColumnIndex("Benefits button URL"))


        var relatedWebsites = results.getString(results.getColumnIndex("Related Websites & Tools"))
        guide.RelatedWebsitesText = relatedWebsites.split(",")

        var relatedWebsitesUrls =
            results.getString(results.getColumnIndex("Related Websites & Tools URLs"))
        guide.RelatedWebsitesURL = relatedWebsitesUrls.split(",")

        var expertsText = results.getString(results.getColumnIndex("Experts Text"))
        guide.ExpertsText = expertsText.split("\n")


        guide.ExpertsHeader = guide.ExpertsText!![0]
        guide.ExpertsHeader1 = guide.ExpertsText!![1]

        var list = mutableListOf<String>()

        var count = 0
        for (expert in guide.ExpertsText!!) {
            if (count == 0 || count == 1 || expert == " ") {
                count++
                continue
            } else if (expert == "") {
                count++
                continue
            }
            else{
                count++
                list.add(expert)
            }
        }

        guide.ExpertsText = list





        return guide
    }
    */

    func getAllGuides()->[String]{

        var list = [String]()
        var results = ModesDb.shared.getAllGuiides()

        
        for item in results{
            list.append(item["Guide"] as! String)
        }

        return list
    }


    func getGuiesByCategory(category : String)-> [String]{

        var list = [String]()
        var results = ModesDb.shared.getGuidesByCategory(category: category)

        for item in results{
            list.append(item["Guide"] as! String)
        }

        return list
    }



}
