//
//  PreferencesUtil.swift
//  modes-mobile-ios
//
//  Created by yada on 8/20/20.
//

import Foundation

class PreferencesUtil{
    
    private let IS_FIRST_RUN_PREF = "is_first_run"
    
    
    // makes this a siglton
    static let shared = PreferencesUtil()
    private init(){}
    
    
    // has the app been run before
    var isFirstTimeLaunched : Bool{
        get{
            
            // get the value, if no value return value is false so we have to handle that case
            let run = UserDefaults.standard.bool(forKey: IS_FIRST_RUN_PREF)
            
            // since this is running set it to false
            UserDefaults.standard.set(true, forKey: IS_FIRST_RUN_PREF)
            return !run
        }
        
    }
    
    var userDescription : String{
        get{
            let userId = UserDefaults.standard.string(forKey: "userDescription")
            return userId ?? ""
        }
        set(val){
            UserDefaults.standard.set(val, forKey: "userDescription")
        }
    }
    var installation : String{
        get{
            let userId = UserDefaults.standard.string(forKey: "installation")
            return userId ?? ""
        }
        set(val){
            UserDefaults.standard.set(val, forKey: "installation")
        }
    }
    var branch : String{
        get{
            let userId = UserDefaults.standard.string(forKey: "branch")
            return userId ?? ""
        }
        set(val){
            UserDefaults.standard.set(val, forKey: "branch")
        }
    }
}
