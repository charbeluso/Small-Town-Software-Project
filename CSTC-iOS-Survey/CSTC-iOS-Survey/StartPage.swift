//
//  StartPage.swift
//  CSTC-iOS-Survey
//
//  Created by Charmaine Beluso on 5/29/20.
//  Copyright © 2020 MSU Carl Small Town Center. All rights reserved.
//
// This file creates the start page for the survey.
// Previously called "ContentView.swift"


import SwiftUI

struct StartPage: View {
    
    // Keeps track of page number
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        
        // Vertical Stack that holds all of the text in the start page
        VStack {
            
            // CSTC Logo
            Image("smalltowncenterlogo")
                //.resizable()
                //.frame(width: 850.0, height: 200.0)
                
           
            
            // Welcomes the user to the survey (could include extra info here e.g. instructions)
            VStack {
                Spacer()
                    .padding(.top)
                Text("Welcome to the Starkville Survey!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    //.font(.custom("Avenir", size: 40))
                Spacer()
                    .padding(.vertical)
                    .frame(width: 0.0, height: 100.0)
 
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
                .padding(.bottom)
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
