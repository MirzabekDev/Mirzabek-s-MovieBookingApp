//
//  TicketView.swift
//  MovieBookingApp
//
//  Created by Mirzabek on 02/03/23.
//

import SwiftUI

struct TicketView: View {
    
    // Connections
    @State var animate = false
    
    var body: some View {
        // Main Zstack
        ZStack{
            // Circle background
            CircleBackground(color: Color("greenCircle"))
                .blur(radius: animate ? 30 : 100)
                .offset(x: animate ? -50 : -130, y: animate ? -30 : -100)
                .task {
                    withAnimation(.easeOut(duration: 7).repeatForever()){
                        animate.toggle()
                    }
                }
            
            CircleBackground(color: Color("pinkCircle"))
                .blur(radius: 100)
                .offset(x: animate ? 100 : 130, y: animate ? 150 : 100)
            
            // texts Vstack
            VStack(spacing: 30){
                Text("Mobile Tickets")
                    .font(.title3)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Text("While you are buying a movie ticket scan the barcode acces to your moview")
                    .frame(maxWidth: 248)
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
            }
            .padding(.horizontal,20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            Tickets()
                .padding(.top,30)
        }
        // Background of Ui
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("backgroundColor"), Color("backgroundColor2")]), startPoint: .top, endPoint: .bottom)
            
        )
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
