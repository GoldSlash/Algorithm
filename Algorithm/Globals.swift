typealias Meters = Double
typealias Miles = Double
typealias Seconds = Double

extension Miles {
    func inMeters() -> Meters {
        return self * 1609.34
    }
}