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
        
        
        
        
        // Make the source
        let source = MKMapItem.mapItemForCurrentLocation()
//        let source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 45.40, longitude: -122.69), addressDictionary: nil))
        
        // Make the destination
        let destinationCoords = CLLocationCoordinate2DMake(45.52, -122.681944)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoords, addressDictionary: nil)
        let destination = MKMapItem(placemark: destinationPlacemark)

        // Make the request and set the source, destination, and transport type
        let directionsRequest = MKDirectionsRequest()
        directionsRequest.setSource(source)
        directionsRequest.setDestination(destination)
        directionsRequest.transportType = .Automobile

        // Make the directions object
        let directions = MKDirections(request: directionsRequest)
        directions.calculateETAWithCompletionHandler({ (response, error) -> Void in
            if error != nil {
                print(error)
            }
            
            let eta: Seconds = response.expectedTravelTime
            let etaInWholeMinutes = Int(round(eta.inMinutes()))
            print("ETA: \(etaInWholeMinutes)m")
            })
        
        
        
        
    }

}

extension ViewController: CLLocationManagerDelegate {
    
}

extension ViewController: MKMapViewDelegate {
    
    
}

