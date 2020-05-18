//
//  MotherView.swift
//  iOS-App-Survey
//
//  Created by Charmaine Beluso on 5/15/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    // Add array of views/new questions
    // index + 1 = current page
    // for each question, add a view
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == 1 {
                ContentView(viewRouter: viewRouter)
            } else if viewRouter.currentPage == 2 {
                CheckboxQuestion(viewRouter: viewRouter)
            } else if viewRouter.currentPage == 3 {
                RadioButtonQuestion(viewRouter: viewRouter)
            } else if viewRouter.currentPage == 4 {
                MapQuestion(viewRouter: viewRouter)
            } else if viewRouter.currentPage == viewRouter.totalPages {
                ExtraCommentsQuestion(viewRouter: viewRouter)
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}
