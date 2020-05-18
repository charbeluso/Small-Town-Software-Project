//
//  ContentView.swift
//  iOS-App-Survey
//
//  Created by Charmaine Beluso on 5/14/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

enum Gender: String {
    case Male
    case Female
    case Other
    case Skip
}

enum Age: String {
    case less_than_20
    case less_than_30
    case less_than_40
    case less_than_50
    case less_than_60
    case less_than_70
    case less_than_80
    case less_than_90
    case less_than_100
}

enum Sports: String, CaseIterable {
    case Baseball
    case Basketball
    case Tennis
    case Swimming
    case Track_XC
    case Dance
    case Softball
    case Golf
    case Bowling
    case Bicycling
    case Football
}


struct ContentView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            LogoHeader()
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
