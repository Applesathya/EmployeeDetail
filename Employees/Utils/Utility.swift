//
//  Utility.swift
//  Employees
//
//  Created by Sathya on 24/08/22.
//

import Foundation

class Utility {
    
    class func saveFlag (flag : Bool, forKey : String)
    {
        UserDefaults.standard.set(flag, forKey: forKey)
    }
    
    class func getFlag (forKey : String) -> Bool
    {
        if isKeyPresentInUserDefaults(key: forKey) {
            return UserDefaults.standard.bool(forKey: forKey)
        } else {
            return false
        }
    }
    class func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
}
