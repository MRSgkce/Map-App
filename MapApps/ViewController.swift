//
//  ViewController.swift
//  MapApps
//
//  Created by Mürşide Gökçe on 29.08.2024.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.delegate=self
        //kişinin konummu
        locationManager.delegate = self
        //konum alınırken en iyisi mi olsun. keskinliği gösteriyor.
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        //kullanıcan bir izin isteği alınmalı
        locationManager.requestWhenInUseAuthorization()
        //konumu güncelle
        locationManager.startUpdatingLocation()
        
        let gestureRecognizer
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //enlem boylamı alma
        let locationn = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        //yükseklik ve genişliği spandir
        let span=MKCoordinateSpan(latitudeDelta: 0.9, longitudeDelta: 0.9)
        //İLK AÇILDIĞINDA GÖRÜNÜM YAKIN VEYA UZAKLIĞI için değerler
        
        let region = MKCoordinateRegion(center: locationn, span: span)
        //bölgwyi değiştir
        mapView.setRegion(region, animated: true)
        //print(locations[0].coordinate.latitude)
        //print(locations[0].coordinate.longitude)
    }
}

