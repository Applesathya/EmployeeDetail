//
//  DatabaseController.swift
//  Employees
//
//  Created by Sathya on 23/08/22.
//

import Foundation
import RealmSwift

public protocol DatabaseController : NSObjectProtocol {
    
}

public class FlyDatabaseController : NSObject {
    
    
    private override init() {
        super.init()
    }
    
    public static let shared : FlyDatabaseController =  {
        return FlyDatabaseController()
    }()
    
}

func getRealmDB() -> Realm? {
    do {
        return try Realm()
    } catch {
        print("Unable to get Realm DB instance")
    }
    return nil
}

func writeData(realmDB: Realm , writeBlock : () -> Void) {
    
    do {
        try realmDB.write {
            writeBlock()
        }
    } catch  {
        print("Error writing to DB")
    }
}

func readWriteError() {
    print("Error read/write operation in Realm")
}

