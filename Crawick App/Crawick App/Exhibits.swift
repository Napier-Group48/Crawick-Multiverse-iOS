//
//  Exhibits.swift
//  Crawick App
//
//  Created by Steven Gibson on 25/03/2018.
//  Copyright © 2018 Steven Gibson. All rights reserved.
//

import UIKit
import CoreLocation

class Exhibits: UIViewController, UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate {
    
    
    let cellContent = ["Entrance", "Access To Cosimc Collision", "Comet Walk","Belvedere","The Void","Cosmic Collisions","Amphitheatre","Mosaic","North-South Avenue","Omphalos","Super Cluster","Multiverse","Milky Way","Andromeda"]
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        //locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        
        locationManager.startUpdatingLocation()
        
        let geoFenceEntrance:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(55.37984, -3.9329) , radius: 0.8, identifier: "Entrance")
        let geoFenceEaster:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(55.96177, -3.1674) , radius: 200, identifier: "Easter Road")
        //let geoFenceAccessCosimic:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(55.38159, -3.93233) , radius: 0.8, identifier: "Access To Cosimc Collision")
        //let geoFenceComet:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(55, -3.9329) , radius: 10, identifier: "Entrance")
        //let geoFenceBelvedere:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(55.38481, -3.93317) , radius: 0.8, identifier: "Belvedere")
        //let geoFenceVoid:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(55.3847, -3.93294) , radius: 0.8, identifier: "The Void")
       // let geoFenceCosmic:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(55.38209, -3.93233) , radius: 0.8, identifier: "Cosmic Collisions")
       // let geoFenceAmphitheatre:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(55.38209, -3.93277) , radius: 0.8, identifier: "Amphitheatre")
       // let geoFenceMosaic:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(55.38231, -3.93282) , radius: 0.8, identifier: "Mosaic")
       // let geoFenceNorthSouth1:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(55.38282, -3.93286) , radius: 0.8, identifier: "North-South Avenue")
       // let geoFenceNorthSouth2:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(55.38231, -3.93271) , radius: 0.8, identifier: "North-South Avenue")
        //let geoFenceNorthSouth3:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(55.37984, -3.9329) , radius: 10, identifier: "Entrance")
        //let geoFenceOmphalos:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(55.38390, -3.93294) , radius: 0.8, identifier: "Omphalos")
       // let geoFenceCluster:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(55.38396, -3.93408) , radius: 0.8, identifier: "Super Cluster")
       // let geoFenceMultiverse:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(55.38153, -3.93407) , radius: 0.8, identifier: "Multiverse")
       // let geoFenceMilkyWay:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(55.38346, -3.93433) , radius: 0.8, identifier: "Milky Way")
       // let geoFenceAndromeda:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(55.38338, -3.93451) , radius: 0.8, identifier: "Andromeda")
        
        locationManager.startMonitoring(for: geoFenceEntrance)
        


        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        //print("Entered: \(region.identifier)")
        if (region.identifier == "Entrance"){
            print("Crawick")
        }
        else{
            print("You are at: \(region.identifier)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Exited: \(region.identifier)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ExhibitTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ExhibitTableViewCell
        var ExhibitData:[String]?
        if let path = Bundle.main.path(forResource: "Exhibit-Data", ofType: "txt"){
        do{
            let data = try String(contentsOfFile: path,encoding: .utf8)
            ExhibitData = data.components(separatedBy: "££")
            //print(ExhibitData![2])
        }
        catch
        {
            print(error)
        }
        }
        //print(cellContent [indexPath.row] + ".txt")
    
        cell.imgExhibitsImage.image = UIImage(named:(cellContent [indexPath.row] + ".jpg"))
        cell.lblExhibitText.text = ExhibitData? [indexPath.row]
        cell.lblExhibitTitle.text = cellContent [indexPath.row]
        return cell
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //print (locations)
        let userLocation: CLLocation = locations[0]
        let lat = userLocation.coordinate.latitude
        let longi = userLocation.coordinate.longitude
        print(lat ," , ", longi)
        
        
    }
}
