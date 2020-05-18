//
//  CheckboxQuestion.swift
//  iOS-Survey-List
//
//  Created by Charmaine Beluso on 5/18/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//
// This file creates a checkbox type question using the data from the JSON file.


import SwiftUI

// Create the checkbox image
struct CheckboxField: View {

    // Initialize values
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: Int
    let callback: (String, Bool)->()
    
    init(
        id: String,
        label:String,
        size: CGFloat = 10,
        color: Color = Color.black,
        textSize: Int = 14,
        callback: @escaping (String, Bool)->()
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.callback = callback

    }

    // If the box is marked/selected, it is true. Otherwise, it is false.
    @State var isMarked:Bool = false
    
    // This starts our view of the checkbox
    var body: some View {
        
        // Create a button that toggles with a checkmark
        Button(action:{
            self.isMarked.toggle()
            self.callback(self.id, self.isMarked)
        })
        {
            // Horizontal stack with the checkbox on the left and the answer choice on the right
            HStack(alignment: .center, spacing: 10) {
                
                // Image of checkbox and checkmark. If marked, put a checkmark in the box. Else, it is an empty square.
                Image(systemName: self.isMarked ? "checkmark.square" : "square")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                
                // Answer choice
                Text(label)
                    .font(Font.system(size: size))
                
                Spacer()
            }.foregroundColor(self.color) // black
        }.foregroundColor(Color.white)
    }
}

// Structure for the entire checkbox question
struct CheckboxQuestion: View {
    
    // Creates a variable with the type Question from Question.swift
    var adminQuestion: Question

    // This starts our view of the full checkbox question
    var body: some View {
        
        // Vertical stack with the question at the top followed by the checkbox answer choices
        VStack(alignment: .center) {
            
            // Gets the question from the JSON file labeled "question" from sampleDatabase.json
            Text(adminQuestion.question)
                .font(.largeTitle)
                .font(Font.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 5.0)
                
            // Presents the answer choices in a list format
            List {
                
                // For each answer choice, create a checkbox
                ForEach(0..<adminQuestion.choices.count) { choice in
                    
                    // Creates the checkbox using the "choices" array data from the JSON file
                    CheckboxField(
                        id: self.adminQuestion.choices[choice],
                        label: self.adminQuestion.choices[choice],
                        size: 30,
                        textSize: 30,
                        callback: self.checkboxSelected
                    )
                }
            }
                
            // Shows the entire list
            .frame(height: CGFloat(adminQuestion.choices.count * 50))
            
            Spacer()

        } .padding()
    }
    
    // States which checkbox is selected
    func checkboxSelected(id: String, isMarked: Bool) {
        print("\(id) is marked: \(isMarked)")
    }
}

// Previews the checkbox question from the first element in sampleDatabase
struct CheckboxQuestion_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxQuestion(adminQuestion: sampleDatabase[0])
    }
}
