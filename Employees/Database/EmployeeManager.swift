//
//  EmployeeManager.swift
//  Employees
//
//  Created by Sathya on 23/08/22.
//

import Foundation
import RealmSwift

public class EmployeeManager : NSObject{
    
    func saveEmployees(emps : [EmployeeElement]) {
        guard let realm = getRealmDB() else {
            readWriteError()
            return
        }
        for emp in emps {
            let employeeData = EmployeeData()
            let addressObj = AddressObj()
            let geoObj = GeoObj()
            let companyObj = CompanyObj()
            geoObj.lat  = emp.address.geo.lat
            geoObj.lng  = emp.address.geo.lng
            addressObj.street = emp.address.street
            addressObj.suite = emp.address.suite
            addressObj.city = emp.address.city
            addressObj.zipcode = emp.address.zipcode
            addressObj.street = emp.address.street
            addressObj.geo = geoObj
            companyObj.name = emp.company?.name ?? ""
            companyObj.catchPhrase = emp.company?.catchPhrase ?? ""
            companyObj.bs = emp.company?.bs ?? ""
            
            employeeData.id = emp.id
            employeeData.name = emp.name
            employeeData.username = emp.username
            employeeData.email = emp.email
            employeeData.profileImage = emp.profileImage
            employeeData.address = addressObj
            employeeData.company = companyObj
            employeeData.phone = emp.phone ?? ""
            employeeData.website = emp.website ?? ""
            print("Write to Realm")
            try! realm.write {
                realm.add(employeeData, update: .all)
            }
        }
    }
    
    func getAllEmployees () -> [EmployeeData]{
        var employeeData : [EmployeeData] = []
        guard let realm = getRealmDB() else {
            readWriteError()
            return employeeData
        }
        employeeData = Array(realm.objects(EmployeeData.self))
        return employeeData
    }
}
