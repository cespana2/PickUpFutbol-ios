//
//  EventsView.swift
//  PickUpFutbol
//
//  Created by Carlos España Jr on 10/10/23.
//

import SwiftUI

struct EventsView: View {
    @ObservedObject var viewModel = EventsViewViewModel()
    var body: some View {
        Color(red: 230/255, green: 242/255, blue: 249/255)
            .ignoresSafeArea()
            .overlay {
                VStack {
                    Text("Upcoming Events")
                        .font(.title)
                        .padding(.top, 50)
                    List (viewModel.events) { event in
                        Text(event.name)
                    }
                    .scrollContentBackground(.hidden)
                }
                .onAppear {
                    viewModel.getEvents()
                }
            }
    }
    
    init () {
        viewModel.getEvents()
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}
