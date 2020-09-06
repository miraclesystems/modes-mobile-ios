//
//  baseViewModel.swift
//  modes-mobile-ios
//
//  Created by yada on 8/13/20.
//

import Foundation
class BaseViewModel : NSObject, WebServiceConnectorDelegate{
    
    @objc dynamic var dataLoaded = false
    var hasDataError = false
    var dataError : String = ""
    
    
    let model = BaseModel()
    
    func onError(_ apiError: Error) {
        print("error")
    }
    
    func onSuccess(_ jsonString: String) {
        print("success")
        
       
    }
    

    func getValue(){
        dataLoaded = true
    }
    
    
}

class BaseViewModelObserver : NSObject{
    
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
