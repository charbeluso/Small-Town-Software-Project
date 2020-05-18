//
//  MapQuestion.swift
//  iOS-App-Survey
//
//  Created by Charmaine Beluso on 5/14/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

struct MapQuestion: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            Text("Draw your current walking route: ")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 40.0)
            
            Text("Question: \((self.viewRouter.currentPage)-1) of \(viewRouter.totalPages)")
                .padding(.bottom, 40.0)
            
            MapView()
                .frame(width: 600, height: 850)
            
            Spacer()
            
            HStack {
                // Back Button
               Button(action: {self.viewRouter.currentPage = 3})
               {
                   Image(systemName: "arrow.left")
                       .font(.largeTitle)
                       .foregroundColor(.white)
                       .frame(width: 100.0, height: 50.0)
                       .background(Color.gray)
                       .cornerRadius(20.0)
               }.padding([.leading, .bottom], 40.0)
            
                Spacer()

                // Forward Button
                Button(action: {self.viewRouter.currentPage = 5})
                {
                    Image(systemName: "arrow.right")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 100.0, height: 50.0)
                        .background(Color.gray)
                        .cornerRadius(20.0)
                }.padding([.bottom, .trailing], 40.0)
            }
        }
    }
}

struct MapQuestion_Previews: PreviewProvider {
    static var previews: some View {
        MapQuestion(viewRouter: ViewRouter())
    }
}
