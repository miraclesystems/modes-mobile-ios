//
//  ModesDb.swift
//  modes-mobile-ios
//
//  Created by yada on 8/31/20.
//

import Foundation

class ModesDb{
    
    
    // makes this a siglton
    static let shared = ModesDb()
    private init(){
        //openDb()
    }
    
    
  
    private var db : OpaquePointer?
    
    func showDbVersion(){
        print("db version = 1")
    }
    
    
    func getBenefitsByAudience(audience : String)->[[String:Any?]]{
        
        var list = [String]()
        // DB Testing for SQLlite
        let db = SQLiteDB.shared
        db.open()
        let data = db.query(sql:"SELECT * FROM benefits WHERE audience LIKE '%" + audience + "%'")
        //let row = data[0]
        //print(row)
        
        //for item in data{
            
        //    list.append(item["Benefit"] as! String)
        //}
        db.closeDB()
        return data
    }
    
    func getGuidesByAudience(audience : String)->[[String:Any?]]{
        
       
        // DB Testing for SQLlite
        let db = SQLiteDB.shared
        db.open()
        let data = db.query(sql:"SELECT * FROM GUIDES WHERE audience LIKE '%" + audience + "%'")
        //let row = data[0]
        //print(row)
        
        //for item in data{
            
        //    list.append(item["Benefit"] as! String)
        //}
        db.closeDB()
        
        return data
    }
    
    
    
    
    
    func  getBenefitsByKeyWordSearch(searchTerm : String)->[[String:Any?]]{

        let db = SQLiteDB.shared
        db.open()
       
        let data =  db.query(sql:"SELECT * FROM benefits WHERE keywords LIKE '%" + searchTerm + "%'")
        db.closeDB()
        return data
    }
    
    func  getGuidesByKeyWordSearch(searchTerm : String)->[[String:Any?]]{

        let db = SQLiteDB.shared
        db.open()
       
        let data =  db.query(sql:"SELECT * FROM guides WHERE [MilLife Guide Topic Keywords] LIKE '%" + searchTerm + "%'")
        db.closeDB()
        return data
    }
    
    
    
    
    private func openDb(){
        
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let dbUrl = documentsURL!.appendingPathComponent("modes").appendingPathExtension("db")
        
        if sqlite3_open(dbUrl.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        else{
            print("db opened")
        }
    }
    
}
