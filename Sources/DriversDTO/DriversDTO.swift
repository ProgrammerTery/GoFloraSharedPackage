//
//  DriversDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya
//

import Vapor
import Foundation

public struct DriverDTO: Content {
    public let driverID: String
    public let driverName: String
    public let driverPhone: String
    public let driverEmail: String
    public let driverAddress: String
    public let registrationDate: Date
    public let driverLicense: String
    public let vehicle_id: UUID
    
    public init(driverID: String, driverName: String, driverPhone: String, driverEmail: String, driverAddress: String, registrationDate: Date, driverLicense: String, vehicle_id: UUID) {
        self.driverID = driverID
        self.driverName = driverName
        self.driverPhone = driverPhone
        self.driverEmail = driverEmail
        self.driverAddress = driverAddress
        self.registrationDate = registrationDate
        self.driverLicense = driverLicense
        self.vehicle_id = vehicle_id
    }
}

public struct DriverTripRequestPivotDTO: Content {
    public let id: UUID?
    public let driverID: UUID
    public let tripRequestID: UUID
    public let bidAmount: Double?
    public let isApproved: Bool
    
    public init(id: UUID?, driverID: UUID, tripRequestID: UUID, bidAmount: Double? = nil, isApproved: Bool = false) {
        self.id = id
        self.driverID = driverID
        self.tripRequestID = tripRequestID
        self.bidAmount = bidAmount
        self.isApproved = isApproved
    }
}
