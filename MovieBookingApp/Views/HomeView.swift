//
//  HomeView.swift
//  MovieBookingApp
//
//  Created by Mirzabek on 04/03/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var animate = false
    
    @State var posters1: [String] = ["poster1", "poster2", "poster3", "poster4", "poster5", "poster6"]
    @State var posters2: [String] = ["poster7", "poster8", "poster9", "poster10", "poster11", "poster12"]
    @State var posters3: [String] = ["poster13", "poster14", "poster15", "poster16", "poster17", "poster18"]

    var body: some View {
        // Main Zstack
        ZStack{
            // animation backgroundUi
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
            
            VStack(spacing: 0.0){
                
                Text("Choose Movie")
                    .fontWeight(.bold)
                    .font(.title3)
                    .foregroundColor(.white)
                
                CustomSearchBar()
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 20))
                
                ScrollView(.vertical, showsIndicators: false){
                    
                    // vertical posters scroll
                    VStack(spacing: 20.0){
                        ScrollSection(posters: posters1, title: "Now Playing")
                        
                        ScrollSection(posters: posters2, title: "Coming Soon")
                        
                        ScrollSection(posters: posters3, title: "Famous")
                        
                        ScrollSection(posters: posters1, title: "Favorite")
                    }
                    .padding(.bottom,90)
                    
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .background(
            LinearGradient(colors: [Color("backgroundColor"), Color("backgroundColor2")], startPoint: .top, endPoint: .bottom)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
