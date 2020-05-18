//
//  RadioButtonQuestion.swift
//  iOS-App-Survey
//
//  Created by Charmaine Beluso on 5/14/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

struct RadioButtonField: View {
   let id: String
   let label: String
   let size: CGFloat
   let color: Color
   let textSize: CGFloat
   let isMarked:Bool
   let callback: (String)->()
   
   init(
       id: String,
       label:String,
       size: CGFloat = 20,
       color: Color = Color.black,
       textSize: CGFloat = 14,
       isMarked: Bool = false,
       callback: @escaping (String)->()
       ) {
       self.id = id
       self.label = label
       self.size = size
       self.color = color
       self.textSize = textSize
       self.isMarked = isMarked
       self.callback = callback
   }
   
   var body: some View {
       Button(action:{
           self.callback(self.id)
       }) {
           HStack(alignment: .center, spacing: 10) {
               Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                   .renderingMode(.original)
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width: self.size, height: self.size)
            
            Text(label)
                   .font(Font.system(size: textSize))
            
               Spacer()
           }.foregroundColor(self.color)
       }.foregroundColor(Color.white)
   }
}

struct RadioButtonGroups: View {
    let callback: (String) -> ()
    
    @State var selectedId: String = ""
    
    var body: some View {
        VStack {
            radioMaleMajority
            radioFemaleMajority
            radioOtherMajority
            radioSkipMajority
        }
    }

    var radioMaleMajority: some View {
        RadioButtonField(
            id: Gender.Male.rawValue,
            label: Gender.Male.rawValue,
            size: 30,
            textSize: 30,
            isMarked: selectedId == Gender.Male.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radioFemaleMajority: some View {
        RadioButtonField(
            id: Gender.Female.rawValue,
            label: Gender.Female.rawValue,
            size: 30,
            textSize: 30,
            isMarked: selectedId == Gender.Female.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radioOtherMajority: some View {
        RadioButtonField(
            id: Gender.Other.rawValue,
            label: Gender.Other.rawValue,
            size: 30,
            textSize: 30,
            isMarked: selectedId == Gender.Other.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radioSkipMajority: some View {
        RadioButtonField(
            id: Gender.Skip.rawValue,
            label: Gender.Skip.rawValue,
            size: 30,
            textSize: 30,
            isMarked: selectedId == Gender.Skip.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}

struct RadioButtonQuestion: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack(alignment: .center) {
            
            Text("Gender")
                .font(.largeTitle)
                .font(Font.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 5.0)
            
            Text("Question: \((self.viewRouter.currentPage)-1) of \(viewRouter.totalPages)")

            RadioButtonGroups { selected in
                print("Selected Gender is: \(selected)")
            }
            
            Spacer()
            
            HStack {
                //Back Button
               Button(action: {self.viewRouter.currentPage = 2})
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
                Button(action: {self.viewRouter.currentPage = 4})
                {
                    Image(systemName: "arrow.right")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 100.0, height: 50.0)
                        .background(Color.gray)
                        .cornerRadius(20.0)
                }.padding([.bottom, .trailing], 40.0)
            }
        }.padding()
    }
}


struct RadioButtonQuestion_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonQuestion(viewRouter: ViewRouter())
    }
}
