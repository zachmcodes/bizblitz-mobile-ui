//
//  MapView.swift
//  BizBlitz
//
//  Created by Zachary Mathes on 8/22/24.
//

import SwiftUI
import _MapKit_SwiftUI

struct MapView: View {
    
    var business: Business
    
    var body: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: business.coordinates.latitude, longitude: business.coordinates.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )), annotationItems: [business]) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(
                latitude: location.coordinates.latitude,
                longitude: location.coordinates.longitude
            )) {
                Image(systemName: "mappin.circle.fill")
                    .foregroundColor(.red)
                    .font(.title)
                    .onLongPressGesture {
                        openMapsForDirections(latitude: business.coordinates.latitude, longitude: business.coordinates.longitude)
                    }
            }
        }
        .frame(width: .infinity, height: 300)
        .cornerRadius(15)
    }
}
