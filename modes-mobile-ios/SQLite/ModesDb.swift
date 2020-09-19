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
        //let data = db.query(sql:"SELECT * FROM benefits WHERE audience LIKE '%" + audience + "%'")
        let data = db.query(sql:"SELECT * FROM benefits WHERE audience LIKE '%" + audience + "%' ORDER BY RANDOM() LIMIT 4")
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
        //let data = db.query(sql:"SELECT * FROM GUIDES WHERE audience LIKE '%" + audience + "%'")
        let data = db.query(sql:"SELECT * FROM GUIDES WHERE audience LIKE '%" + audience + "%' ORDER BY RANDOM() LIMIT 4")
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
       
        let data =  db.query(sql:"SELECT * FROM benefits WHERE keywords LIKE '%" + searchTerm + "%' COLLATE NOCASE")
        db.closeDB()
        return data
    }
    
    func  getGuidesByKeyWordSearch(searchTerm : String)->[[String:Any?]]{

        let db = SQLiteDB.shared
        db.open()
        let data =  db.query(sql:"SELECT * FROM guides WHERE [MilLife Guide Topic Keywords] LIKE '%" + searchTerm + "%' COLLATE NOCASE")
    
        db.closeDB()
        return data
    }
    
    
    func getAllGuiides()->[[String:Any?]]{

        let db = SQLiteDB.shared
         db.open()
        let data = db.query(sql: "SELECT * FROM guides")
        return data
    }

    func getGuidesByCategory(category : String)->[[String:Any?]]{

        let db = SQLiteDB.shared
        db.open()
        let data = db.query(sql: "SELECT * FROM guides WHERE category LIKE '%" + category + "%'")
        return data
    }



    func getGuideByName(guide : String)->[[String:Any?]]{

        let db = SQLiteDB.shared
        db.open()
        let data = db.query(sql: "SELECT * FROM guides WHERE guide LIKE '%" + guide + "%'")
        return data
    }
    
    func getBenefitById(id : String)->[[String:Any?]]{
        
        let db = SQLiteDB.shared
        db.open()
        let data =  db.query(sql: "SELECT * FROM benefits where ID=" + id)
        return data
    }
    
    
    func getGuidesFavorites()->[[String:Any?]]{
        
        let db = SQLiteDB.shared
        db.open()
        let data =  db.query(sql: "SELECT * FROM guides where favorite = 1")
        return data
    }
    
    func getBenefitsFavorites()->[[String:Any?]]{
        
        let db = SQLiteDB.shared
        db.open()
        let data =  db.query(sql: "SELECT * FROM benefits where favorite = 1")
        return data
    }
    
    
    
    func setGuideFavorite(favorite : Bool, name: String){

            var value = ""
            if(favorite){
              value = "1"
            }
            else{
              value = "0"
            }

            let db = SQLiteDB.shared
            db.open()
        db.execute(sql: "UPDATE guides set favorite = " + value + " where guide = '" + name  + "'")
      }
    func setBenefitavorite(favorite : Bool, name: String){

        var value = ""
        if(favorite){
        value = "1"
        }
        else{
        value = "0"
        }

        let db = SQLiteDB.shared
        db.open()
        db.execute(sql: "UPDATE benefits set favorite = " + value + " where benefit = '" + name  + "'")
    }

      

    func setBenefitsFavorite(favorite : Bool, id: Int){

        var value = ""
        if(favorite){
          value = "1"
        }
        else{
          value = "0"
        }
        let db = SQLiteDB.shared
        db.open()
        db.execute(sql: "UPDATE benefits set favorite = " + value + " where id = " + String(id) )
    }
    
    func setGuidesFavorite(favorite : Bool, id: Int){

        var value = ""
        if(favorite){
          value = "1"
        }
        else{
          value = "0"
        }
        let db = SQLiteDB.shared
        db.open()
        db.execute(sql: "UPDATE guides set favorite = " + value + " where id = " + String(id) )
    }

      

    func getBenefitCategories()->[[String:Any?]]{
        let db = SQLiteDB.shared
        db.open()
        let data = db.query(sql: "SELECT DISTINCT category from benefits order by category ASC")
        return data
    }
    
    func getGuideCategories()->[[String:Any?]]{
           let db = SQLiteDB.shared
           db.open()
           let data = db.query(sql: "SELECT DISTINCT category from guides order by category ASC")
           return data
       }

    func getBenefitByCategory(category : String)->[[String:Any?]]{

        let db = SQLiteDB.shared
        db.open()
        let data = db.query(sql: "SELECT * from benefits WHERE category LIKE '%" + category + "%'")
        return data
    }

    func getBenefitByName(name : String)->[[String:Any?]]{

        let db = SQLiteDB.shared
        db.open()
        let data = db.query(sql: "SELECT * from benefits WHERE benefit LIKE '%" + name + "%'")
        return data
    }
    
    func getAllBenefits()->[[String:Any?]]{

        let db = SQLiteDB.shared
        db.open()
        let data = db.query(sql: "SELECT * FROM benefits")
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
