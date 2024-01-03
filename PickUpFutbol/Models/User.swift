//
//  User.swift
//  PickUpFutbol
//
//  Created by Carlos España Jr on 10/9/23.
//

import Foundation

struct User: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let joined: TimeInterval
}
