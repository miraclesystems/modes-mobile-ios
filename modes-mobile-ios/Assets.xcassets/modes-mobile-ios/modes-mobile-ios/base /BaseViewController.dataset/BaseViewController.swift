//
//  BaseViewViewController.swift
//  modes-mobile-ios
//
//  Created by yada on 8/13/20.
//

import UIKit

class BaseViewController: UIViewController {
    
    var viewModel : BaseViewModel?
    
    
    @IBOutlet weak var label1: UILabel!
    

    override func viewDidAppear(_ animated: Bool) {
        // get some data
        viewModel?.getValue()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // instantiate the view model
        viewModel = BaseViewModel()
        
        // observe the view model
        viewModel?.addObserver(self, forKeyPath: "dataLoaded", options: [.new,.old], context: nil)
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
           
        // the view model chaged
        if keyPath == "dataLoaded" {
               DispatchQueue.main.async {
                
                    // do some some stuff on the UI
                    self.label1.text = self.viewModel?.model.value
                    
                }
        }
    }

}
