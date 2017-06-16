//
//  UserService.swift
//  chat
//
//  Created by Виктор Новиков on 10.06.17.
//  Copyright © 2017 Виктор Новиков. All rights reserved.
//

import Foundation
import SQLite
import Alamofire

class UserService {
    
    var db: Connection!
    
    let user = Table("user")
    
    let id = Expression<Int64>("id")
    let login = Expression<String>("login")
    
    init(_ db: Connection) {
        self.db = db
    }
    
    func createTable() {
        do {
            try db.run(user.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(login)
            })
        } catch {
            print("User table didn't created!")
        }
    }
    
    func addUserDB(id: Int64, login: String) {
        do {
            let insert = user.insert(self.id <- id, self.login <- login)
            let _ = try db.run(insert)
        } catch {
            print("User didn't added to table.")
        }
    }
    
    func deleteAllDB(){
        do {
            try db.run(user.delete())
        } catch  {
            print("User table didn't droped")
        }
    }
    
    //В таблице всегда храниться только один пользоватьель (главный)
    //Если юзер получает при входе rootUserId отличный от того, который в базе, то мы удаляем из нее все записи
    func needToDeleteAllDB() -> Bool {
        var result: Bool = false
        do {
            for user in try db.prepare(self.user) {
                if DBManager.rootUserId == user[self.id] {
                    result = true
                }
            }
        } catch {
            print("Can't get users from DB")
        }
        return result
    }
    
    func getUserIdInternet(login: String, password: String, clouser: @escaping (Int64)->()) {
        
        var result: Int64 = -1
        
        let parameters : Parameters = [ "login": login, "password": password]
        
        Alamofire.request(DBManager.url + "user", parameters: parameters).responseString { response in
            switch response.result {
            case .success:
                if (response.result.value != "") {
                    result = Int64(response.result.value!)!
                    clouser(result)
                } else {
                    clouser(-1)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    
}






























