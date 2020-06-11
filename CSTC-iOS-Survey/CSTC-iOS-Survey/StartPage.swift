//
//  StartPage.swift
//  CSTC-iOS-Survey
//
//  Created by Charmaine Beluso on 5/18/20.
//  Copyright © 2020 MSU Carl Small Town Center. All rights reserved.
//
// This file creates the start page for the survey.
// Previously called "ContentView.swift"


import SwiftUI

extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}

struct StartPage: View {
    
    // Keeps track of page number
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        
        // Vertical Stack that holds all of the text in the start page
        ZStack {
            Color(hex: 0x4F151F)
            .edgesIgnoringSafeArea(.all)
            VStack {
                
                //Spacer()
                //.padding(.vertical, 100.0)
            
                // CSTC Logo
                Image("startpagelogo")
                    .resizable()
                    .frame(width: 500.0, height: 300.0)
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 10)
                    .padding(.top, 100.0)
               
                
                // Welcomes the user to the survey (could include extra info here e.g. instructions)
                VStack {
                    
                    ZStack {
                        Color(hex: 0xF8F8F8)
                        .shadow(radius: 10)
                        Text("Welcome to the survey!")
                            .kerning(1)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            //.frame(width: 550.0, height: 150.0).padding()
                            //.font(.custom("Avenir", size: 40))
                    }.frame(width: 700.0, height: 150.0)
                     .padding(.vertical, 50.0)
                    
                    //Spacer()
                    //.padding(.vertical)
                    
                    ZStack {
                        Color(hex: 0xF8F8F8)
                        .shadow(radius: 10)
                        VStack {
                            Text("What is this survey about?")
                                .underline()
                                .kerning(0.5)
                                .font(.largeTitle)
                                //.font(.system(size: 12, weight: .light, design: .serif))
                                .fontWeight(.bold)
                                .frame(width: 625.0, height: 50.0, alignment: .leading).padding()
                           
                                
                            Text("This is a survey-based software application that collects data from the general community during town hall meetings. The survey asks questions that inquire about the demographic of a town and their concerns about walking sidewalks and bike routes. This tool is being developed for the Carl Small Town Center at Mississippi State University's Architecture Department.")
                                .frame(width: 650.0, height: 150.0, alignment: .leading)
                        }.padding()
                    }.frame(width: 700.0, height: 150.0)
                    .padding(.vertical, 50.0)
                    
                    //Spacer()
                    //.padding(.vertical)
                    
                    ZStack {
                       Color(hex: 0xF8F8F8)
                       .shadow(radius: 10)
                       VStack {
                           Text("Disclaimer:")
                               .underline()
                               .kerning(0.5)
                               .font(.largeTitle)
                               //.font(.system(size: 12, weight: .light, design: .serif))
                               .fontWeight(.bold)
                               .frame(width: 625.0, height: 50.0, alignment: .leading).padding()
                          
                               
                           Text("The information that you wish to provide and submit will not be used for personal purposes.")
                               .frame(width: 650.0, height: 50.0, alignment: .leading)
                       }.padding()
                   }.frame(width: 700.0, height: 150.0)
                   .padding(.vertical, 50.0)
                   
                   //Spacer()
                   //.padding(.vertical)

     
                    // Start Button
                    Button(action: {self.viewRouter.currentPage = 2}) {
                       Text("START")
                           .fontWeight(.semibold)
                           .font(.title)
                           .frame(minWidth: 0, maxWidth: 700)
                           .padding()
                           .foregroundColor(.white)
                           .background(Color.green)
                           .cornerRadius(40)
                   }
                    Spacer()
                    .padding(.vertical, 50.0)
                }
            }
        }
    }
}

// Previews the start page
struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage(viewRouter: ViewRouter())
    }
}
