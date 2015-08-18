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
    
    class func fetchRandomLocations() -> [CLLocation] {
        var locations: [CLLocation] = []
        
        let portlandCoordinate = CLLocation(latitude: 45.52, longitude: -122.681944).coordinate
        
        for _ in 0..<10 {
            let latitude = portlandCoordinate.latitude  // + random offset
            let longitude = portlandCoordinate.longitude    // + random offset
            let location = CLLocation(latitude: latitude, longitude: longitude)
            locations.append(location)
        }
        
        return locations
    }
}