//
//  Employee.swift
//  Employees
//
//  Created by Sathya on 23/08/22.
//

import Foundation
import RealmSwift

class EmployeeData: Object {
    @objc  dynamic var id: Int = 0
    @objc dynamic var name = "", username = "", email = ""
    @objc dynamic var profileImage: String? = nil
    @objc dynamic var address: AddressObj? = nil
    @objc dynamic var company: CompanyObj? = nil
    @objc dynamic var phone = "", website = ""
    override class func primaryKey() -> String? {
        return "id"
    }
}
class AddressObj: Object {
    @objc dynamic var street = "", suite = "", city = "", zipcode: String = ""
    @objc dynamic var geo : GeoObj? = nil

}

class GeoObj: Object {
    @objc dynamic var lat = "", lng = ""
}

class CompanyObj: Object {
    @objc dynamic var name = "", catchPhrase = "", bs = ""
}
