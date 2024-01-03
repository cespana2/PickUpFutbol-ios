//
//  PFButton.swift
//  PickUpFutbol
//
//  Created by Carlos España Jr on 10/6/23.
//

import SwiftUI

struct PFButton: View {
    let title: String
    let color: Color
    let textColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            // Action
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color)
                Text(title)
                    .foregroundColor(textColor)
            }
        }
        .padding()
    }
}

struct PFButton_Previews: PreviewProvider {
    static var previews: some View {
        PFButton(title: "Create Account", color: Color(red: 185/255, green: 219/255, blue: 239/255),textColor: .black) {
            // Action
        }
    }
}
