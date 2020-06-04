//
//  Route.swift
//
//
//  Created by Michael Verges on 5/29/20.
//

import Foundation

public struct Route {
    
    public var url: URL
    public var token: Token?
    
    public static let timeout: TimeInterval = 10000
    
    func get(timeout: TimeInterval = timeout, completion: ((Data?) -> ())? = nil) {
        
        var request = URLRequest(
            url: url,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: timeout
        )
        
        request.httpMethod = "GET"
        if let token = token {
            request.addValue("Bearer \(token.key)", forHTTPHeaderField: "Authorization")
        }
        send(request: request, completion: completion)
    }
    
    func post(timeout: TimeInterval = timeout, body: [String: Any] = [:], completion: ((Data?) -> ())? = nil) {
        
        var request = URLRequest(
            url: url,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: timeout
        )
        
        request.httpMethod = "POST"
        request.httpBody = try! JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        if let token = token {
            request.addValue("Bearer \(token.key)", forHTTPHeaderField: "Authorization")
        }
        send(request: request, completion: completion)
    }
    
    func send(request: URLRequest, completion: ((Data?) -> ())? = nil) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            } else if let _ = response as? HTTPURLResponse {
                print("dispatching")
                DispatchQueue.main.async { completion?(data) }
            }
        }.resume()
    }
}
