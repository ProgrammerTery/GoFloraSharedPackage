//
//  TransportServiceDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 13/12/2025.
//
import Vapor

// MARK: - Transport Service

public struct TransportServiceDTO: Content {
    public let transportServiceType: String
    public let id: UUID?
    public let baseFare: Double?
    public let description: String?
    public let isTransfer: Bool // Indicates if the service is a transfer type or available for regular trips
    public let defaultCommissionPercent: Double? // Commission percentage for this service tier
    public let minCommissionCents: Int? // Minimum commission in cents
    public let maxCommissionCents: Int? // Maximum commission cap in cents

    public init(transportServiceType: String, id: UUID?, baseFare: Double? = nil, description: String? = nil, isTransfer: Bool = false, defaultCommissionPercent: Double? = nil, minCommissionCents: Int? = nil, maxCommissionCents: Int? = nil) {
        self.transportServiceType = transportServiceType
        self.id = id
        self.baseFare = baseFare
        self.description = description
        self.isTransfer = isTransfer
        self.defaultCommissionPercent = defaultCommissionPercent
        self.minCommissionCents = minCommissionCents
        self.maxCommissionCents = maxCommissionCents

    }
}
