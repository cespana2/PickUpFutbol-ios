//
//  CreateEventViewViewModel.swift
//  PickUpFutbol
//
//  Created by Carlos España Jr on 10/29/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class CreateEventViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var address = ""
    @Published var date = Date()
    @Published var description = ""
    @Published var showAlert = false
    @Published var showSuccess = false
    
    init () {
        
    }
    
    func createEvent() {
        guard validate() else {
            return
        }
        
        // Get Current User ID
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create Model
        let newId = UUID().uuidString
        let newEvent = Event(id: newId, name: name, address: address, playerCount: 1, date: date.timeIntervalSince1970, description: description)
        
        
        // Save Model as an event the creator is attending
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("events")
            .document(newId)
            .setData(newEvent.asDictionary())
        
        // Save Model as an event in general
        db.collection("events")
            .document(newId)
            .setData(newEvent.asDictionary())
        
    }
    
    func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !address.trimmingCharacters(in: .whitespaces).isEmpty,
              !description.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard date >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
