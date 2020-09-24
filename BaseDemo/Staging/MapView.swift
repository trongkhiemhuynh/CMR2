//
//  MapView.swift
//  BaseDemo
//
//  Created by macOS on 9/24/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//
import UIKit
import MapKit

let BASEBS_HCM = CLLocation(latitude: 10.7646238, longitude: 106.700588)

class MapView: BaseView {
    
    private var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
        
    }
    
    func initView() {
        mapView = MKMapView()
        self.addSubview(mapView)
    }
    
    func setCamera() {
        let oahuCenter = BASEBS_HCM
        let region = MKCoordinateRegion(
          center: oahuCenter.coordinate,
          latitudinalMeters: 50_000,
          longitudinalMeters: 60_000)
        
        mapView.setCameraBoundary(
          MKMapView.CameraBoundary(coordinateRegion: region),
          animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200_000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
    }
    
    func addAnnotation() {
        // Show artwork on map
        let artwork = Artwork(
          title: "BASE BS",
          locationName: "HCM",
          discipline: "SE",
          coordinate: CLLocationCoordinate2D(latitude: BASEBS_HCM.coordinate.latitude, longitude: BASEBS_HCM.coordinate.longitude))
        mapView.addAnnotation(artwork)
    }
    
    override func layoutSubviews() {
        mapView.frame = self.bounds
        
        // Set initial location in Honolulu
        if mapView != nil {
            Logger.info("debug \(mapView.bounds)")
            let initialLocation = BASEBS_HCM
            
            mapView.centerToLocation(initialLocation)
            setCamera()
            addAnnotation()
        }
    }

}

extension MKMapView {
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        
        setRegion(coordinateRegion, animated: true)
    }
}

class Artwork: NSObject, MKAnnotation {
  let title: String?
  let locationName: String?
  let discipline: String?
  let coordinate: CLLocationCoordinate2D

  init(
    title: String?,
    locationName: String?,
    discipline: String?,
    coordinate: CLLocationCoordinate2D
  ) {
    self.title = title
    self.locationName = locationName
    self.discipline = discipline
    self.coordinate = coordinate

    super.init()
  }

  var subtitle: String? {
    return locationName
  }
}
