import CloudKit

class CloudManager {

    var location: CLLocation?
    
    var radius: Meters?
    
    func fetchLocations() {
        if let location = self.location {
            if let radius = self.radius {
                // fetch locations matching this predicate (within 'radius' miles of 'origin')
                let predicate = NSPredicate(format: "distanceToLocation:fromLocation:(location, %@) < %f", [location, radius])
                let query = CKQuery(recordType: "location", predicate: predicate)
                
                let matchinglocations: [CLLocation]
                // add matchingLocations to self.locations
            }
        }
    }
    
    class func fetchRandomLocations(#numberOfLocations: Int) -> [CLLocation] {
        var locations: [CLLocation] = []
        
        let portlandCoordinate = CLLocation(latitude: 45.52, longitude: -122.681944).coordinate
        var radius = 0.1
        
        for _ in 0..<numberOfLocations {
            let x = Double.random(min: -radius, max: radius)
            let y = Double.random(min: -sqrt(radius*radius - x*x), max: sqrt(radius*radius - x*x))
            let latitude = portlandCoordinate.latitude  + x
            let longitude = portlandCoordinate.longitude + y
            let location = CLLocation(latitude: latitude, longitude: longitude)
            locations.append(location)
        }
        
        return locations
    }
}