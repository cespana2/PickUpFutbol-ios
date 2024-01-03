//
//  PickUpFutbolApp.swift
//  PickUpFutbol
//
//  Created by Carlos España Jr on 10/9/23.
//

import FirebaseCore
import SwiftUI

@main
struct PickUpFutbolApp: App {
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
