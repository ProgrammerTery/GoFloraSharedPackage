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
    /// Whether this driver has paid the activation deposit and can accept cash trips.
    /// Nullable for backward compatibility with older servers.
    public let driverAcceptsCash: Bool?

    public init(id: UUID?, driverID: UUID, tripRequestID: UUID, bidAmount: Double? = nil, isApproved: Bool = false, createdAt: Date? = nil, driverAcceptsCash: Bool? = nil) {
        self.id = id
        self.driverID = driverID
        self.tripRequestID = tripRequestID
        self.bidAmount = bidAmount
        self.isApproved = isApproved
        self.createdAt = createdAt
        self.driverAcceptsCash = driverAcceptsCash
    }
}

/// Payload the client sends when unchoosing a previously approved driver
/// so they can re-pick from remaining bids (typically because the chosen
/// driver doesn't accept cash and the client wants to pay cash).
public struct UnchooseDriverRequest: Content, Sendable {
    public let reason: String?

    public init(reason: String? = nil) {
        self.reason = reason
    }
}
