//
//  RegisterView.swift
//  PickUpFutbol
//
//  Created by Carlos España Jr on 10/5/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        ZStack {
            HeaderView(title: "Create Account", subtitle: "Join the fun!", color: Color(red: 185/255, green: 219/255, blue: 239/255))
            VStack {
                Form {
                    TextField("First Name", text: $viewModel.firstName)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TextField("Last Name", text: $viewModel.lastName)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    
                    PFButton(title: "Create Account", color: Color(red: 185/255, green: 219/255, blue: 239/255), textColor: .black, action: {
                        //Action
                        viewModel.register()
                    })
                }
                .frame(width: UIScreen.main.bounds.width,
                    height: 300)            .scrollContentBackground(.hidden)
            }        
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
