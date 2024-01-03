//
//  Events.swift
//  PickUpFutbol
//
//  Created by Carlos España Jr on 10/10/23.
//

import Foundation

struct Event: Codable, Identifiable {
    let id: String
    let name: String
    let address: String
    var playerCount: Int
    let date: TimeInterval
    let description: String
    
    mutating func addPlayers() {
        playerCount +=  1
    }
}
