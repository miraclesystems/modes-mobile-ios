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
    

    func getInstallations(){
        
        let urlString = "https://pre.militaryonesource.mil/omos/pre-production/getInstallations/"
        let webserviceConnector = WebServiceConnector(urlString: urlString, delegate: self)
        webserviceConnector.get()
        dataLoaded = true
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

