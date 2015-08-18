import UIKit
import CoreLocation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let regionRadius: Miles = 20.0
        
        let currentLocation = CLLocation(latitude: 45.52, longitude: -122.681944)  // using Portland for now
        let region = Region(origin: currentLocation, radiusInMiles: regionRadius)
        region.fetchLocations()
    }

}

