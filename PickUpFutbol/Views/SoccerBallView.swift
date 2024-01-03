//
//  SoccerBallView.swift
//  PickUpFutbol
//
//  Created by Carlos España Jr on 10/5/23.
//

import SwiftUI

struct SoccerBallView: View {
    let circlePositionX: CGFloat
    let circlePositionY: CGFloat
    let ballPositionX: CGFloat
    let ballPositionY: CGFloat
    let ballWidth: CGFloat
    let ballHeight: CGFloat
    let color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .offset(x: circlePositionX, y: circlePositionY)
            
            Image("SoccerBall")
                .resizable()
                .clipShape(Circle())
                .frame(width: ballWidth, height: ballHeight)
                .offset(x: ballPositionX, y: ballPositionY)
        }
    }
}

struct SoccerBallView_Previews: PreviewProvider {
    static var previews: some View {
        SoccerBallView(circlePositionX: 200, circlePositionY: -450, ballPositionX: 200, ballPositionY: -450, ballWidth: 400, ballHeight: 400, color: .blue)
    }
}
