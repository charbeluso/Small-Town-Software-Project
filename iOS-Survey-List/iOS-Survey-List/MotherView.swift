//
//  MotherView.swift
//  iOS-Survey-List
//
//  Created by Charmaine Beluso on 5/19/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//
// This file creates the MotherView/Home page that assigns each page a number to be able to move between pages.


import SwiftUI

// The whole app is launched in the MotherView
struct MotherView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        
        // Vertical Stack that assigns each page/view with a number to keep track of
        VStack {
            if viewRouter.currentPage == 1 {
                StartPage(viewRouter: viewRouter)
            } else if viewRouter.currentPage == 2 {
                QuestionView(viewRouter: viewRouter)
            } else {
                EndPage()
            }
        }
    }
}

// Previews the app
struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}

