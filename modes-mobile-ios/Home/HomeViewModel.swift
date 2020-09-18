//
//  HomeViewModel.swift
//  modes-mobile-ios
//
//  Created by Joseph Sortino on 8/24/20.
//


import Foundation
class HomeViewModel : NSObject, WebServiceConnectorDelegate{
    
    @objc dynamic var dataLoaded = false
    var hasDataError = false
    var dataError : String = ""
    
    var topic = ""
    
    let model = HomeModel()
    
    func onError(_ apiError: Error) {
        print("error")
    }
    
    func onSuccess(_ jsonString: String) {
        print("success")
        
       
    }
    

    func getValue(){
        dataLoaded = true
    }
    
    
    func getGuides(topic: String)-> [String]{

        var list = [String]()

        var results = ModesDb.shared.getGuidesByKeyWordSearch(searchTerm: topic)
        for result in results{
    
            var guide = result["Guide"] as! String
            list.append(guide)

        }
        return list
    }
    func getBenefits(topic: String)-> [String]{

        var list = [String]()

        var results = ModesDb.shared.getBenefitsByKeyWordSearch(searchTerm: topic)
        for result in results{
    
            var benefit = result["Benefit"] as! String
            list.append(benefit)

        }
        return list
    }
    
    func getTopics(topic : String)->[String]{
        
        var list = [String]()
        var results = ModesDb.shared.getGuidesByKeyWordSearch(searchTerm: topic)
        
        for item in results{
            
            var keywords = item["MilLife Guide Topic Keywords"] as! String
            var keywords_array = keywords.split(separator: ",")

            for keyword in keywords_array{
                if(keyword.contains(topic))
                {
                    list.append(String(keyword).trimmingCharacters(in: .whitespacesAndNewlines))
                }
            }
        }
        
        
        results = ModesDb.shared.getBenefitsByKeyWordSearch(searchTerm: topic)
        for item in results{
            
            var keywords = item["Keywords"] as! String
            var keywords_array = keywords.split(separator: ",")

            for keyword in keywords_array{
                if(keyword.contains(topic)){
                    list.append(String(keyword).trimmingCharacters(in: .whitespacesAndNewlines))
                }
                
            }
        }
        
        let unique = Array(Set(list))

        return unique
    }
    
    func getSuggestedCards()->[HomePageCardModel]{
        
       var list = [HomePageCardModel]()
        
        var results = ModesDb.shared.getBenefitsByAudience(audience: PreferencesUtil.shared.userDescription)
        
        for item in results{
            
            var card = HomePageCardModel()
            card.id = item["ID"] as! Int?
            card.cardTitle = item["Benefit"] as! String
            card.cardType = "BENEFIT"
            card.recommended = true
                
            list.append(card)
        }
        
        print("userDescription: ", PreferencesUtil.shared.userDescription)
        results = ModesDb.shared.getGuidesByAudience(audience: PreferencesUtil.shared.userDescription)
        for item in results{

            var card = HomePageCardModel()
            card.id = item["ID"] as! Int?
            card.cardTitle = item["Guide"] as! String
            card.cardType = "MILLIFE GUIDES"
            card.recommended = true

            list.append(card)

        }

        
        var card = HomePageCardModel()
        card.id = 1
        card.cardTitle = "Speak with a consultant 24/7"
        card.cardType = "CONNECT"
        card.recommended = false

        list.append(card)
        
        
        var card1 = HomePageCardModel()
        card1.id = 1
        card1.cardTitle = "Give us your feedback"
        card1.cardType = "ABOUT US"
        card1.recommended = false

        list.append(card1)
        
        print("results returned")
        
        return list
    }
    
}

class HomeViewModelObserver : NSObject{
    
    @objc var viewModel : HomeViewModel
       var observation: NSKeyValueObservation?
    
    init(object: HomeViewModel) {
        viewModel = object
        super.init()
        
        observation = observe(
            \.viewModel.dataLoaded,
            options: [.old, .new]
        ) { object, change in
            print("data changed")
            
            
        }
    }
}
