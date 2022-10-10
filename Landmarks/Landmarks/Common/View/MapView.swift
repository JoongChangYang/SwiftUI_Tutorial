//
//  MapView.swift
//  Landmarks
//
//  Created by 양중창 on 2022/07/11.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium
    
    var body: some View {
        Map(coordinateRegion: .constant(self.region))
    }
    
}

extension MapView {
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"
        
        var id: Zoom {
            return self
        }
    }
}

extension MapView {
    private var region: MKCoordinateRegion {
        return MKCoordinateRegion(center: self.coordinate,
                                  span: MKCoordinateSpan(latitudeDelta: self.delta, longitudeDelta: self.delta))
    }
    
    private var delta: CLLocationDegrees {
        switch self.zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
