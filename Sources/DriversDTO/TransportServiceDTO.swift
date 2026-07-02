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
    /// True if the tier has an active CommissionConfig row (should always be true after auto-create).
    public let commissionConfigured: Bool?
    /// True if the tier's CommissionConfig has min_trip_amount set (transfer price defined).
    /// Only meaningful when isTransfer == true.
    public let transferPriceSet: Bool?

    public init(
        transportServiceType: String,
        id: UUID?,
        baseFare: Double? = nil,
        description: String? = nil,
        isTransfer: Bool = false,
        defaultCommissionPercent: Double? = nil,
        minCommissionCents: Int? = nil,
        maxCommissionCents: Int? = nil,
        commissionConfigured: Bool? = nil,
        transferPriceSet: Bool? = nil
    ) {
        self.transportServiceType = transportServiceType
        self.id = id
        self.baseFare = baseFare
        self.description = description
        self.isTransfer = isTransfer
        self.defaultCommissionPercent = defaultCommissionPercent
        self.minCommissionCents = minCommissionCents
        self.maxCommissionCents = maxCommissionCents
        self.commissionConfigured = commissionConfigured
        self.transferPriceSet = transferPriceSet
    }
}

// MARK: - Transfer Tier (client-facing airport transfer picker)

/// Presented to clients when they're picking an airport-transfer tier.
/// Every entry has a priced fixed fare; unpriced tiers are hidden by the backend.
public struct TransferTierDTO: Content {
    public let serviceTypeId: UUID
    public let name: String
    public let description: String?
    /// Fixed transfer price in cents. Sourced from the tier's active CommissionConfig.minTripAmount.
    public let fixedPriceCents: Int
    public let currency: String  // "USD"

    public init(serviceTypeId: UUID, name: String, description: String? = nil, fixedPriceCents: Int, currency: String = "USD") {
        self.serviceTypeId = serviceTypeId
        self.name = name
        self.description = description
        self.fixedPriceCents = fixedPriceCents
        self.currency = currency
    }
}
