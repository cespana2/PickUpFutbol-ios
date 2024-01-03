//
//  EventsViewViewModel.swift
//  PickUpFutbol
//
//  Created by Carlos España Jr on 10/10/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class EventsViewViewModel: ObservableObject {
    @Published var events = [Event]()

    init () {}
        
    func getEvents() {
        // Get reference to db
        let db = Firestore.firestore()
        
        // Read document at a specific path
        db.collection("events")
            .getDocuments { snapshot, error in
                // Check for Errors
                if error == nil {
                    // No errors
                    if let snapshot = snapshot {
                        
                        // Update the events property in the main thread
                        DispatchQueue.main.async {
                            // Get all documents and create Events
                            self.events = snapshot.documents.compactMap { document in
                                           
                                // Filter out past Events
                                if document["date"] as? TimeInterval ?? 00 < Date().timeIntervalSince1970 {
                                    return nil
                                } else {
                                    // Create and event item for each document returned
                                    return Event(id: document.documentID,
                                                  name: document["name"] as? String ?? "",
                                                  address: document["address"] as? String ?? "",
                                                  playerCount: document["playerCount"] as? Int ?? 0,
                                                  date: document["date"] as? TimeInterval ?? 00,
                                                  description: document["description"] as? String ?? "" )
                                }
                            }
                        }
                        
                    }
                } else {
                    // Handle Errors

                }
            }
    }
}
