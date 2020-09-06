//
//  FavoritesViewModel.swift
//  modes-mobile-ios
//
//  Created by yada on 9/5/20.
//

import Foundation

class FavoritesViewModel: NSObject, WebServiceConnectorDelegate{
    
    @objc dynamic var dataLoaded = false
    var hasDataError = false
    var dataError : String = ""
    var locationsModel : LocationsModel?
    
    
    func getInstallation()-> Bool{

        var retval = false

        var id = PreferencesUtil.shared.installation ?? ""
        if(id.isEmpty){
            return false
        }
        else {

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
        print("error")
    }
    
    func onSuccess(_ jsonString: String) {
        print("success")
        
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
        
       
    }
    

  
    
    
}

class FavoritesViewModelObserver : NSObject{
    
    @objc var viewModel : BaseViewModel
       var observation: NSKeyValueObservation?
    
    init(object: BaseViewModel) {
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
