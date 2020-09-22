//
//  SettingsViewModel.swift
//  modes-mobile-ios
//
//  Created by yada on 9/5/20.
//

import Foundation

class SettingsViewModel: NSObject, WebServiceConnectorDelegate{
    
    @objc dynamic var dataLoaded = false
    @objc dynamic var hasDataError = false
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
    
    
    
    
    func onError(_ apiError: Error) {
        print("error ran in Settings Model")
        self.hasDataError = true
    }
    
    func onSuccess(_ jsonString: String) {
        print("success")
        
        do{
             let JSONData = try jsonString.data(using: .utf8)!
             let model = try JSONDecoder().decode(LocationsModel.self, from: JSONData)
             self.locationsModel = model
             //print(self.locationsModel)
            
            self.dataLoaded = true
            
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

class SettingsViewModelObserver : NSObject{
    
    @objc var viewModel : SettingsViewModel
       var observation: NSKeyValueObservation?
    
    init(object: SettingsViewModel) {
        viewModel = object
        super.init()
        
        observation = observe(
            \.viewModel.dataLoaded,
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
