//
//  DriverTripRequestPivotDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 23/11/2025.
//
import Vapor

public struct DriverTripRequestPivotDTO: Content {
    public let id: UUID?
    public let driverID: UUID
    public let tripRequestID: UUID
    public let bidAmount: Double?
    public let isApproved: Bool
    public let createdAt: Date?

    public init(id: UUID?, driverID: UUID, tripRequestID: UUID, bidAmount: Double? = nil, isApproved: Bool = false, createdAt: Date? = nil) {
        self.id = id
        self.driverID = driverID
        self.tripRequestID = tripRequestID
        self.bidAmount = bidAmount
        self.isApproved = isApproved
        self.createdAt = createdAt
    }
}
