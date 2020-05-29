//
//  SingleChoiceQuestion.swift
//  CSTC-iOS-Survey
//
//  Created by Charmaine Beluso on 5/18/20.
//  Copyright © 2020 MSU Carl Small Town Center. All rights reserved.
//
// This file creates a picker type question using the data from the JSON file. Picker questions are the same as radio button questions as they only capture one answer instead of a multiple choice option.


import SwiftUI

// Create the picker question
struct PickerQuestion: View {
    
    // Creates a variable with the type Question from Question.swift
    var adminQuestion: Question
    
    // Gives a number to the choice
    @State private var selectedChoice = 0
    
    // Dictionary with the question as the key & the selected choice as the value
    @State var selectionsDictionary = [String:String]()
    
    // This starts our view of the full picker question
    var body: some View {

        // Create a picker form
        // Gets the question from the JSON file labeled "question" from sampleDatabase.json
        return VStack {
            
            // Question as the title
            Text(adminQuestion.question)
                .font(.largeTitle)
                .font(Font.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 50.0)
           
            // Uses the picker form to present the choices and makes the user pick only 1 choice (similar to radio button)
            Picker(selection: $selectedChoice, label: Text(adminQuestion.question)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .fixedSize()
                .padding(.leading, 20.0)) {
        
                    // Lists the answers using the "choices" array data from the JSON file
                    ForEach(0 ..< adminQuestion.choices.count, id: \.self) {
                        Text(self.adminQuestion.choices[$0]).font(.title).tag($0)
                    }
            }.pickerStyle(SegmentedPickerStyle()) // Style of picker
             .padding(.vertical, 30.0)
            
            // Shows the user what they picked
            Text("You selected: \(adminQuestion.choices[selectedChoice])")
                .padding(.bottom, 20.0)
                //self.selectionsDictionary[self.adminQuestion.question] = self.adminQuestion.choices[selectedChoice]
                //print(self.selectionsDictionary)
        }
    }
}

// Previews the picker question from the second element in sampleDatabase
struct PickerQuestion_Previews: PreviewProvider {
    static var previews: some View {
        PickerQuestion(adminQuestion: sampleDatabase[10])
    }
}
