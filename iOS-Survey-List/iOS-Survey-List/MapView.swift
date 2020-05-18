//
//  MapView.swift
//  iOS-Survey-List
//
//  Created by Charmaine Beluso on 5/18/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//
// Starkville: latitude: 33.45049, longitude: -88.81961
// This file creates the map.


import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 33.45049, longitude: -88.81961)
        let region = MKCoordinateRegion( center: coordinate, latitudinalMeters: CLLocationDistance(exactly: 5000)!, longitudinalMeters: CLLocationDistance(exactly: 5000)!)
        uiView.setRegion(uiView.regionThatFits(region), animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
