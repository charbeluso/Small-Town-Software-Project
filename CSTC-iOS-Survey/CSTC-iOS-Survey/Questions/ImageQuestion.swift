//
//  ImageQuestion.swift
//  CSTC-iOS-Survey
//
//  Created by Charmaine Beluso on 5/18/20.
//  Copyright © 2020 MSU Carl Small Town Center. All rights reserved.
//
// This file creates a image type question using the data from the JSON file. This type of question shows an image and asks the user about the image.


import SwiftUI

struct ImageQuestion: View {
    // Creates a variable with the type Question from Question.swift
    var adminQuestion: Question
    
    // Creates a comment variable with an empty string
    @State var comment: String = ""
    
    // Dictionary with the question as the key & comment as the value
    @State var selectionsDictionary = [String:String]()
    
    // This starts our view of the full image question
    var body: some View {
        
        // Vertical stack with the question at the top followed by the image & comment box
        VStack(alignment: .center) {
            
            // Gets the question from the JSON file labeled "question" from sampleDatabase.json
            Text(adminQuestion.question)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 40.0)
            
            // Gets the image from the JSON file labeled "image" from sampleDatabase.json
            adminQuestion.image
                .frame(width: 500, height: 500)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
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

        }.padding()
    }
    
}

// Previews the extra comment question from the fourth element in the database
struct ImageQuestion_Previews: PreviewProvider {
    static var previews: some View {
        ImageQuestion(adminQuestion: sampleDatabase[25])
    }
}

