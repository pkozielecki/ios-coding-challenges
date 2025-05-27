import Foundation

public struct ParkingVehicles: Challenge {
    public let data: ParkingVehicles.CarPark

    public init(data: ParkingVehicles.CarPark) {
        self.data = data
    }

    public func execute() -> String {
        let reservations = data.reservations
        var vehicles = [String]()
        for vehicle in Vehicle.allCases {
            let count = reservations.filter({ $0.vehicle == vehicle }).count
            vehicles.append("\(vehicle): \(count)")
        }
        var spots = [String]()
        for spot in ParkingSpot.allCases {
            let count = reservations.filter({ $0.spot == spot }).count
            spots.append("\(spot): \(count)")
        }
        return "Parked: \(vehicles.joined(separator: ", ")) || Spots taken: \(spots.joined(separator: ", "))"
    }
}

extension ParkingVehicles {

    public struct CarPark: CustomStringConvertible {
        private let compactSpaces: Int, regularSpaces: Int, largeSpaces: Int
        private(set) public var reservations: [Reservation] = []

        public init(compactSpaces: Int, regularSpaces: Int, largeSpaces: Int) {
            self.compactSpaces = compactSpaces
            self.regularSpaces = regularSpaces
            self.largeSpaces = largeSpaces
        }

        public mutating func park(_ vehicle: Vehicle) -> Reservation? {
            guard !isFull() else {
                return nil
            }

            let allowedParkingSpots = vehicle.allowedParkingSpots
            for spot in allowedParkingSpots {
                print("- Trying \(spot) for \(vehicle).")
                let spotsTaken = spotsTaken(of: spot)
                let maxSpots = maxSpots(of: spot)
                if spotsTaken < maxSpots {
                    // we can part at a given spot:
                    let reservation = Reservation(vehicle: vehicle, spot: spot)
                    reservations.append(reservation)
                    print("- Parked \(vehicle) in \(spot).")
                    return reservation
                }
            }
            return nil
        }
        
        public mutating func free(_ reservation: Reservation) -> Bool {
            guard !isEmpty() else {
                return true
            }
            if let index = reservations.firstIndex(of: reservation) {
                reservations.remove(at: index)
                return true
            } else {
                return false
            }
        }

        public func isEmpty() -> Bool {
            reservations.isEmpty
        }

        public func isFull() -> Bool {
            for spot in ParkingSpot.allCases {
                if spotsTaken(of: spot) < maxSpots(of: spot) {
                    return false
                }
            }
            return true
        }

        public func getParkedCount(for vehicle: Vehicle) -> Int {
            reservations.filter({ $0.vehicle == vehicle }).count
        }

        public var description: String {
            "Compact spots: \(compactSpaces), Normal spots: \(regularSpaces), Large spost: \(largeSpaces), is Full: \(isFull())"
        }

        private func maxSpots(of spot: ParkingSpot) -> Int {
            switch spot {
            case .compact: return compactSpaces
            case .standard: return regularSpaces
            case .large: return largeSpaces
            }
        }
        
        private func spotsTaken(of spot: ParkingSpot) -> Int {
            reservations.filter({ $0.spot == spot }).count
        }
    }
    
    public struct Reservation: Equatable {
        public let vehicle: Vehicle
        public let spot: ParkingSpot
        
        public init(vehicle: Vehicle, spot: ParkingSpot) {
            self.vehicle = vehicle
            self.spot = spot
        }
    }

    public enum ParkingSpot: Equatable, CaseIterable {
        case compact
        case standard
        case large
    }

    public enum Vehicle: Equatable, Hashable, CaseIterable {
        case motorCycle
        case car
        case van

        var allowedParkingSpots: [ParkingSpot] {
            switch self {
            case .car: return [.standard, .large]
            case .motorCycle: return [.compact, .standard, .large]
            case .van: return [.large]
            }
        }
    }
}
