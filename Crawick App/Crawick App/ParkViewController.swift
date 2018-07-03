//
//  ParkView.swift
//  Crawick App
//
//  Created by Steven Gibson on 13/04/2018.
//  Updated By Steven Gibson on 03/07/2018.
//  Copyright © 2018 Steven Gibson. All rights reserved.
//

import UIKit
import AVFoundation
import MapKit

class ParkViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var Parkmap: MKMapView!
    
    var audioPlayer = AVAudioPlayer()
    var audioPlayer2 = AVAudioPlayer()
    let Exhibits = ["Entrance", "Access To Cosimc Collision", "Comet Walk","Belvedere","The Void","Cosmic Collisions","Amphitheatre","Mosaic","North-South Avenue","Omphalos","Super Cluster","Multiverse","Milky Way","Andromeda"]
    let Location1 = Bundle.main.path(forResource: "Audio Files/Location1", ofType: "wav")
    let Location2 = Bundle.main.path(forResource: "Audio Files/Location2", ofType: "wav")
    let Location3 = Bundle.main.path(forResource: "Audio Files/Location3", ofType: "wav")
    let Location4 = Bundle.main.path(forResource: "Audio Files/Location4", ofType: "wav")
    let Location5 = Bundle.main.path(forResource: "Audio Files/Location5", ofType: "wav")
    let Location6 = Bundle.main.path(forResource: "Audio Files/Location6", ofType: "wav")
    let Location7 = Bundle.main.path(forResource: "Audio Files/Location7", ofType: "wav")
    let Location8 = Bundle.main.path(forResource: "Audio Files/Location8", ofType: "wav")
    let Location9 = Bundle.main.path(forResource: "Audio Files/Location9", ofType: "wav")
    let Location10 = Bundle.main.path(forResource: "Audio Files/Location10", ofType: "wav")
    let Location11 = Bundle.main.path(forResource: "Audio Files/Location11", ofType: "wav")
    let Location12 = Bundle.main.path(forResource: "Audio Files/Location12", ofType: "wav")
    let Location13 = Bundle.main.path(forResource: "Audio Files/Location13", ofType: "wav")
    let Location14 = Bundle.main.path(forResource: "Audio Files/Location14", ofType: "wav")
    let CreditsAudio = Bundle.main.path(forResource: "Audio Files/Credits", ofType: "wav")
    
    
    let Co_AccessCosimic = CLLocationCoordinate2DMake(55.3817, -3.9305)
    let Co_Comet = CLLocationCoordinate2DMake(55.3839, -3.9320)
    let Co_Void = CLLocationCoordinate2DMake(55.38481, -3.93317)
    let Co_Belvedere = CLLocationCoordinate2DMake(55.3847, -3.93294)
    let Co_Cosmic = CLLocationCoordinate2DMake(55.3817, -3.9315)
    let Co_Amphitheatre = CLLocationCoordinate2DMake(55.38209, -3.93277)
    let Co_Mosaic = CLLocationCoordinate2DMake(55.38231, -3.93282)
    //let geoFenceNorthSouth1:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(55.38282, -3.93286) , radius: 0.8, identifier: "North-South Avenue")
    let Co_NorthSouth = CLLocationCoordinate2DMake(55.3816, -3.9325)
    let Co_NorthSouth3 = CLLocationCoordinate2DMake(55.3834, -3.9328)
    let Co_Omphalos = CLLocationCoordinate2DMake(55.38390, -3.93294)
    let Co_Cluster = CLLocationCoordinate2DMake(55.38396, -3.93408)
    let Co_Multiverse = CLLocationCoordinate2DMake(55.3846, -3.9335)
    let Co_MilkyWay = CLLocationCoordinate2DMake(55.38346, -3.93433)
    let Co_Andromeda = CLLocationCoordinate2DMake(55.38338, -3.93451)
    let Co_Entrance = CLLocationCoordinate2DMake(55.37984, -3.9329)
    
    
    let initialLocation = CLLocation(latitude: 55.3819, longitude: -3.9325)
    
    let Anno_Entrance = MKPointAnnotation()
    let Anno_AccessCosmic = MKPointAnnotation()
    let Anno_Comet = MKPointAnnotation()
    let Anno_Belvedere = MKPointAnnotation()
    let Anno_Void = MKPointAnnotation()
    let Anno_Cosmic = MKPointAnnotation()
    let Anno_Amphitheatre = MKPointAnnotation()
    let Anno_Mosaic = MKPointAnnotation()
    let Anno_NorthSouth = MKPointAnnotation()
    let Anno_NorthSouth3 = MKPointAnnotation()
    let Anno_Omphlos = MKPointAnnotation()
    let Anno_Cluster = MKPointAnnotation()
    let Anno_Multiverse = MKPointAnnotation()
    let Anno_Milky = MKPointAnnotation()
    let Anno_Andromeda = MKPointAnnotation()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        centerMapOnLocation(location:initialLocation)
        Parkmap.delegate = self
        
        
        Anno_Entrance.title = ""
        Anno_Entrance.subtitle = Exhibits[0]
        Anno_Entrance.coordinate = Co_Entrance
        Parkmap.addAnnotation(Anno_Entrance)
        
        Anno_AccessCosmic.title = ""
        Anno_AccessCosmic.subtitle = Exhibits[1]
        Anno_AccessCosmic.coordinate = Co_AccessCosimic
        Parkmap.addAnnotation(Anno_AccessCosmic)
       
        Anno_Comet.title = ""
        Anno_Comet.subtitle = Exhibits[2]
        Anno_Comet.coordinate = Co_Comet
        Parkmap.addAnnotation(Anno_Comet)
        
        Anno_Belvedere.title = ""
        Anno_Belvedere.subtitle = Exhibits[3]
        Anno_Belvedere.coordinate = Co_Belvedere
        Parkmap.addAnnotation(Anno_Belvedere)
        
        Anno_Void.title = ""
        Anno_Void.subtitle = Exhibits[4]
        Anno_Void.coordinate = Co_Void
        Parkmap.addAnnotation(Anno_Void)
        
        Anno_Cosmic.title = ""
        Anno_Cosmic.subtitle = Exhibits[5]
        Anno_Cosmic.coordinate = Co_Cosmic
        Parkmap.addAnnotation(Anno_Cosmic)
        
        Anno_Amphitheatre.title = ""
        Anno_Amphitheatre.subtitle = Exhibits[6]
        Anno_Amphitheatre.coordinate = Co_Amphitheatre
        Parkmap.addAnnotation(Anno_Amphitheatre)
        
        Anno_Mosaic.title = ""
        Anno_Mosaic.subtitle = Exhibits[7]
        Anno_Mosaic.coordinate = Co_Mosaic
        Parkmap.addAnnotation(Anno_Mosaic)
        
        Anno_NorthSouth.title = ""
        Anno_NorthSouth.subtitle = Exhibits[8]
        Anno_NorthSouth.coordinate = Co_NorthSouth
        Parkmap.addAnnotation(Anno_NorthSouth)
        
        Anno_NorthSouth3.title = ""
        Anno_NorthSouth3.subtitle = Exhibits[8]
        Anno_NorthSouth3.coordinate = Co_NorthSouth3
        Parkmap.addAnnotation(Anno_NorthSouth3)
        
        Anno_Omphlos.title = ""
        Anno_Omphlos.subtitle = Exhibits[9]
        Anno_Omphlos.coordinate = Co_Omphalos
        Parkmap.addAnnotation(Anno_Omphlos)
        
        Anno_Cluster.title = ""
        Anno_Cluster.subtitle = Exhibits[10]
        Anno_Cluster.coordinate = Co_Cluster
        Parkmap.addAnnotation(Anno_Cluster)
        
        Anno_Multiverse.title = ""
        Anno_Multiverse.subtitle = Exhibits[11]
        Anno_Multiverse.coordinate = Co_Multiverse
        Parkmap.addAnnotation(Anno_Multiverse)
        
        Anno_Milky.title = ""
        Anno_Milky.subtitle = Exhibits[12]
        Anno_Milky.coordinate = Co_MilkyWay
        Parkmap.addAnnotation(Anno_Milky)
        
        Anno_Andromeda.title = ""
        Anno_Andromeda.subtitle = Exhibits[13]
        Anno_Andromeda.coordinate = Co_Andromeda
        Parkmap.addAnnotation(Anno_Andromeda)
        

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
   //play audio on clicking annotations
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)
    {
        var Audio = CreditsAudio
        let pinname = view.annotation?.subtitle
        if pinname == Exhibits[0]
        {
            Audio = Location1
        }
        else if pinname == Exhibits[1]
        {
            Audio = Location2
        }
        
        else if pinname == Exhibits[2]
        {
            Audio = Location3
        }
        else if pinname == Exhibits[3]
        {
            Audio = Location4
        }
        else if pinname == Exhibits[4]
        {
            Audio = Location5
        }
        else if pinname == Exhibits[5]
        {
            Audio = Location6
        }
        else if pinname == Exhibits[6]
        {
            Audio = Location7
        }
        else if pinname == Exhibits[7]
        {
            Audio = Location8
        }
        else if pinname == Exhibits[8]
        {
            Audio = Location9
        }
        else if pinname == Exhibits[9]
        {
            Audio = Location10
        }
        else if pinname == Exhibits[10]
        {
            Audio = Location11
        }
        else if pinname == Exhibits[11]
        {
            Audio = Location12
        }
        else if pinname == Exhibits[12]
        {
            Audio = Location13
        }
        else if pinname == Exhibits[13]
        {
            Audio = Location14
        }
        else
        {
            Audio = CreditsAudio
        }
        
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: Audio!))
                
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
                try AVAudioSession.sharedInstance().setActive(true)
            }
            catch{
                print(error)
            }
            audioPlayer.play()
        }
        
    
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView)
    {
        if audioPlayer.isPlaying
        {
            audioPlayer.stop()
        }
    }
    
    let regionRadius: CLLocationDistance = 500
    func centerMapOnLocation(location: CLLocation)
    {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        Parkmap.setRegion(coordinateRegion, animated: true)
    }
    
}
