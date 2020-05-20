//
//  ContentView.swift
//  iOS-Survey-List
//
//  Created by Charmaine Beluso on 5/18/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            Image("smalltowncenterlogo")
            VStack {
                Spacer()
                    .padding(.top)
                Text("Welcome to the Starkville Survey!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("We will be asking you a few questions regarding Starkville.")
                    .font(.title)
                    .padding(.top)
                Spacer()
                    .padding(.vertical)
                    .frame(width: 0.0, height: 200.0)
                Text("Let's get started!")
                    .font(.title)
                    .padding(.bottom, 200.0)
                
                // Start Button
                Button(action: {self.viewRouter.currentPage = 2}) {
                   Text("Start here!")
                       .fontWeight(.semibold)
                       .font(.title)
                       .frame(minWidth: 0, maxWidth: .infinity)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
