//
//  Extensions.swift
//  PickUpFutbol
//
//  Created by Carlos España Jr on 10/10/23.
//

import Foundation

// Turn data into JSON Dictionary
extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
