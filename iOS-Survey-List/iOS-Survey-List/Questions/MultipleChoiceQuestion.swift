//
//  MultipleChoiceQuestion.swift
//  iOS-Survey-List
//
//  Created by Charmaine Beluso on 5/21/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//
// This file creates a multiple choice (checkbox) type question using the data from the JSON file.


import SwiftUI

// Style checkbox button
struct MultipleSelectionRow: View {
    var title: String // Choice
    var isSelected: Bool // Checks to see if user selected the choice
    var action: () -> Void

    var body: some View {
        
        // Checkbox button
        Button(action: self.action) {
            
            // Puts box on the left side and the choice on the right side
            HStack {
                
                // If selected, show checkmark in the square. Else, just a empty square
                Image(systemName: self.isSelected ? "checkmark.square" : "square")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                
                // Choice
                Text(self.title)
                    .font(Font.system(size: 30))
            }
        }
    }
}

// Shows the question and choices from sampleDatabase
struct MultipleChoiceQuestion: View {

    // Array that holds the selected choices
    @State var selectionsArray: [String] = []
    
    // Dictionary with the question as the key & selectionsArray as the value. The value is an array to hold the multiple choices selected for one question
    @State var selectionsDictionary = [String:[String]]()
    
    // Creates a variable with the type Question from Question.swift
    var adminQuestion: Question

    var body: some View {
        
        // Vertical stack that holds questions and the list of choices
        VStack {
            // Gets the question from the JSON file labeled "question" from sampleDatabase.json
            Text(adminQuestion.question)
                .font(.largeTitle)
                .font(Font.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 5.0)
            
            // Presents the choices in a list view
            List {
                
                // Gets each choice from the sampleDatabase for that question
                ForEach(self.adminQuestion.choices, id: \.self) { item in        // item = choice
                    
                    // Calls the MultipleSelectionRow method to style the choice with a button
                    MultipleSelectionRow(title: item, isSelected: self.selectionsArray.contains(item)) {
                        
                        // If unselected, remove item from selectionsArray
                        if self.selectionsArray.contains(item) {
                            self.selectionsArray.removeAll(where: { $0 == item })
                                // print(self.selections)
                            
                            // Remove item from selectionsDictionary
                            self.selectionsDictionary = self.selectionsDictionary.mapValues{ $0.filter{ $0 != item } }
                            
                            // Show updated dictionary in debugger
                            print(self.selectionsDictionary)
                            
                        }
                        else {
                            // If selected, add item to selectionsArray
                            self.selectionsArray.append(item)
                                // print(self.selections)
                            
                            // Add item to selectionsDictionary
                            self.selectionsDictionary[self.adminQuestion.question] = self.selectionsArray
                            
                            // Show updated dictionary in debugger
                            print(self.selectionsDictionary)
                        }
                    }
                }
            }.frame(height: CGFloat(adminQuestion.choices.count * 50)) // Show all of the choices in the frame
            
            Spacer()
            
        }.padding()
    }
}

// Preview question
struct MultipleChoiceQuestion_Previews: PreviewProvider {
    static var previews: some View {
        MultipleChoiceQuestion(adminQuestion: sampleDatabase[19])
    }
}
