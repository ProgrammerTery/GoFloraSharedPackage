//
//  PendingReviewTripDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 23/11/2025.
//
import Vapor


public struct PendingReviewTripDTO: Content {
   public let id: UUID?
   public let driverID: UUID
   public let tripRequestID: UUID
   public let acceptedAt: Date

    public init(id: UUID?, driverID: UUID, tripRequestID: UUID, acceptedAt: Date) {
        self.id = id
        self.driverID = driverID
        self.tripRequestID = tripRequestID
        self.acceptedAt = acceptedAt
    }
}
