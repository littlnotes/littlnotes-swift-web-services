//
//  File.swift
//  
//
//  Created by Michael Verges on 5/29/20.
//

import Foundation

typealias Body = [String: Any]

extension Body {
    init?(_ data: Data?) {
        guard let data = data else { return nil }
        if let json = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
            self = json
        } else {
            return nil
        }
    }
}
