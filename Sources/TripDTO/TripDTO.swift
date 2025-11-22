//
//  TripDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya
//

import Vapor
import Foundation

public struct TripRequestDTO: Content {
    public let id: UUID?
    public let clientName: String
    public let pickupLocation: String
    public let pickupLatitude: Double?
    public let pickupLongitude: Double?
    public let dropoffLocation: String
    public let dropoffLatitude: Double?
    public let dropoffLongitude: Double?
    public let pickupTime: Date
    public let numberOfPassengers: Int
    public let specialInstructions: String?
    public let estimatedDistance: Double?
    public let estimatedDuration: Int?
    public let status: String?
    public let driver_id: UUID?
    public let client_id: UUID?
    
    public init(id: UUID?, clientName: String, pickupLocation: String, pickupLatitude: Double?, pickupLongitude: Double?, dropoffLocation: String, dropoffLatitude: Double?, dropoffLongitude: Double?, pickupTime: Date, numberOfPassengers: Int, specialInstructions: String?, estimatedDistance: Double?, estimatedDuration: Int?, status: String?, driver_id: UUID?, client_id: UUID?) {
        self.id = id
        self.clientName = clientName
        self.pickupLocation = pickupLocation
        self.pickupLatitude = pickupLatitude
        self.pickupLongitude = pickupLongitude
        self.dropoffLocation = dropoffLocation
        self.dropoffLatitude = dropoffLatitude
        self.dropoffLongitude = dropoffLongitude
        self.pickupTime = pickupTime
        self.numberOfPassengers = numberOfPassengers
        self.specialInstructions = specialInstructions
        self.estimatedDistance = estimatedDistance
        self.estimatedDuration = estimatedDuration
        self.status = status
        self.driver_id = driver_id
        self.client_id = client_id
    }
}

public struct TripRequestCreateDTO: Content {
    public let clientName: String
    public let pickupLocation: String
    public let pickupLatitude: Double?
    public let pickupLongitude: Double?
    public let dropoffLocation: String
    public let dropoffLatitude: Double?
    public let dropoffLongitude: Double?
    public let pickupTime: Date
    public let numberOfPassengers: Int
    public let specialInstructions: String?
    
    public init(clientName: String, pickupLocation: String, pickupLatitude: Double?, pickupLongitude: Double?, dropoffLocation: String, dropoffLatitude: Double?, dropoffLongitude: Double?, pickupTime: Date, numberOfPassengers: Int, specialInstructions: String?) {
        self.clientName = clientName
        self.pickupLocation = pickupLocation
        self.pickupLatitude = pickupLatitude
        self.pickupLongitude = pickupLongitude
        self.dropoffLocation = dropoffLocation
        self.dropoffLatitude = dropoffLatitude
        self.dropoffLongitude = dropoffLongitude
        self.pickupTime = pickupTime
        self.numberOfPassengers = numberOfPassengers
        self.specialInstructions = specialInstructions
    }
}

public struct TripCancellationDTO: Content {
    public let id: UUID?
    public let tripRequestID: UUID
    public let reason: String
    public let cancelledBy: String
    public let cancelledAt: Date
    
    public init(id: UUID?, tripRequestID: UUID, reason: String, cancelledBy: String, cancelledAt: Date) {
        self.id = id
        self.tripRequestID = tripRequestID
        self.reason = reason
        self.cancelledBy = cancelledBy
        self.cancelledAt = cancelledAt
    }
}

