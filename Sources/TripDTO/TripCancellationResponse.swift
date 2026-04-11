//
//  TripCancellationResponse.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 23/11/2025.
//

import Vapor

public struct TripCancellationResponse: Content {
   public let success: Bool
    public  let message: String
    public let cancellationId: UUID?

    public init(success: Bool, message: String,cancellationId: UUID?) {
        self.success = success
        self.message = message
        self.cancellationId = cancellationId
    }
}


public struct TripCancellationQueryDTO: Content {

    public let id: UUID
    public let tripRequestID: UUID
    public  let cancelledByType: String
    public  let cancelledById: UUID
    public  let cancellationReason: String?
    public  let cancellationFee: Double?
    public  let refundAmount: Double?
    public  let cancelledAt: Date?

    public init(id: UUID, tripRequestID: UUID , cancelledByType: String, cancelledById: UUID, cancellationReason: String?, cancellationFee: Double?, refundAmount: Double?, cancelledAt: Date?) {
        self.id = id
        self.tripRequestID = tripRequestID
        self.cancelledByType = cancelledByType
        self.cancelledById = cancelledById
        self.cancellationReason = cancellationReason
        self.cancellationFee = cancellationFee
        self.refundAmount = refundAmount
        self.cancelledAt = cancelledAt
    }
}
