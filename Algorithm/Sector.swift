import CoreLocation

class Sector {
    
    let originPoint: CLLocationCoordinate2D
    let size: Meters
    
    var score: Double = 0   // 0 to 100
    
    private var locations = Set<CLLocation>()
    
    var numberOfLocations: Int { get { return locations.count } }
    
    init(originPoint: CLLocationCoordinate2D, size: Meters) {
        self.originPoint = originPoint
        self.size = size
    }
    
    func addLocation(location: CLLocation) {
        locations.insert(location)
    }
}