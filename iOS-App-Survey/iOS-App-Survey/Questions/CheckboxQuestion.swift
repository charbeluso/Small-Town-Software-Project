//
//  CheckboxQuestion.swift
//  iOS-App-Survey
//
//  Created by Charmaine Beluso on 5/14/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

struct CheckboxField: View {
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
    
    @State var isMarked:Bool = false
    
    var body: some View {
        
        Button(action:{
            self.isMarked.toggle()
            self.callback(self.id, self.isMarked)
        })
        {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.isMarked ? "checkmark.square" : "square")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                Text(label)
                    .font(Font.system(size: size))
                Spacer()
            }.foregroundColor(self.color)
        }.foregroundColor(Color.white)
    }
}


struct CheckboxQuestion: View {
    
    @ObservedObject var viewRouter: ViewRouter

    var body: some View {
        VStack(alignment: .center) {
            
            Text("Sports")
                .font(.largeTitle)
                .font(Font.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 5.0)
            
            Text("Question: \((self.viewRouter.currentPage)-1) of \(viewRouter.totalPages)")

                CheckboxField(
                    id: Sports.Football.rawValue,
                    label: Sports.Football.rawValue,
                    size: 30,
                    textSize: 30,
                    callback: checkboxSelected
                )
                CheckboxField(
                    id: Sports.Baseball.rawValue,
                    label: Sports.Baseball.rawValue,
                    size: 30,
                    textSize: 30,
                    callback: checkboxSelected
                )
                CheckboxField(
                    id: Sports.Track_XC.rawValue,
                    label: "Track/XC",
                    size: 30,
                    textSize: 30,
                    callback: checkboxSelected
                )
                CheckboxField(
                    id: Sports.Bicycling.rawValue,
                    label: Sports.Bicycling.rawValue,
                    size: 30,
                    textSize: 30,
                    callback: checkboxSelected
                )
            
            Spacer()
            
            HStack {
                // Back Button
               Button(action: {self.viewRouter.currentPage = 1})
               {
                   Image(systemName: "arrow.left")
                       .font(.largeTitle)
                       .foregroundColor(.white)
                       .frame(width: 100.0, height: 50.0)
                       .background(Color.gray)
                       .cornerRadius(20.0)
               }.padding([.leading, .bottom], 40.0)
                
                Spacer()
                
                // Forward Button
                Button(action: {self.viewRouter.currentPage = 3})
                {
                    Image(systemName: "arrow.right")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 100.0, height: 50.0)
                        .background(Color.gray)
                        .cornerRadius(20.0)
                }
            }
        }.padding()
    }
    
    func checkboxSelected(id: String, isMarked: Bool) {
        print("\(id) is marked: \(isMarked)")
    }
}



struct CheckboxQuestion_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxQuestion(viewRouter: ViewRouter())
    }
}







/*
 import SwiftUI

 // Create the checkbox image
 struct CheckboxField: View {

     // Initialize values
     let id: String
     let label: String
     let size: CGFloat
     let color: Color
     let textSize: Int
     var answers = [String: String]()
     let callback: (String, Bool)->()
     
     init(
         id: String,
         label:String,
         size: CGFloat = 10,
         color: Color = Color.black,
         textSize: Int = 14,
         answers: [String:String] = [:],
         callback: @escaping (String, Bool)->()
         ) {
         self.id = id
         self.label = label
         self.size = size
         self.color = color
         self.textSize = textSize
         self.answers = answers
         self.callback = callback
     }

     // If the box is marked/selected, it is true. Otherwise, it is false.
     @State var isMarked:Bool = false
     
     @State var answerDict = [String:String]()

     // This starts our view of the checkbox
     var body: some View {
         
         // Create a button that toggles with a checkmark
         Button(action:{
             self.isMarked.toggle()
             self.callback(self.id, self.isMarked)
             print(self.answers)
             if self.isMarked == true {
                 self.answerDict.merge(self.answers){(current, _) in current}
             } else {
                 self.answerDict.removeValue(forKey: self.id)
             }
             print("\(self.answers) answers 2")
             print("\(self.answerDict) answerDict")
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
     
     @State var dictionaryList = [String:String]()
     
     //var answers = [String: String]()
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
                         answers: [self.adminQuestion.question: self.adminQuestion.choices[choice]],
                         callback: self.checkboxSelected
                     )
                     //var dict = [adminQuestion.question: id]
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
         if isMarked == true {
             dictionaryList[adminQuestion.question] = id
        } else {
             dictionaryList.removeValue(forKey: id)
        }
         //printArray(newDict: newDict)
     }
     
      func printArray(newDict: [String:String]) {
         //var newDict2 = [String:String]()
         print("\(dictionaryList) is marked")
         dictionaryList.merge(dictionaryList){(current, _) in current}
         print("\(dictionaryList) is marked 2")
         for (key, value) in dictionaryList {
             print("(\(key),\(value)) is marked 3")
         }
     }
 }

 // Previews the checkbox question from the first element in sampleDatabase
 struct CheckboxQuestion_Previews: PreviewProvider {
     static var previews: some View {
         CheckboxQuestion(adminQuestion: sampleDatabase[0])
     }
 }

 */




