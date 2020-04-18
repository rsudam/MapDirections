//
//  MainController.swift
//  MapDirections
//
//  Created by Raghu Sairam on 18/04/20.
//  Copyright © 2020 Raghu Sairam. All rights reserved.
//

import UIKit
import MapKit
import LBTATools

extension MainController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "id")
        annotationView.canShowCallout = true
        return annotationView
    }
    
}


class MainController: UIViewController {
    
    let mapView = MKMapView()
    let templeLatitude = 17.346598
    let templeLongitude = 78.475519
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        view.addSubview(mapView)
        mapView.fillSuperview()
        
        setupRegionForMap()
        setupAnnotationForMap()
    }
    
    
    
    fileprivate func setupRegionForMap(){
        
        let centerCordinate = CLLocationCoordinate2D(latitude: templeLatitude, longitude: templeLongitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let region = MKCoordinateRegion(center: centerCordinate, span: span)
        
        mapView.setRegion(region, animated: true)
    }
    
    fileprivate func setupAnnotationForMap(){
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: templeLatitude, longitude: templeLongitude)
        annotation.title = "Mahankali Temple"
        annotation.subtitle = "Laldarwaza"
        
        mapView.addAnnotation(annotation)
        
        let buddhaAnnotation = MKPointAnnotation()
        buddhaAnnotation.coordinate = CLLocationCoordinate2D(latitude: 17.415583, longitude: 78.475077)
        buddhaAnnotation.title = "Buddha Statue"
        buddhaAnnotation.subtitle = "Secunderabad"
        mapView.addAnnotation(buddhaAnnotation)
        
        mapView.showAnnotations(self.mapView.annotations, animated: true)
        
    }
}
