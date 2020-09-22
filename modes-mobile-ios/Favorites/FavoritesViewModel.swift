//
//  FavoritesViewModel.swift
//  modes-mobile-ios
//
//  Created by yada on 9/5/20.
//

import Foundation

class FavoritesViewModel: NSObject, WebServiceConnectorDelegate{
    
    
    var emailId : String = ""
    
    @objc dynamic var dataLoaded = false
    var gettingInstallationInfo = false
    @objc dynamic var hasDataError = false
    var dataError : String = ""
    var locationsModel : LocationsModel?
    
    
    @objc dynamic var emailIdLoaded = false
    var gettingEmailId = false
    
    
    func getInstallationEmailId(){
        //https://apps.pre.militaryonesource.mil/omos/pre-production/getInstallationContactsbyDirectory/3145/1

        gettingEmailId = true
        
        let id : String =  PreferencesUtil.shared.installation
        let  urlString =  BASE_URL + "/getInstallationContactsbyDirectory/\(id)/1"
        let webserviceConnector = WebServiceConnector(urlString: urlString, delegate: self)
        webserviceConnector.get()
        
    }
    
    
    func getInstallation()-> Bool{

        var retval = false

        var id = PreferencesUtil.shared.installation ?? ""
        if(id.isEmpty){
            return false
        }
        else {

            gettingInstallationInfo = true
            var  urlString =  BASE_URL + "/getInstallationInfo/" + id
            var webserviceConnector = WebServiceConnector(urlString: urlString, delegate: self)
            webserviceConnector.get()

            return true
        }
    }
    
    
    func getFavoriteGuides()->[FavoriteItem]{

        var results = ModesDb.shared.getGuidesFavorites()

        var list = [FavoriteItem]()

        for favorite in results{
           var item = FavoriteItem()
            item.ID = favorite["ID"] as! Int
            item.name = favorite["Guide"] as? String
            item.type = "GUIDE"

            list.append(item)
        }
    
        return list
    }
    
    func getFavoriteBenefits()->[FavoriteItem]{

        var results = ModesDb.shared.getBenefitsFavorites()

        var list = [FavoriteItem]()

        for favorite in results{
           var item = FavoriteItem()
            item.ID = favorite["ID"] as! Int
            item.name = favorite["Benefit"] as? String
            item.type = "BENEFIT"
            list.append(item)
        }
    
        return list
    }
    
    
    
    
    //let model = ()
    
    func onError(_ apiError: Error) {
        print("onError Favorites")
        hasDataError = true
    }
    
    func onSuccess(_ jsonString: String) {
        print("success")
        
        if(gettingInstallationInfo){
            do{
                 let JSONData = try jsonString.data(using: .utf8)!
                 let model = try JSONDecoder().decode(LocationsModel.self, from: JSONData)
                 self.locationsModel = model
                 print(self.locationsModel)
                
                dataLoaded = true
                
             }
             catch let DecodingError.dataCorrupted(context) {
                 print(context)
             } catch let DecodingError.keyNotFound(key, context) {
                 print("Key '\(key)' not found:", context.debugDescription)
                 print("codingPath:", context.codingPath)
             } catch let DecodingError.valueNotFound(value, context) {
                 print("Value '\(value)' not found:", context.debugDescription)
                 print("codingPath:", context.codingPath)
             } catch let DecodingError.typeMismatch(type, context)  {
                 print("Type '\(type)' mismatch:", context.debugDescription)
                 print("codingPath:", context.codingPath)
             } catch {
                 print("error: ", error)
             }
            gettingInstallationInfo = false
        }
        else{
            let JSONData = try jsonString.data(using: .utf8)!
            let jsonResult = try! JSONSerialization.jsonObject(with: JSONData, options: .mutableLeaves)
            let result = jsonResult as? Dictionary<String, AnyObject>
            
            let items = result?["items"] as! Array<AnyObject> as Array<AnyObject>
            self.emailId = String(items[0]["CONT_ID"] as! Int)
            
            emailIdLoaded = true
        }
    }
    

  
    
    
}

class FavoritesViewModelObserver : NSObject{
    
    @objc var viewModel : FavoritesViewModel
       var observation: NSKeyValueObservation?
    
    init(object: FavoritesViewModel) {
        viewModel = object
        super.init()
        
        observation = observe(
            \.viewModel.dataLoaded,
            options: [.old, .new]
        ) { object, change in
            print("data changed")
        }
        observation = observe(
            \.viewModel.emailIdLoaded,
            options: [.old, .new]
        ) { object, change in
            print("data changed")
        }
        observation = observe(
            \.viewModel.hasDataError,
            options: [.old, .new]
        ) { object, change in
            print("hasDataError changed")
        }
        
        
    }
}
