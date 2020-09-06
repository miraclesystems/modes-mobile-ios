//
//  BenefitsViewModel.swift
//  modes-mobile-ios
//
//  Created by yada on 9/6/20.
//

import Foundation

class BenefitsViewModel  {

   
    var selectedCategory = ""
    var selectedBenefit = ""
    //var model = BenefitsModel()

    
    


    func getCategories()-> [String]{

        let list = [String](arrayLiteral: "New to MilLife*",
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

        return list
    }

    func getAllBenefits()->[Benefit]{

        var list = [Benefit]()
        var results = ModesDb.shared.getAllBenefits()

        for item in results{
            
            var benefit = Benefit()
        
            benefit.Benefit = item["Benefit"] as? String
            benefit.ShortDescription = item["Short Description"] as? String
            benefit.LongDescription = item["Long Description"] as? String
            benefit.ButtonText = item["Button Text"] as? String
            benefit.BenefitLink = item["Benefit Link"] as? String

            list.append(benefit)
        }
        return list
    }

    func getBenifitsByCategory()-> [Benefit]{

        var list = [Benefit]()
        var results = ModesDb.shared.getBenefitByCategory(category: self.selectedCategory)

        for item in results{
            var benefit = Benefit()
             benefit.Benefit = item["Benefit"] as? String
             benefit.ShortDescription = item["Short Description"] as? String

            list.append(benefit)
        }
    return list
    }

    func getSelectedBenefit()-> Benefit{

        var benefit = Benefit()

        var results = ModesDb.shared.getBenefitByName(name: self.selectedBenefit)

        
        benefit.ID = results[0]["ID"] as? Int
        benefit.Benefit = results[0]["Benefit"] as? String
        benefit.ShortDescription = results[0]["Short Description"] as? String
        benefit.LongDescription = results[0]["Long Description"] as? String
        benefit.ButtonText = results[0]["Button Text"] as? String
        benefit.BenefitLink = results[0]["Benefit Link"] as? String
        
        if((results[0]["favorite"] as! Int) == 1){
             benefit.favorite = true
         }
         else{
              benefit.favorite = false
         }
        
        return benefit
    }
}
