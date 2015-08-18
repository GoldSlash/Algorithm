import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        let currentLocation = CLLocation(latitude: 45.52, longitude: -122.681944)  // using Portland for now

        // Region
        let regionRadius: Miles = 20.0
        let region = Region(origin: currentLocation, radius: regionRadius.inMeters())
        region.locations = CloudManager.fetchRandomLocations()
        
        // MapView
        mapView.delegate = self
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        mapView.region = MKCoordinateRegion(center: currentLocation.coordinate, span: span)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .Follow
        
        let point = MKPointAnnotation()
        point.coordinate = currentLocation.coordinate
        mapView.addAnnotation(point)
        
        for location in region.locations {
            let point = MKPointAnnotation()
            point.coordinate = location.coordinate
            mapView.addAnnotation(point)
        }
    }

}

extension ViewController: CLLocationManagerDelegate {
    
}

extension ViewController: MKMapViewDelegate {
    
    
}

