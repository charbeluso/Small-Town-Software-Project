//
//  StartButton.swift
//  iOS-App-Survey
//
//  Created by Charmaine Beluso on 5/14/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

struct StartButton: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
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
    }
}

struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButton(viewRouter: ViewRouter())
    }
}
