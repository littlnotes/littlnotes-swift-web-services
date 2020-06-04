//
//  UserRouter.swift
//  
//
//  Created by Michael Verges on 5/29/20.
//

import Foundation

public struct UserRouter {
    
    private static var baseURL = URL(string: "https://littlnotes-rest.onrender.com/users")!
    
    public static func createAccount(name: String, email: String, password: String, completion: (() -> ())?) {
        let route = Route(url: baseURL)
        route.post(body: [
            "name": name, "email": email, "password": password
        ]) { data in
            if let body = Body(data), let token = body["token"] as? String {
                Token.current = Token(key: token)
                completion?()
            }
        }
    }
    
    public static func login(email: String, password: String, completion: (() -> ())?) {
        let route = Route(url: baseURL.appendingPathComponent("login", isDirectory: false))
        route.post(body: [
            "email": email, "password": password
        ]) { data in
            if let body = Body(data), let token = body["token"] as? String {
                Token.current = Token(key: token)
                completion?()
            }
        }
    }
    
    public static func logout( completion: (() -> ())?) {
        var route = Route(url: baseURL.appendingPathComponent("me/logout", isDirectory: false))
        route.token = Token.current
        route.post() { data in
            Token.current = nil
            completion?()
        }
    }
    
    public static func logoutAllDevices(completion: (() -> ())?) {
        var route = Route(url: baseURL.appendingPathComponent("me/logoutall", isDirectory: false))
        route.token = Token.current
        route.post() { data in
            Token.current = nil
            completion?()
        }
    }
}
