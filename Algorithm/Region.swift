import CoreLocation

let maxDistanceFromSectorOrigin: Meters = 100.0

class Region {
    
    let origin: CLLocation
    
    let radius: Meters
    
    var sectors = [Sector]()
    
    var locations = [CLLocation]()
    
    var numberOfLocations: Int { get { return locations.count } }
    
    init(origin: CLLocation, radius: Meters) {
        self.origin = origin
        self.radius = radius
    }
    
    func sectorsFromLocations(locations: [CLLocation]) -> [Sector] {
        var sectors = [Sector]()
        
        for location in locations {
            var existingSectorFound = false
            
            // search for an existing sector that location should belong to based on distance from sector origin
            for sector in sectors {
                let distanceFromSectorOrigin = location.distanceFromLocation(sector.origin)
                if distanceFromSectorOrigin < maxDistanceFromSectorOrigin {
                    sector.addLocation(location)
                    existingSectorFound = true
                    break
                }
            }
            
            // no existing sector was found, so we'll create a new one
            if !existingSectorFound {
                let sector = Sector()
                sector.addLocation(location)
                sectors.append(sector)
            }
        }
        
        return sectors
    }
}