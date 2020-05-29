//
//  ExtraCommentQuestion.swift
//  iOS-Survey-List
//
//  Created by Charmaine Beluso on 5/18/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//
// This file creates a extra commment type question using the data from the JSON file.


import SwiftUI

// Structure for the entire comment question
struct ExtraCommentQuestion: View {
    
    // Creates a variable with the type Question from Question.swift
    var adminQuestion: Question
    
    // Creates a comment variable with an empty string
    @State var comment: String = ""
    
    // Dictionary with the question as the key & comment as the value
    @State var selectionsDictionary = [String:String]()
    
    // This starts our view of the full extra comment question
    var body: some View {
        
        // Vertical stack with the question at the top followed by the comment box
        VStack() {
            
            // Gets the question from the JSON file labeled "question" from sampleDatabase.json
            Text(adminQuestion.question)
                .font(.largeTitle)
                .font(Font.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 50.0)

            // Creates empty comment box for the user to type in and saves the user's comment in the the variable \(comment)"
            TextField("Enter comment...", text: $comment, onEditingChanged: { (changed) in
                print("Comment onEditingChanged - \(changed)")
            }) {
                print("Comment onCommit")
                
                // Once the user clicks "return" on the keypad, their comment stays in the box & adds the comment to selectionsDictionary
                self.selectionsDictionary[self.adminQuestion.question] = self.comment
                
                // Shows the dictionary in the debugger
                print(self.selectionsDictionary)
            }.padding(.bottom, 50.0)
             .frame(width: 700.0)
             .textFieldStyle(RoundedBorderTextFieldStyle())
            
            //Text("Your comment: \(comment)")
            Spacer()
            
        }
    }
}

// Previews the extra comment question from the fourth element in sampleDatabase
struct ExtraCommentQuestion_Previews: PreviewProvider {
    static var previews: some View {
        ExtraCommentQuestion(adminQuestion: sampleDatabase[18])
    }
}
