//
//  EmployeeModel.swift
//  Employees
//
//  Created by Sathya on 23/08/22.
//


import Foundation

// MARK: - EmployeeElement
struct EmployeeElement: Codable {
    let id: Int
    let name, username, email: String
    let profileImage: String?
    let address: Address
    let phone, website: String?
    let company: Company?

    enum CodingKeys: String, CodingKey {
        case id, name, username, email
        case profileImage = "profile_image"
        case address, phone, website, company
    }
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

typealias Employee = [EmployeeElement]
