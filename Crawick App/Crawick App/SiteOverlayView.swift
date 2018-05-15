//
//  SiteOverlayView.swift
//  Crawick App
//
//  Created by Steven Gibson on 12/04/2018.
//  Copyright © 2018 Steven Gibson. All rights reserved.
//


import UIKit
import MapKit

class ParkMapOverlayView: MKOverlayRenderer {
    var overlayImage: UIImage
    
    override init(overlay:MKOverlay) {
        self.overlayImage = UIImage.init(imageLiteralResourceName: "map.jpg")
        super.init(overlay: overlay)
    }
    
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        guard let imageReference = overlayImage.cgImage else { return }
        
        let rect = self.rect(for: overlay.boundingMapRect)
        context.scaleBy(x: 1.0, y: -1.0)
        context.translateBy(x: 0.0, y: -rect.size.height)
        context.draw(imageReference, in: rect)
    }
}
