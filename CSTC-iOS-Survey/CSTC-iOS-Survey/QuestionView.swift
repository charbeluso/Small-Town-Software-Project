//
//  QuestionView.swift
//  CSTC-iOS-Survey
//
//  Created by Charmaine Beluso on 5/19/20.
//  Copyright © 2020 MSU Carl Small Town Center. All rights reserved.
//
// This file shows all of the questions from the database.


import SwiftUI

// Structure that holds the list of questions for the survey
struct QuestionView: View {
    
    // Keeps track of page number
    @ObservedObject var viewRouter: ViewRouter

    // This starts our view of the questions
    var body: some View {
    
        
        VStack {
            
            // Horizontal stack shows the logo at the top left of the page with the submit button next to it on the right
            HStack {
                Image("smalltowncenterlogo")
                
                // Submit button. When clicked, it goes to the EndPage
                Button(action: {self.viewRouter.currentPage = 3}) {
                    Text("Save & Submit!")
                        .fontWeight(.semibold)
                        .font(.title)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                    }
            }
            // List out each array from the JSON file that holds the questions and its other properties
            List(sampleDatabase) { question in
                // Call the QuestionRow method that shows the properties for each question and pass in the properties for each question
                QuestionRow(viewRouter: ViewRouter(), adminQuestion: question)
            }
        }
    }
}


// Previews the list of questions
struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(viewRouter: ViewRouter())
    }
}
