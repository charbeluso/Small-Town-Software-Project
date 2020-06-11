//
//  EndPage.swift
//  CSTC-iOS-Survey
//
//  Created by Charmaine Beluso on 5/19/20.
//  Copyright © 2020 MSU Carl Small Town Center. All rights reserved.
//
// The last page of the survey.


import SwiftUI

struct EndPage: View {

    var body: some View {
        
        // Shows the logo above the "thank you" text
        ZStack {
            Color(hex: 0x4F151F)
            .edgesIgnoringSafeArea(.all)
            VStack {
               
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
                        VStack {
                         Text("Thank you for completing the survey!")
                             .font(.largeTitle)
                             .fontWeight(.bold)
                             .padding()
                         Text("Return to the Carl Small Town Center website:")
                         Text("www.smalltowncenter.msstate.edu")
                        }
                     }.frame(width: 700.0, height: 150.0)
                      .padding(.vertical, 50.0)
                    
                }
            }
        }
    }
}

// Previews the end page
struct EndPage_Previews: PreviewProvider {
    static var previews: some View {
        EndPage()
    }
}
