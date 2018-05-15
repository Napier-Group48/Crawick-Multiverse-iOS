//
//  SiteOverlay.swift
//  Crawick App
//
//  Created by Steven Gibson on 12/04/2018.
//  Copyright © 2018 Steven Gibson. All rights reserved.
//

import UIKit
import MapKit

class ParkMapOverlay: NSObject, MKOverlay {
    
    var coordinate: CLLocationCoordinate2D
    var boundingMapRect: MKMapRect
    
    init(park: Park) {
        boundingMapRect = park.overlayBoundingMapRect
        coordinate = park.midCoordinate
    }
}
