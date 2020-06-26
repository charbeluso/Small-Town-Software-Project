//
//  MapPolylineQuestion.swift
//  CSTC-iOS-Survey
//
//  Created by Charmaine Beluso on 6/24/20.
//  Copyright © 2020 MSU Carl Small Town Center. All rights reserved.
//

import SwiftUI
import Mapbox

// Structure for a map type question
struct MapPolylineQuestion: View {
    
    // Creates a variable with the type Question from Question.swift
    var adminQuestion: Question
    
    /*
    @State var annotations: [MGLPointAnnotation] = [
        MGLPointAnnotation(title: "Mapbox", coordinate: .init(latitude: 37.791434, longitude: -122.396267))
    ]
 */
    
    @State var polylines: [MGLPolyline] = [MGLPolyline()]

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
            MapViewPolyline(polylines: $polylines).centerCoordinate(.init(latitude: 33.45049, longitude: -88.81961)).styleURL(MGLStyle.outdoorsStyleURL).zoomLevel(14).frame(width: 600, height: 850) // formats the map to only show within this frame on the screen
                Button(action: {
                    self.polylines.removeAll()
                }) {
                    Text("Remove annotation")
                }
            
            
            
            /*
            MapViewPolyline(polylines: $annotations).centerCoordinate(.init(latitude: 37.791293, longitude: -122.396324)).zoomLevel(16)
                Button(action: {
                    self.annotations.append( MGLPointAnnotation(title: "Mapbox 1", coordinate: .init(latitude: 37.791400, longitude: -122.396200)))
                }) {
                    Text("Add annotation")
                }
                Button(action: {
                    self.annotations.removeAll()
                }) {
                    Text("Remove annotation")
                }
            }.onAppear() {
                let delayInSeconds = 3.0
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
                   self.annotations =      [
                        MGLPointAnnotation(title: "Mapbox", coordinate: .init(latitude: 37.781434, longitude: -122.816267)),
                        MGLPointAnnotation(title: "Mapbox", coordinate: .init(latitude: 36.771434, longitude: -122.096267)),
                        MGLPointAnnotation(title: "Mapbox", coordinate: .init(latitude: 37.761434, longitude: -120.296267)),

                    ]
                }
 */
 
                

            Spacer()
            
        }.padding()
         
    }
}


// Previews the checkbox question from the third element in sampleDatabase
struct MapPolylineQuestion_Previews: PreviewProvider {
    static var previews: some View {
        //List {
            VStack(alignment: .center) {
                MapPolylineQuestion(adminQuestion: sampleDatabase[2])
            }
        //}
    }
}

