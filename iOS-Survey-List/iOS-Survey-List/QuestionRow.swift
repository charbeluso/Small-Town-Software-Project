//
//  QuestionRow.swift
//  iOS-Survey-List
//
//  Created by Charmaine Beluso on 5/18/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

// Structure that creates a question by determining its question type from sampleDatabase.json & Question.swift
struct QuestionRow: View {
    
    // Keeps track of page number
    @ObservedObject var viewRouter: ViewRouter
    
    // Creates a variable with the type Question from Question.swift
    var adminQuestion: Question
    
    // This starts our view of our rows of questions
    var body: some View {
        // Vertical stack just groups each type of question
        VStack(alignment: .center) {

            // Checks the type of question according to their category given from the JSON file and passes the data to that type of question file
            if adminQuestion.category ==  "checkbox" {
                CheckboxQuestion(adminQuestion: adminQuestion)
            }
            else if adminQuestion.category ==  "radio" {
                PickerQuestion(adminQuestion: adminQuestion)
            }
            else if adminQuestion.category ==  "map" {
                MapQuestion(adminQuestion: adminQuestion)
            }
            //else if adminQuestion.category == "image" {
                //ImageQuestion(adminQuestion: adminQuestion)
            //}
            else {
                ExtraCommentQuestion(adminQuestion: adminQuestion)
            }
        }
    }
}

// Previews the question rows from the first two elements in sampleDatabase
struct QuestionRow_Previews: PreviewProvider {
    static var previews: some View {
            Group {
                QuestionRow(viewRouter: ViewRouter(), adminQuestion: sampleDatabase[0])
                QuestionRow(viewRouter: ViewRouter(), adminQuestion: sampleDatabase[1])
                }
                .previewLayout(.fixed(width: 900, height: 70))
            }
    }
