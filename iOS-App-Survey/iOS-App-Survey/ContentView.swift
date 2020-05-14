//
//  ContentView.swift
//  iOS-App-Survey
//
//  Created by Charmaine Beluso on 5/14/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

struct ContentView: View {
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
                Spacer()
                    .padding(.bottom)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
