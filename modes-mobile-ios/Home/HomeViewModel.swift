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
