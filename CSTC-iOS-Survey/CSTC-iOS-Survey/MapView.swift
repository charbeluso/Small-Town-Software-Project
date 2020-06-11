//
//  MapView.swift
//  CSTC-iOS-Survey
//
//  Created by Charmaine Beluso on 5/29/20.
//  Copyright © 2020 MSU Carl Small Town Center. All rights reserved.
//
// This file creates a map view from Mapbox SDK for iOS compatable with SwiftUI.


import SwiftUI
import Mapbox

// Creates an annotation using title & coordinate
extension MGLPointAnnotation {
    convenience init(title: String, coordinate: CLLocationCoordinate2D) {
        self.init()
        self.title = title
        self.coordinate = coordinate
    }
}


// Represents & Displays an MGLMapView in SwiftUI
struct MapView: UIViewRepresentable {

    // Property binding to add annotations
    @Binding var annotations: [MGLPointAnnotation]

    
    // Creates a mapView with MGLMapView type
    private let mapView: MGLMapView = MGLMapView(frame: .zero, styleURL: MGLStyle.streetsStyleURL)

    // Needed function for UIViewRepresentable
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MGLMapView {
        mapView.delegate = context.coordinator
        return mapView
    }
    
    // Needed function for UIViewRepresentable
    func updateUIView(_ uiView: MGLMapView, context: UIViewRepresentableContext<MapView>) {
            updateAnnotations()
    }
    
    // Styles the map with a MapBox Studio URL
    func styleURL(_ styleURL: URL) -> MapView {
            mapView.styleURL = styleURL
            return self
    }
        
    // Specifies where the map is centered
    func centerCoordinate(_ centerCoordinate: CLLocationCoordinate2D) -> MapView {
            mapView.centerCoordinate = centerCoordinate
            return self
    }
    
    // Specifies the zoom level of the initial view
    func zoomLevel(_ zoomLevel: Double) -> MapView {
            mapView.zoomLevel = zoomLevel
            return self
    }
    
    // Updates the annotations in the view
    private func updateAnnotations() {
        if let currentAnnotations = mapView.annotations {
            mapView.removeAnnotations(currentAnnotations)
        }
        mapView.addAnnotations(annotations)
    }
    
    // Makes the coordinater (coordinator class below)
    func makeCoordinator() -> MapView.Coordinator {
        Coordinator(self)
    }
    
    // A coordinator used with a delegate to add the annotation view to the map
    // A coordinator class is declared to implement and view MGLMapViewDelegate in SwiftUI
    final class Coordinator: NSObject, MGLMapViewDelegate {
        var control: MapView


        init(_ control: MapView) {
            self.control = control
        }
        
        
        func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
            return true
        }
        
        func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
            return nil
        }
    }
}
