//
//  EventView.swift
//  PickUpFutbol
//
//  Created by Carlos España Jr on 12/2/23.
//

import SwiftUI

struct EventView: View {
    var body: some View {
        VStack {
            Text("Event Name")
                .font(.title)
                .padding(.top, 50)
                .padding(.bottom, 150)

            VStack(alignment: .leading) {
                HStack {
                    VStack {
                        Text("Address: ")
                            .padding()
                        Text("Address: ")
                            .padding()
                        Text("Address: ")
                            .padding()
                    }
                    .padding()
                    .bold()
                    VStack {
                        Text("Address")
                            .padding()
                        Text("Address")
                            .padding()
                        Text("Address")
                            .padding()
                    }
                    .padding()
                }
            }
            Spacer()
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
