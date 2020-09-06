//
//  UserSettingsViewModel.swift
//  modes-mobile-ios
//
//  Created by yada on 8/20/20.
//

import Foundation

class UserSettingsViewModel : NSObject, WebServiceConnectorDelegate{
    
    @objc dynamic var dataLoaded : Bool = false
    var hasDataError = false
    var dataError : String = ""
    var loadingLocations = false
    var loadingLocationsByPostal = false
    
    
    var locationsModel = LocationsModel()
    
    func onError(_ apiError: Error) {
        print("error")
    }
    
    func onSuccess(_ jsonString: String) {
        print("success")
    
        
        do{
            let JSONData = try jsonString.data(using: .utf8)!

            let jsonResult = try! JSONSerialization.jsonObject(with: JSONData, options: .mutableLeaves)

            let jsonDict = jsonResult as? Dictionary<String, AnyObject>
            
            
            if(loadingLocations){
            
                let model = try JSONDecoder().decode(LocationsModel.self, from: JSONData)
                self.locationsModel = model
            }
            else{
                self.locationsModel = LocationsModel()
                self.locationsModel.items =  [Location?]()
                let model = try JSONDecoder().decode(LocationsByPostalCode.self, from: JSONData)
                for item in model.items!{
                    
                    if(item!.SETY_ID == 1 && item!.SETY_NAME == " Location"){
                        let location = Location()
                        location.name = item?.INST_NAME
                        location.id = item?.INST_ID
                        
                        self.locationsModel.items?.append(location)
                    }
                    
                    
                }
                dataLoaded = true
            }
        
            
            print(self.locationsModel)
            
            

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
    
    func getInstallationsByPostal(postalCode : String, distance : Int){
        
        let urlString =  BASE_URL + "/getInstallationContactsbyDistance/\(postalCode)/\(distance)"
        let webserviceConnector = WebServiceConnector(urlString: urlString, delegate: self)
        webserviceConnector.get()
        
        loadingLocations = false
        loadingLocationsByPostal = true
        
    }
    
    func getInstallations(){
        
        
        let urlString = BASE_URL + "/getInstallations/"
        let webserviceConnector = WebServiceConnector(urlString: urlString, delegate: self)
        webserviceConnector.get()
        dataLoaded = true
        
        loadingLocations = true
        loadingLocationsByPostal = false
    }
    
    func getBranches()->[String]{
        return BranchesModel().branches
    }
    
    
    func setBranch(branch : String){
        PreferencesUtil.shared.branch = branch
    }
    
    
    func setInstallation(installation : String){
        PreferencesUtil.shared.installation = installation
    }
    
    func setUserDescription(description : String){
        PreferencesUtil.shared.userDescription = description
    }
    
}

class UserSettingsViewModelObserver : NSObject{
    
    @objc var viewModel : UserSettingsViewModel
       var observation: NSKeyValueObservation?
    
    init(object: UserSettingsViewModel) {
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

