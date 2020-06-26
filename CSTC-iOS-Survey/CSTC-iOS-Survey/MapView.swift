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
        
        // Add a single tap gesture recognizer. This gesture requires the built-in MGLMapView tap gestures (such as those for zoom and annotation selection) to fail.
        let singleTap = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleMapTap(sender:)))
        for recognizer in mapView.gestureRecognizers! where recognizer is UITapGestureRecognizer {
            singleTap.require(toFail: recognizer)
        }
        mapView.addGestureRecognizer(singleTap)
            
        // Convert `mapView.centerCoordinate` (CLLocationCoordinate2D) to screen location (CGPoint).
        let centerScreenPoint: CGPoint = mapView.convert(mapView.centerCoordinate, toPointTo: nil)
        print("Screen center: \(centerScreenPoint) = \(mapView.center)")
        
        return mapView
    }
    
    // Needed function for UIViewRepresentable
    func updateUIView(_ uiView: MGLMapView, context: UIViewRepresentableContext<MapView>) {
            updateAnnotations(uiView)
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
    private func updateAnnotations(_ uiView: MGLMapView) {
        //if let currentAnnotations = uiView.annotations {
            //uiView.removeAnnotations(currentAnnotations)
        //}
        uiView.addAnnotations(annotations)
    }
    
    // Makes the coordinater (coordinator class below)
    func makeCoordinator() -> MapView.Coordinator {
        Coordinator(self, mapView)
    }
    
    // A coordinator used with a delegate to add the annotation view to the map
    // A coordinator class is declared to implement and view MGLMapViewDelegate in SwiftUI
    final class Coordinator: NSObject, MGLMapViewDelegate {
        var control: MapView
        var mapView: MGLMapView!
        var coordinates = [CLLocationCoordinate2D]() // Create an array of coordinates for our polyline
        var pointAnnotations = [MGLPointAnnotation]()

        init(_ control: MapView, _ mapView: MGLMapView) {
            self.control = control
            self.mapView = mapView
        }
        
        func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
            self.mapView.removeAnnotation(annotation)

            return false
        }
        
        
        /*
        func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
            return nil
        }
         */
 
        
        // This delegate method is where you tell the map to load a view for a specific annotation. To load a static MGLAnnotationImage, you would use `-mapView:imageForAnnotation:`.
        func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
            // This example is only concerned with point annotations.
            guard annotation is MGLPointAnnotation else {
                return nil
            }
             
            // Use the point annotation’s longitude value (as a string) as the reuse identifier for its view.
            let reuseIdentifier = "\(annotation.coordinate.longitude)"
             
            // For better performance, always try to reuse existing annotations.
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
             
            return annotationView
        }
         
        

        @objc func handleMapTap(sender: UITapGestureRecognizer) {
            // Convert tap location (CGPoint) to geographic coordinate (CLLocationCoordinate2D).
            let tapPoint: CGPoint = sender.location(in: mapView)
            let tapCoordinate: CLLocationCoordinate2D = mapView.convert(tapPoint, toCoordinateFrom: mapView)
            print("You tapped at: \(tapCoordinate.latitude), \(tapCoordinate.longitude)")
            
            coordinates.append(tapCoordinate)
            print("Coordinates list: \(coordinates)")
            
            
            //var pointAnnotations = [MGLPointAnnotation]()
            for coordinate in coordinates {
                let point = MGLPointAnnotation()
                point.coordinate = coordinate
                point.title = "\(coordinate.latitude), \(coordinate.longitude)"
                pointAnnotations.append(point)
                //mapView.addAnnotations(pointAnnotations)
                //mapView.addAnnotation(point)
                print("Annotations: \(pointAnnotations)")
                
                // Add a polyline with the coordinates
                //let polyline = MGLPolyline(coordinates: &coordinates, count: UInt(coordinates.count))
                //mapView.addAnnotation(polyline)
            
            }
            coordinates.removeAll()
            mapView.addAnnotations(pointAnnotations) //comment this out to only show polylines
            pointAnnotations.removeAll()
        }
    
    }
}