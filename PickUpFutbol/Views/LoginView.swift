//
//  LoginView.swift
//  PickUpFutbol
//
//  Created by Carlos España Jr on 10/5/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                HeaderView(title: "Pickup Futbol", subtitle: "Find a match today!", color: Color(red: 43/255, green: 131/255, blue: 182/255))
                VStack {
                    Form {
                        TextField("Email Address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle())
                            .textInputAutocapitalization(.never)
                        
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .textInputAutocapitalization(.never)
                        
                        PFButton(title: "Login", color: Color(red: 43/255, green: 131/255, blue: 182/255), textColor: .white, action: {
                            //Action
                            viewModel.login()
                        })
                    }
                    .frame(width: UIScreen.main.bounds.width,
                        height: 250)            .scrollContentBackground(.hidden)
                        .padding(.top, 100)
                    Text("New around here?")
                    Button {
                        // Action
                    } label: {
                        NavigationLink("Create an account", destination: RegisterView())
                    }
                    .foregroundColor(Color(red: 43/255, green: 131/255, blue: 182/255))

                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
