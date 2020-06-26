//
//  MapViewPolyline.swift
//  CSTC-iOS-Survey
//
//  Created by Charmaine Beluso on 6/24/20.
//  Copyright © 2020 MSU Carl Small Town Center. All rights reserved.
//

import SwiftUI
import Mapbox


// Represents & Displays an MGLMapView in SwiftUI
struct MapViewPolyline: UIViewRepresentable {

    // Property binding to add annotations
    @Binding var polylines: [MGLPolyline]
    
    // Creates a mapView with MGLMapView type
    private let mapView: MGLMapView = MGLMapView(frame: .zero, styleURL: MGLStyle.streetsStyleURL)

    // Needed function for UIViewRepresentable
    func makeUIView(context: UIViewRepresentableContext<MapViewPolyline>) -> MGLMapView {
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
    func updateUIView(_ uiView: MGLMapView, context: UIViewRepresentableContext<MapViewPolyline>) {
            updateAnnotations(uiView)
    }
    
    // Styles the map with a MapBox Studio URL
    func styleURL(_ styleURL: URL) -> MapViewPolyline {
            mapView.styleURL = styleURL
            return self
    }
        
    // Specifies where the map is centered
    func centerCoordinate(_ centerCoordinate: CLLocationCoordinate2D) -> MapViewPolyline {
            mapView.centerCoordinate = centerCoordinate
            return self
    }
    
    // Specifies the zoom level of the initial view
    func zoomLevel(_ zoomLevel: Double) -> MapViewPolyline {
            mapView.zoomLevel = zoomLevel
            return self
    }
    
    // Updates the annotations in the view
    private func updateAnnotations(_ uiView: MGLMapView) {
        //if let currentAnnotations = uiView.annotations {
            //uiView.removeAnnotations(currentAnnotations)
        //}
        uiView.addAnnotations(polylines)
    }
    
    // Makes the coordinater (coordinator class below)
    func makeCoordinator() -> MapViewPolyline.Coordinator {
        Coordinator(self, mapView)
    }
    
    // A coordinator used with a delegate to add the annotation view to the map
    // A coordinator class is declared to implement and view MGLMapViewDelegate in SwiftUI
    final class Coordinator: NSObject, MGLMapViewDelegate {
        var control: MapViewPolyline
        var mapView: MGLMapView!
        var coordinates = [CLLocationCoordinate2D]() // Create an array of coordinates for our polyline
        var pointAnnotations = [MGLPointAnnotation]()
        var polylineAnnotations = [MGLPolyline]()

        init(_ control: MapViewPolyline, _ mapView: MGLMapView) {
            self.control = control
            self.mapView = mapView
        }
        
        func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
            //self.mapView.removeAnnotation(annotation)

            return true
        }
        
        
        func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
            return nil
        }

        @objc func handleMapTap(sender: UITapGestureRecognizer) {
            // Convert tap location (CGPoint) to geographic coordinate (CLLocationCoordinate2D).
            let tapPoint: CGPoint = sender.location(in: mapView)
            let tapCoordinate: CLLocationCoordinate2D = mapView.convert(tapPoint, toCoordinateFrom: mapView)
            print("You tapped at: \(tapCoordinate.latitude), \(tapCoordinate.longitude)")
            
            coordinates.append(tapCoordinate)
            print("Coordinates list: \(coordinates)")

            //mapView.removeAnnotations(self.polylines)
            
            // Add a polyline with the coordinates
            //let polyline = MGLPolyline(coordinates: &coordinates, count: UInt(coordinates.count))
           // polylineAnnotations.append(polyline)
            //mapView.removeAnnotations(existingAnnotations)
            //coordinates.removeAll()
            //mapView.addAnnotations(polylineAnnotations)
            
            
            
            for coordinate in coordinates {
                // Add a polyline with the coordinates
                let polyline = MGLPolyline(coordinates: &coordinates, count: UInt(coordinates.count))
                polylineAnnotations.append(polyline)
                print("Annotations: \(polylineAnnotations)")
                //mapView.addAnnotation(polyline)
            }
            //coordinates.removeAll()
            mapView.addAnnotations(polylineAnnotations)
            //coordinates.removeAll()
            

             
            // Remove any existing polyline(s) from the map.
            //if mapView.annotations?.count != nil, let existingAnnotations = mapView.annotations {
                //mapView.removeAnnotations(existingAnnotations)
            //}
        }
    
    }
}

