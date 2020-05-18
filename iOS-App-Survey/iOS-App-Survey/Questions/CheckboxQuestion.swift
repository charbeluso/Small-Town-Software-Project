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
