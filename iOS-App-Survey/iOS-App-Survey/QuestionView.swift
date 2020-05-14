//
//  QuestionView.swift
//  Small Town Center Software
//
//  Created by Charmaine Beluso on 5/13/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        VStack {
            Text("Question 1")
            Text("What is your age?")
            List {
                Button(action: {
                    print("Button tapped!")
                }) {
                Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
