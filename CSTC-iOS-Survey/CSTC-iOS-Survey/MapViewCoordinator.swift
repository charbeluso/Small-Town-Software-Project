//
//  MapViewCoordinator.swift
//  CSTC-iOS-Survey
//
//  Created by Charmaine Beluso on 6/20/20.
//  Copyright © 2020 MSU Carl Small Town Center. All rights reserved.
//

import Foundation
import UIKit
import Mapbox
 
class MapViewCoordinator: UIViewController, MGLMapViewDelegate {
    
    var mapView: MGLMapView!
    var coordinates = [CLLocationCoordinate2D]()
    
    var mapViewController: MapView
      
    init(_ control: MapView) {
        self.mapViewController = control
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
         
        mapView = MGLMapView(frame: view.bounds)
        mapView.styleURL = MGLStyle.streetsStyleURL
        mapView.setCenter(CLLocationCoordinate2D(latitude: 33.45049, longitude: -88.81961), zoomLevel: 14, animated: false)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(mapView)
         
        // Add a single tap gesture recognizer. This gesture requires the built-in MGLMapView tap gestures (such as those for zoom and annotation selection) to fail.
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(handleMapTap(sender:)))
        for recognizer in mapView.gestureRecognizers! where recognizer is UITapGestureRecognizer {
            singleTap.require(toFail: recognizer)
        }
        mapView.addGestureRecognizer(singleTap)
         
        // Convert `mapView.centerCoordinate` (CLLocationCoordinate2D) to screen location (CGPoint).
        let centerScreenPoint: CGPoint = mapView.convert(mapView.centerCoordinate, toPointTo: nil)
        print("Screen center: \(centerScreenPoint) = \(mapView.center)")
    }

    @objc @IBAction func handleMapTap(sender: UITapGestureRecognizer) {
        // Convert tap location (CGPoint) to geographic coordinate (CLLocationCoordinate2D).
        let tapPoint: CGPoint = sender.location(in: mapView)
        let tapCoordinate: CLLocationCoordinate2D = mapView.convert(tapPoint, toCoordinateFrom: mapView)
        print("You tapped at: \(tapCoordinate.latitude), \(tapCoordinate.longitude)")
        
        // Create an array of coordinates for our polyline, starting at the center of the map and ending at the tap coordinate.
        //var coordinates: [CLLocationCoordinate2D] = [mapView.centerCoordinate]
        coordinates.append(tapCoordinate)
        print("Coordinates list: \(coordinates)")

        
        var pointAnnotations = [MGLPointAnnotation]()
        for coordinate in coordinates {
            let point = MGLPointAnnotation()
            point.coordinate = coordinate
            point.title = "\(coordinate.latitude), \(coordinate.longitude)"
            pointAnnotations.append(point)
            
            print("Annotations: \(pointAnnotations)")
            
            let polyline = MGLPolyline(coordinates: &coordinates, count: UInt(coordinates.count))
            mapView.addAnnotation(polyline)
        
        }
        mapView.addAnnotations(pointAnnotations)
         
        // Remove any existing polyline(s) from the map.
        //if mapView.annotations?.count != nil, let existingAnnotations = mapView.annotations {
            //mapView.removeAnnotations(existingAnnotations)
        //}
         
        // Add a polyline with the new coordinates.
        //let polyline = MGLPolyline(coordinates: &coordinates, count: UInt(coordinates.count))
        //mapView.addAnnotation(polyline)
    }
}
