//
//  AppDelegate.swift
//  modes-mobile-ios
//
//  Created by yada on 8/13/20.
//

import UIKit
import Firebase


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //added to change System font to WorkSans
    override init() {
           super.init()
           UIFont.overrideInitialize()
    }

    var window: UIWindow?
    var navigationController: UINavigationController = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Thread.sleep(forTimeInterval: 1)
        // Override point for customization after application launch.
        
        // set the url base
        //BASE_URL = STAGING_BASE_URL
        BASE_URL = PROD_BASE_URL
        
        copyDbFromBundleIfNeeded()
        
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Base", bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "BaseViewController") as! BaseViewController
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        
        IQKeyboardManager.shared.enable = true
        
        FirebaseApp.configure()
        
        
        Analytics.setUserProperty("debug", forName: "buildType")
        
        return true
    }
    
    func copyDbFromBundleIfNeeded(){
        
        

        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let destURL = documentsURL!.appendingPathComponent("modes").appendingPathExtension("sqlite3")
        guard let sourceURL = Bundle.main.url(forResource: "modes", withExtension: "sqlite3")
            else {
                print("Source File not found.")
                return
        }
        
        let fileManager = FileManager.default
        do {
            if(!destURL.checkFileExist()){
                try fileManager.copyItem(at: sourceURL, to: destURL)
            }
        } catch {
            print("Unable to copy file")
        }
        
       
        
       
        
      
        
        
    }

    // MARK: UISceneSession Lifecycle

    /*
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    */


}

extension URL    {
    func checkFileExist() -> Bool {
        let path = self.path
        if (FileManager.default.fileExists(atPath: path))   {
            print("FILE AVAILABLE")
            return true
        }else        {
            print("FILE NOT AVAILABLE")
            return false;
        }
    }
}

