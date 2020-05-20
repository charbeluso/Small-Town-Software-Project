//
//  PickerQuestion.swift
//  iOS-Survey-List
//
//  Created by Charmaine Beluso on 5/18/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//
// This file creates a picker type question using the data from the JSON file. Picker questions are the same as radio button questions as they only capture one answer instead of a multiple choice option.


import SwiftUI

// Create the picker question
struct PickerQuestion: View {
    
    // Creates a variable with the type Question from Question.swift
    var adminQuestion: Question
    
    // Gives a number to the choice
    @State private var selectedChoice = 0
    
    // This starts our view of the full picker question
    var body: some View {

        // Create a picker form
        // Gets the question from the JSON file labeled "question" from sampleDatabase.json
        Picker(selection: $selectedChoice, label: Text(adminQuestion.question)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.leading, 30.0)) {
                    
            // Lists the answers using the "choices" array data from the JSON file
            ForEach(0 ..< adminQuestion.choices.count) {
                Text(self.adminQuestion.choices[$0]).font(.title).tag($0)
          }
        }
        .padding(.vertical, 50.0)
        //Text("You selected: \(adminQuestion.choices[selectedChoice])")
    }
}

// Previews the picker question from the second element in sampleDatabase
struct PickerQuestion_Previews: PreviewProvider {
    static var previews: some View {
        PickerQuestion(adminQuestion: sampleDatabase[1])
    }
}
