//
//  Endpoint.swift
//  SwiftGenericNetworkLayer
//
//  Created by Necati Alperen IŞIK on 10.11.2023.
//

import Foundation

//https://jsonplaceholder.typicode.com


protocol EndpointProtocol {
    var baseURL:String {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var header:[String:String]? {get}
    
    
    func request() -> URLRequest
}




enum Endpoint {
    case getUsers
    
}



extension Endpoint: EndpointProtocol {
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com"
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "/users"
        }
    }
    
    var method: HTTPMethod {
        switch self{
        case .getUsers: return .get
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    func request() -> URLRequest {
        guard var components = URLComponents(string: baseURL) else {
            fatalError("URL ERROR")
        }
        components.path = path
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        
        if let header = header {
            for(key,value) in header {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
    
    
}
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    
}
