//
//  MotherView.swift
//  iOS-Survey-List
//
//  Created by Charmaine Beluso on 5/19/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == 1 {
                ContentView(viewRouter: viewRouter)
            } else if viewRouter.currentPage == 2 {
                QuestionView(viewRouter: viewRouter)
            } else {
                EndPage()
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}

