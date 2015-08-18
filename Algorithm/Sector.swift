import CoreLocation

class Sector {
    
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
    
    func addLocation(location: CLLocation) {
        locations.append(location)
    }
}