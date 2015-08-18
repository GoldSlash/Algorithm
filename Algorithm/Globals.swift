typealias Meters = Double
typealias Miles = Double
typealias Seconds = Double
typealias Minutes = Double

extension Miles {
    func inMeters() -> Meters {
        return self * 1609.34
    }
}

extension Seconds {
    func inMinutes() -> Minutes {
        return self / 60.0
    }
}