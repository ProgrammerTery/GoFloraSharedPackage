//
//  DriverAccountStatusDTO.swift
//  GoFloraSharedPackage
//
//  Driver lifecycle status types and activation DTOs shared across services.
//

import Vapor
import Foundation

// MARK: - Driver Account Status

public enum DriverAccountStatus: String, Content, Sendable, CaseIterable {
    case pending          // Signed up, not yet activated
    case active           // Fully active, can accept trips
    case suspended        // Temporarily suspended by admin
    case deactivated      // Deactivated by admin
}

// MARK: - Activation Status DTO

public struct ActivationStatusDTO: Content, Sendable {
    public let isActivated: Bool
    public let depositRequired: Decimal
    public let depositPaidDate: Date?
    public let currentBalance: Decimal?
    public let minimumBalance: Decimal
    public let canAcceptCashTrips: Bool
    public let tier: String
    public let accountStatus: String

    public init(
        isActivated: Bool,
        depositRequired: Decimal,
        depositPaidDate: Date? = nil,
        currentBalance: Decimal? = nil,
        minimumBalance: Decimal,
        canAcceptCashTrips: Bool,
        tier: String,
        accountStatus: String = DriverAccountStatus.pending.rawValue
    ) {
        self.isActivated = isActivated
        self.depositRequired = depositRequired
        self.depositPaidDate = depositPaidDate
        self.currentBalance = currentBalance
        self.minimumBalance = minimumBalance
        self.canAcceptCashTrips = canAcceptCashTrips
        self.tier = tier
        self.accountStatus = accountStatus
    }
}

// MARK: - Deposit DTOs

public struct DepositRequest: Content, Sendable {
    public let mobileNumber: String
    public let provider: String // "ecocash" or "onemoney"

    public init(mobileNumber: String, provider: String) {
        self.mobileNumber = mobileNumber
        self.provider = provider
    }
}

public struct DepositPaymentResponse: Content, Sendable {
    public let success: Bool
    public let message: String
    public let chargeId: String
    public let amount: Decimal
    public let currency: String
    public let status: String
    public let instructions: [String]
    public let pollUrl: String?
    public let estimatedTime: String

    public init(
        success: Bool,
        message: String,
        chargeId: String,
        amount: Decimal,
        currency: String,
        status: String,
        instructions: [String],
        pollUrl: String? = nil,
        estimatedTime: String
    ) {
        self.success = success
        self.message = message
        self.chargeId = chargeId
        self.amount = amount
        self.currency = currency
        self.status = status
        self.instructions = instructions
        self.pollUrl = pollUrl
        self.estimatedTime = estimatedTime
    }
}

public struct DepositInfoDTO: Content, Sendable {
    public let depositRequired: Decimal
    public let currency: String
    public let purpose: String
    public let benefits: [String]
    public let howItWorks: [String]
    public let example: String
    public let refundPolicy: String

    public init(
        depositRequired: Decimal,
        currency: String,
        purpose: String,
        benefits: [String],
        howItWorks: [String],
        example: String,
        refundPolicy: String
    ) {
        self.depositRequired = depositRequired
        self.currency = currency
        self.purpose = purpose
        self.benefits = benefits
        self.howItWorks = howItWorks
        self.example = example
        self.refundPolicy = refundPolicy
    }
}
