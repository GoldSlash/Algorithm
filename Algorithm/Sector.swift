import CoreLocation
import MapKit

class Sector: NSObject {
    
    var radius: Meters
    
    // score is simply the number of locations in a sector
    var score: Int { get { return numberOfLocations } }
    
    var locations = [CLLocation]()
    
    var numberOfLocations: Int { get { return locations.count } }
    
    // origin is average of all locations in the sector
    var origin: CLLocation {
        get {
            let latitudes = locations.map({$0.coordinate.latitude})
            let averageLatitude = latitudes.reduce(0, combine: +) / Double(latitudes.count)
            
            let longitudes = locations.map({$0.coordinate.longitude})
            let averageLongitude = longitudes.reduce(0, combine: +) / Double(longitudes.count)
            
            return CLLocation(latitude: averageLatitude, longitude: averageLongitude)
        }
    }
    
    init(radius: Meters) {
        self.radius = radius
    }
    
    func addLocation(location: CLLocation) {
        locations.append(location)
    }
}

extension Sector: MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D { get { return self.origin.coordinate } }
    
}