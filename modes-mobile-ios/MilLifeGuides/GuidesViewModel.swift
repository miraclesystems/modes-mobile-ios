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


    func getCategories()-> [String]{
        
        var list = [String]()
        let results = ModesDb.shared.getGuideCategories()

        for item in results{
        
            let category = item["Category"] as? String
            list.append(category!)
        }
        return list
        

    }

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

    func getAllGuides()->[Guide]{

        var list = [Guide]()
        var results = ModesDb.shared.getAllGuiides()

        
        for item in results{
            
            self.selectedGuide = item["Guide"] as! String
            //list.append(item["Guide"] as! String)
            
            
            var guide =  getGuide()
            list.append(guide)
            
        }

        return list
    }


    func getGuidesByCategory(category : String)-> [Guide]{

        var list = [Guide]()
        var results = ModesDb.shared.getGuidesByCategory(category: category)

        
        for item in results{
            self.selectedGuide = item["Guide"] as! String
            list.append(getGuide())
        }

        return list
    }
    
    func getGuidesByName(title: String)-> [String]{
        var list = [String]()
        var results = ModesDb.shared.getGuideByName(guide: title)
        
        for item in results{
            list.append(item["Guide"] as! String)
        }

        return list
        
    }
    
    
    func getBenefitById(id : String)-> RelatedBenefit{

        let benefit = RelatedBenefit()
        let results = ModesDb.shared.getBenefitById(id: id)

       
        benefit.id = id

        //benefit.benefit = results[0]["Benefit"] as? String
        //benefit.description = results[0]["Short Description"] as? String
        
        if results.count != 0 {
            benefit.benefit = results[0]["Benefit"] as? String
            benefit.description = results[0]["Short Description"] as? String
        }
       


        return benefit


    }
    func getGuide()->Guide{
        
        var guide = Guide()
        
        var results = ModesDb.shared.getGuideByName(guide: self.selectedGuide)
        
        guide.ID = results[0]["ID"] as? Int
        guide.Category = results[0]["Category"] as? String
        guide.Guide = results[0]["Guide"] as? String
        guide.GuideHeader = results[0]["Guide Header"] as? String
        guide.Overview = results[0]["Overview -- Guide Intro Copy"] as? String
        guide.GuideImage = results[0]["Guide Image"] as? String
        guide.ArticleHeader =
            results[0]["Article block Header (STYLED)"] as? String
        guide.Article1Text =  results[0]["Article 1 Text"] as? String
        guide.Article1URL =  results[0]["Article 1 URL"] as? String
        guide.Article1Image =  results[0]["Article 1 Image"] as? String
        guide.Article2Text =  results[0]["Article 2 Text"] as? String
        guide.Article2URL =  results[0]["Article 2 URL"] as? String
        guide.Article2Image =  results[0]["Article 2 Image"] as? String
        guide.Article3Text =  results[0]["Article 3 Text"] as? String
        guide.Article3URL =  results[0]["Article 3 URL"] as? String
        guide.Article3Image =  results[0]["Article 3 Image"] as? String
        guide.Article4Text =  results[0]["Article 4 Text"] as? String
        guide.Article4URL =  results[0]["Article 4 URL"] as? String
        guide.Article4Image =  results[0]["Article 4 Image"] as? String
        
        
        guide.listArticles = [Article]()
        for index in 0...3{

            switch index {
           
           
            case 0:
            
                let article = Article()
                article.name = guide.Article1Text
                article.image = guide.Article1Image
                article.url = guide.Article1URL
                    
                guide.listArticles?.append(article)
                
            case 1:
                
                let article = Article()
                article.name = guide.Article2Text
                article.image = guide.Article2Image
                article.url = guide.Article2URL
                    
                guide.listArticles?.append(article)
                
            case 2:
                let article = Article()
                article.name = guide.Article3Text
                article.image = guide.Article3Image
                article.url = guide.Article3URL
                    
                guide.listArticles?.append(article)
                
            case 3:
                let article = Article()
                article.name = guide.Article4Text
                article.image = guide.Article4Image
                article.url = guide.Article4URL
                    
                guide.listArticles?.append(article)

            default:
                print("default do nothing")
            }
        }
        
        
        
        
        guide.MoreArticlesText =  results[0]["Article Button"] as? String
        guide.MoreArticlesURL =  results[0]["Article Button URL"] as? String
        guide.RelatedBenefitsHeader =
             results[0]["Benefits Section Header Text Styled"] as? String

        let relatedBenefits =  results[0]["Related Benefits"] as? String
        guide.RelatedBenefits = relatedBenefits?.components(separatedBy: ",")

        guide.listRelatedBenefits = [RelatedBenefit]()
        for item in guide.RelatedBenefits! {
            if(item != ""){
                var benefit = getBenefitById(id: item!)
                 guide.listRelatedBenefits?.append(benefit)
            }
           
    
        }

        guide.MoreBenefitsText =  results[0]["Benefits button text"] as? String
        guide.MoreBenefitsURL =  results[0]["Benefits button URL"] as? String


        var relatedWebsites =  results[0]["Related Websites & Tools"] as? String
        guide.RelatedWebsitesText = relatedWebsites?.components(separatedBy: ",")

        var relatedWebsitesUrls =
             results[0]["Related Websites & Tools URLs"] as? String
        guide.RelatedWebsitesURL = relatedWebsitesUrls?.components(separatedBy: ",")

        var expertsText =  results[0]["Experts Text"] as? String
        guide.ExpertsText = expertsText?.components(separatedBy: "\n")


        
        if(guide.ExpertsText!.count > 1 ?? 0){
            guide.ExpertsHeader = guide.ExpertsText?[0]
            guide.ExpertsHeader1 = guide.ExpertsText?[1]
        }

        var list = [String]()

        var count = 0
        for expert in guide.ExpertsText! {
            if (count == 0 || count == 1 || expert == " ") {
                count = count + 1
                continue
            } else if (expert == "") {
                count = count + 1
                continue
            }
            else{
                count = count + 1
                list.append(expert!)
            }
        }

        guide.ExpertsText = list
        if((results[0]["favorite"] as! Int) == 1){
            guide.favorite = true
        }
        else{
            guide.favorite = false
        }
       
        
        return guide
    }



}
