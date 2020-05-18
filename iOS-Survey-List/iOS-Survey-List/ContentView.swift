//
//  ContentView.swift
//  iOS-Survey-List
//
//  Created by Charmaine Beluso on 5/18/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

// Structure that holds the list of questions for the survey
struct ContentView: View {

    // This starts our view of the questions
    var body: some View {
        
        // Vertical stack that lists the questions
        VStack(alignment: .center) {
            
            // List out each array from the JSON file that holds the questions and its other properties
            List(sampleDatabase) { question in
                
                // Call the QuestionRow method that shows the properties for each question and pass in the properties for each question
                QuestionRow(adminQuestion: question)
            }
            .padding()
        }
    }
}

// Previews the list of questions
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
