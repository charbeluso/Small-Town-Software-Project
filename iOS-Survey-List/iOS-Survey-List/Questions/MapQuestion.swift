//
//  MapQuestion.swift
//  iOS-Survey-List
//
//  Created by Charmaine Beluso on 5/18/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//
// This file creates a map type question using the data from the JSON file and gets the map from the MapView.swift file.


import SwiftUI
import Mapbox

// Structure for a map type question
struct MapQuestion: View {
    
    // Creates a variable with the type Question from Question.swift
    var adminQuestion: Question
    
    @State var annotations: [MGLPointAnnotation] = [
        MGLPointAnnotation(title: "Mapbox", coordinate: .init(latitude: 37.791434, longitude: -122.396267))
    ]

    // This starts our view of the full map question
    var body: some View {
        
        // Vertical stack with the question at the top followed by the map
        VStack(alignment: .center) {
            
            // Gets the question from the JSON file labeled "question" from sampleDatabase.json
            Text(adminQuestion.question)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 40.0)
            
            // Calls the MapView function that shows the map from MapView.swift
            // Starkville
            MapView(annotations: $annotations).centerCoordinate(.init(latitude: 33.45049, longitude: -88.81961)).styleURL(MGLStyle.outdoorsStyleURL).zoomLevel(14).frame(width: 600, height: 850) // formats the map to only show within this frame on the screen
            
            Spacer()
            
        }.padding()
    }
}

// Previews the checkbox question from the third element in sampleDatabase
struct MapQuestion_Previews: PreviewProvider {
    static var previews: some View {
        MapQuestion(adminQuestion: sampleDatabase[2])
    }
}
