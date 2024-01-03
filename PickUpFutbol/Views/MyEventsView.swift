//
//  MyEventsView.swift
//  PickUpFutbol
//
//  Created by Carlos España Jr on 10/6/23.
//

import SwiftUI

struct MyEventsView: View {
    @ObservedObject var viewModel = MyEventsViewViewModel()
    var body: some View {
        NavigationView {
            Color(red: 230/255, green: 242/255, blue: 249/255)
                .ignoresSafeArea()
                .overlay {
                    VStack {
                        // If no events are found
                        if viewModel.events.isEmpty {
                            Text("You have no events scheduled")
                            Button {
                                //Action
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color.blue)
                                    NavigationLink("Create Event", destination: CreateEventView())
                                        .foregroundColor(Color.white)
                                }
                            }
                            .frame(width: 170, height: 50)
                            
                            PFButton(title: "Sign Out", color: .red, textColor: .white) {
                                // Action
                                viewModel.signOut()
                            }
                            .frame(width: 200, height: 80)
                            
                        // If Events are found
                        } else {
                            Text("My Upcoming Events")
                                .padding(.top, 50)
                                .font(.title)
                            // List of upcoming events
                            List (viewModel.events) { event in
                                // TODO: Create a navigation link and show event details as well as buttons to register for the event
                                HStack {
                                    Text(event.name)
                                    Spacer()
                                    Image(systemName: "arrow.right")
                                }
                            }
                            .scrollContentBackground(.hidden)
                            Spacer()
                            HStack {
                                Spacer()
                                // Create new event button
                                Button {
                                    //Action
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(Color.blue)
                                        NavigationLink("Create Event", destination: CreateEventView())
                                            .foregroundColor(Color.white)
                                    }
                                }
                                .frame(width: 120, height: 30)
                                .padding(.top, 100)
                                .padding([.trailing, .bottom], 20)
                            }
                        
                        }
                        
                    }
                    .onAppear {
                        viewModel.getEvents()
                    }
                }
        }
    }
    
    init () {
        viewModel.getEvents()
    }
}

struct MyEventsView_Previews: PreviewProvider {
    static var previews: some View {
        MyEventsView()
    }
}
