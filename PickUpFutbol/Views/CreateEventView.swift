//
//  CreateEventView.swift
//  PickUpFutbol
//
//  Created by Carlos España Jr on 10/29/23.
//

import SwiftUI

struct CreateEventView: View {
    @StateObject var viewModel = CreateEventViewViewModel()
    
    var body: some View {
        ZStack {
            Color(red: 230/255, green: 242/255, blue: 249/255)
                .ignoresSafeArea()
            VStack {
                Text("Create New Event")
                    .padding()
                    .font(.largeTitle)
                Form {
                    TextField("Event Name", text: $viewModel.name)
                    DatePicker("Date", selection: $viewModel.date)
                        .datePickerStyle(.graphical)
                    TextField("Address", text: $viewModel.address)
                    TextField("Description", text: $viewModel.description)
                    PFButton(title: "Create Event", color: .blue, textColor: .white, action: {
                        //Action
                        if viewModel.validate() {
                            viewModel.createEvent()
                            viewModel.name = ""
                            viewModel.date = Date()
                            viewModel.address = ""
                            viewModel.description = ""
                            viewModel.showSuccess = true
                        } else {
                            viewModel.showAlert = true
                        }
                    })
                    .alert(isPresented: $viewModel.showAlert) {
                        Alert(title: Text("Error"),
                        message: Text("Please fill in all fields and select a valid date that is today or newer."))
                    }
                    .alert(isPresented: $viewModel.showSuccess) {
                        Alert(title: Text("Awesome!"), message: Text("Event has been created!"))
                    }
                }
                .padding(.top, -20)
                .scrollContentBackground(.hidden)
            }
        }
        
    }
}

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView()
    }
}
