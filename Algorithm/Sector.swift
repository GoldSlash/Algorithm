import CoreLocation

class Sector {
    
    let origin: CLLocation
    let radius: Seconds
    
    var score: Double = 0   // 0 to 100
    
    private var locations = Set<CLLocation>()
    
    var numberOfLocations: Int { get { return locations.count } }
    
    init(origin: CLLocation, radius: Seconds) {
        self.origin = origin
        self.radius = radius
    }
    
    func addLocation(location: CLLocation) {
        locations.insert(location)
    }
}