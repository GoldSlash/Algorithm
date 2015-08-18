import CoreLocation

class Region {
    
    // TODO: replace with a matrix data structure
    // http://stackoverflow.com/questions/26563821/swift-how-to-declare-a-2d-array-grid-or-matrix-in-swift-to-allow-random-inser
    var sectors = [Sector]()
    
    let origin: CLLocation
    let radius: Meters
    
    private var locations = Set<CLLocation>()
    
    var numberOfLocations: Int { get { return locations.count } }
    
    init(origin: CLLocation, radiusInKilometers radius: Kilometers) {
        self.origin = origin
        self.radius = radius * 1000
    }
    
    init(origin: CLLocation, radiusInMiles radius: Miles) {
        self.origin = origin
        self.radius = radius * 1609.34
    }
    
    func fetchLocations() {
        // use CloudKit to fetch locations matching this predicate (within 'radius' miles of 'origin')
        let predicate = NSPredicate(format: "distanceToLocation:fromLocation:(location, %@) < %f", [self.origin, self.radius])
        let matchinglocations: [CLLocation]
        // add matchingLocations to self.locations
    }
    
    func assignLocationsToSectors() {
        // determine size of sectors matrix, based on locations with the most exteme lat/long values
        // example:
        // currentLocation is 42.52, -122.681944 (Portland)
        // locations: (42.10, -122.60), (42.20, -122.70), (42.30, -122.50), (42.40, -122.40), (42.50, -122.40)
        // extremes would be 42.10 to 42.50 and -122.70 to -122.40
        
        
        for location in locations {
            // let containingSector = sectors.sectorContainingLocation(location)
            // containingSector.addLocation(location)
        }
    }
    
    func scoreSectors() {
        // sort sectors by sector.numberOfLocations?
        // this probably needs to consider the mean minutes between the locations' dates
        for sector in sectors {
            sector.score = Double(sector.numberOfLocations) / Double(self.numberOfLocations) * 100
        }
    }
}