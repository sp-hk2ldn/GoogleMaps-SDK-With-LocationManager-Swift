//
//  GoogleMapViewController.swift
//  
//
//  Created by Stephen Parker on 30/06/2015.
//  
//

import UIKit
import CoreLocation
import GoogleMaps


class GoogleMapViewController: UIViewController, CLLocationManagerDelegate {
    var manager: CLLocationManager?
    var mapView: GMSMapView?

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager = CLLocationManager()
        manager?.delegate = self
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        manager?.requestWhenInUseAuthorization()
        manager?.requestAlwaysAuthorization()
        manager?.startUpdatingLocation()
        println(manager?.location)

        
        var camera = GMSCameraPosition.cameraWithLatitude(22.3750,
            longitude: 114.1833, zoom: 12)
        mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView!.myLocationEnabled = true
        self.view = mapView
        var marker = GMSMarker()
        var locations: [AnyObject]?
        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
