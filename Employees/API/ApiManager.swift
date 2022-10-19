//
//  ApiManager.swift
//  Employees
//
//  Created by Sathya on 23/08/22.
//

import Alamofire
import Foundation


class ApiService
{
    let manager = Alamofire.Session.default
    init() {
        manager.session.configuration.timeoutIntervalForRequest = 300
    }
    
    func getApi() -> DataRequest {
        // Get base url and combine with end points
        let url = apiUrl + employee
        return request(
            at: url,
            method: .get,
            params: nil,
            encoding: URLEncoding.default)
    }
    
    func request(at url: String, method: HTTPMethod, params: Parameters?, encoding: ParameterEncoding) -> DataRequest {
        return manager.request(
            url,
            method: method,
            parameters: params,
            encoding: encoding)
        .validate()
    }
    
}
