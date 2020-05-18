//
//  ForwardButton.swift
//  iOS-App-Survey
//
//  Created by Charmaine Beluso on 5/14/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

struct ForwardButton: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {self.viewRouter.currentPage = 3})
            {
                Image(systemName: "arrow.right")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .frame(width: 100.0, height: 50.0)
                    .background(Color.gray)
                    .cornerRadius(20.0)
            }
            .padding([.bottom, .trailing], 40.0)
            
        }
    }
}

struct ForwardButton_Previews: PreviewProvider {
    static var previews: some View {
        ForwardButton(viewRouter: ViewRouter())
    }
}
