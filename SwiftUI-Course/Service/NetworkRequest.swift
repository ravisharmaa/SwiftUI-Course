//
//  NetworkRequest.swift
//  SwiftUI-Course
//
//  Created by Ravi Bastola on 2/7/21.
//

import Foundation
import Combine


enum ApplicationError: Error {
    case invalidRequest (reason: Error)
    case invalidResponse
}

protocol NetworkRequest: AnyObject {
    
    var session: URLSession { get set }
    
    func load <Model: Codable> (for model: Model.Type, path: String, queryItems: [URLQueryItem]) -> AnyPublisher<Model, Error>
}

class Request: NetworkRequest {
    
    private var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.stackexchange.com"
        return components
    }
    
    var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func load <Model>(for model: Model.Type, path: String, queryItems: [URLQueryItem] = []) -> AnyPublisher<Model, Error> where Model : Decodable, Model : Encodable {
        
        var innerUrlComponents = urlComponents
        
        if !queryItems.isEmpty {
            innerUrlComponents.queryItems = queryItems
        }
        
        innerUrlComponents.path = innerUrlComponents.path + "/2.2" + path
        
        guard let url = innerUrlComponents.url else {
            return Empty<Model, Error>().eraseToAnyPublisher()
        }
        
        print(url)
        
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .receive(on: RunLoop.main)
            .tryMap { (element) -> Data in
                guard let response = element.response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    throw ApplicationError.invalidResponse
                }
                
                return element.data
            }
            .decode(type: Model.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}
