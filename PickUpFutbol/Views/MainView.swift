//
//  ContentView.swift
//  PickUpFutbol
//
//  Created by Carlos España Jr on 10/2/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        
        // Logic if signed in show MyEvents, Events, Chat, Profile Views
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            TabView {
                MyEventsView()
                    .tabItem {
                        Label("My Events", systemImage: "calendar")
                        }
                EventsView()
                    .tabItem {
                        Label("Events", systemImage: "calendar.badge.plus")
                    }
            }
            .toolbarBackground(Color.black, for: .tabBar)
        } else {
            // If not signed in show LoginView
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
