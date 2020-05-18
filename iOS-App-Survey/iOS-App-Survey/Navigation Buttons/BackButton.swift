//
//  BackButton.swift
//  iOS-App-Survey
//
//  Created by Charmaine Beluso on 5/14/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

struct BackButton: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        HStack {
            Button(action: {self.viewRouter.currentPage = 1}) {
                Image(systemName: "arrow.left")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(width: 100.0, height: 50.0)
                    .background(Color.gray)
                    .cornerRadius(20.0)
            }
            .padding([.leading, .bottom], 40.0)
            Spacer()
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(viewRouter: ViewRouter())
    }
}
