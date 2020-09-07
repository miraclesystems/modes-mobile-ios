//
//  WebServiceConnector.swift
//  modes-mobile-ios
//
//  Created by yada on 8/13/20.
//

import Foundation
import Foundation

protocol WebServiceConnectorDelegate {
    func onError(_ apiError: Error)
    func onSuccess(_ jsonString: String)
}


class WebServiceConnector   {
    
    var serverUrl:URL?
    var postData:String?
    var authToken: String?
  
    
    
    var delegate:WebServiceConnectorDelegate?
    
    init(urlString:String, delegate:WebServiceConnectorDelegate) {
        self.serverUrl = URL(string: urlString)
        self.delegate = delegate
        self.postData = nil
    }
    
    func post(jsonString json :String, authToken :String){
        
        print("URL", serverUrl?.absoluteString, separator: "=", terminator: "\r\n")
        
        guard let requestUrl = serverUrl else{fatalError()}
        
        // prepare the url request
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // set the http body
        request.httpBody = json.data(using: String.Encoding.utf8)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if(!authToken.isEmpty){
            // set the header
            request.addValue("Bearer " + authToken, forHTTPHeaderField: "authorization")
            
        }
        //request.addValue(String(json.count), forHTTPHeaderField: "Content-Length")
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
            
                // Check for Error
                if let error = error {
                    
                    // call delegate error
                    print("Error took place")
                    self.delegate?.onError(error)
                    return
                }
            
                
                if let httpResponse = response as? HTTPURLResponse{
                    if httpResponse.statusCode !=  200{
                        
                        print("error \(httpResponse.statusCode)")
                        var error = NSError(domain:"", code:httpResponse.statusCode, userInfo:nil)

                        self.delegate?.onError(error)
                        return
                    }
                    else{
                        // Convert HTTP Response Data to a String
                        if let data = data, var dataString = String(data: data, encoding: .utf8) {
                            // delegate response
                            print("Response received")
                            self.delegate?.onSuccess(dataString)
                        }
                    }
                }
        }
        task.resume()
        
    }
    
    
    func get(){
        
        print("URL", serverUrl?.absoluteString, separator: "=", terminator: "\r\n")
        
        guard let requestUrl = serverUrl else{fatalError()}
        
        // prepare the url request
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        
        if let token = self.authToken{
            // set the header
            request.addValue("Bearer " + token, forHTTPHeaderField: "authorization")
            
        }
        
        
       
        
        let userName = API_USER //Need to be replaced with correct value
        let password = API_PASSWORD //Need to be replaced with correct value
        let toEncode = "\(userName):\(password)" //Form the String to be encoded
        let encoded = toEncode.data(using: .utf8)?.base64EncodedString()

        //Add the header value
        request.addValue("Basic bWNmcFJFU1Q6IzByYWNsZVIzU1RBUCFzIw==", forHTTPHeaderField: "Authorization")
        
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
            
                // Check for Error
                if let error = error {
                    
                    // call delegate error
                    print("Error took place")
                    self.delegate?.onError(error)
                    return
                }
            
                
                if let httpResponse = response as? HTTPURLResponse{
                    if httpResponse.statusCode !=  200{
                        
                        print("error \(httpResponse.statusCode)")
                        let error = NSError(domain:"", code:httpResponse.statusCode, userInfo:nil)

                        self.delegate?.onError(error)
                        return
                    }
                    else{
                        // Convert HTTP Response Data to a String
                        if let data = data, let dataString = String(data: data, encoding: .utf8) {
                            // delegate response
                            print("Response received")
                            self.delegate?.onSuccess(dataString)
                        }
                    }
                }
        }
        task.resume()
        
    }
    
    
    func put(jsonString json :String){
        
        print("URL", serverUrl?.absoluteString, separator: "=", terminator: "\r\n")
        
        guard let requestUrl = serverUrl else{fatalError()}
        
        // prepare the url request
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "PUT"
        // set the http body
        request.httpBody = json.data(using: String.Encoding.utf8)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let token = self.authToken{
            // set the header
            request.addValue("Bearer " + token, forHTTPHeaderField: "authorization")
            
        }
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
            
                // Check for Error
                if let error = error {
                    
                    // call delegate error
                    print("Error took place")
                    self.delegate?.onError(error)
                    return
                }
            
                
                if let httpResponse = response as? HTTPURLResponse{
                    if httpResponse.statusCode !=  200{
                        
                        print("error \(httpResponse.statusCode)")
                        let error = NSError(domain:"", code:httpResponse.statusCode, userInfo:nil)

                        self.delegate?.onError(error)
                        return
                    }
                    else{
                        // Convert HTTP Response Data to a String
                        if let data = data, let dataString = String(data: data, encoding: .utf8) {
                            // delegate response
                            print("Response received")
                            self.delegate?.onSuccess(dataString)
                        }
                    }
                }
        }
        task.resume()
        
    }
}
