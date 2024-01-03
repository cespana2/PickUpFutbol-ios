//
//  MainViewViewModel.swift
//  PickUpFutbol
//
//  Created by Carlos España Jr on 10/9/23.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init () {
        self.handler = Auth.auth().addStateDidChangeListener{[weak self] _, user in DispatchQueue.main.async {
            self?.currentUserId = user?.uid ?? ""
        }}
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
