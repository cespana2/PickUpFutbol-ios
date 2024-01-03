//
//  HeaderView.swift
//  PickUpFutbol
//
//  Created by Carlos España Jr on 10/2/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let color: Color
    
    var body: some View {
            Color(red: 230/255, green: 242/255, blue: 249/255)
            .ignoresSafeArea()
                .overlay {
                    ZStack {
                        SoccerBallView(circlePositionX: 200, circlePositionY: -450, ballPositionX: 200, ballPositionY: -450, ballWidth: 400, ballHeight: 400, color: color)
                        
                        SoccerBallView(circlePositionX: -250, circlePositionY: -30, ballPositionX: -250, ballPositionY: -30, ballWidth: 400, ballHeight: 400, color: color)
                        
                        SoccerBallView(circlePositionX: 250, circlePositionY: 300, ballPositionX: 250, ballPositionY: 300, ballWidth: 400, ballHeight: 400, color: color)
                        
                        VStack {
                            Text(title)
                                .font(.largeTitle)
                                .bold()
                                .padding(.bottom, 5)
                            
                            Text(subtitle)
                                .font(.subheadline)
                        }
                        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
                        .offset(y: -250)
                    }
            }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Pickup Futbol", subtitle: "Create an Account", color: .blue)
    }
}
