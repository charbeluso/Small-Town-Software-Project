//
//  ExtraCommentsQuestion.swift
//  iOS-App-Survey
//
//  Created by Charmaine Beluso on 5/14/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

struct ExtraCommentsQuestion: View {
    
    @ObservedObject var viewRouter: ViewRouter
    @State var comment: String = ""
    
    var body: some View {
        VStack() {
            Text("Any extra comments?")
                .font(.largeTitle)
                .font(Font.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 50.0)
            
            Text("Question: \((self.viewRouter.currentPage)-1) of \(viewRouter.totalPages)")
                .padding(.bottom, 50.0)

            TextField("Enter comment...", text: $comment, onEditingChanged: { (changed) in
                print("Comment onEditingChanged - \(changed)")
            }) {
                print("Comment onCommit")
            }
            .frame(width: 700.0)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            //Text("Your comment: \(comment)")
            Spacer()
            
            HStack {
                // Back Button
               Button(action: {self.viewRouter.currentPage = 4})
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
                Button(action: {self.viewRouter.currentPage = 1})
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

struct ExtraCommentsQuestion_Previews: PreviewProvider {
    static var previews: some View {
        ExtraCommentsQuestion(viewRouter: ViewRouter())
    }
}
