//
//  AirportTransferDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya
//  Airport Transfer feature DTOs
//

import Vapor
import Foundation

// MARK: - Assignment Mode

/// How a driver gets assigned to an airport transfer
public enum TransferAssignmentMode: String, Codable, Sendable {
    case adminAssign = "admin_assign"
    case broadcast = "broadcast"
}

// MARK: - Airport Transfer Details (Response)

/// Full airport transfer details returned to clients and admin
public struct AirportTransferDetailsDTO: Content {
    public let tripRequestID: UUID
    public let flightNumber: String?
    public let airlineName: String?
    public let terminalInfo: String?
    public let assignmentMode: TransferAssignmentMode?
    public let fixedPriceCents: Int
    public let fixedPriceCurrency: String              // "usd"
    public let isPaid: Bool
    public let paymentReference: String?
    public let checkoutSessionId: String?

    // Assigned driver info (visible to client after assignment)
    public let assignedDriverID: UUID?
    public let assignedDriverName: String?
    public let assignedDriverPhone: String?
    public let assignedVehicleDescription: String?     // e.g., "White Toyota Noah - ABC 1234"

    // Trip context
    public let pickupLocation: String
    public let dropoffLocation: String
    public let pickupTime: Date
    public let numberOfPassengers: Int
    public let status: String

    public init(
        tripRequestID: UUID,
        flightNumber: String? = nil,
        airlineName: String? = nil,
        terminalInfo: String? = nil,
        assignmentMode: TransferAssignmentMode? = nil,
        fixedPriceCents: Int,
        fixedPriceCurrency: String = "usd",
        isPaid: Bool = false,
        paymentReference: String? = nil,
        checkoutSessionId: String? = nil,
        assignedDriverID: UUID? = nil,
        assignedDriverName: String? = nil,
        assignedDriverPhone: String? = nil,
        assignedVehicleDescription: String? = nil,
        pickupLocation: String,
        dropoffLocation: String,
        pickupTime: Date,
        numberOfPassengers: Int,
        status: String
    ) {
        self.tripRequestID = tripRequestID
        self.flightNumber = flightNumber
        self.airlineName = airlineName
        self.terminalInfo = terminalInfo
        self.assignmentMode = assignmentMode
        self.fixedPriceCents = fixedPriceCents
        self.fixedPriceCurrency = fixedPriceCurrency
        self.isPaid = isPaid
        self.paymentReference = paymentReference
        self.checkoutSessionId = checkoutSessionId
        self.assignedDriverID = assignedDriverID
        self.assignedDriverName = assignedDriverName
        self.assignedDriverPhone = assignedDriverPhone
        self.assignedVehicleDescription = assignedVehicleDescription
        self.pickupLocation = pickupLocation
        self.dropoffLocation = dropoffLocation
        self.pickupTime = pickupTime
        self.numberOfPassengers = numberOfPassengers
        self.status = status
    }
}

// MARK: - Admin: Assign Driver Request

/// Admin assigns a specific driver to an airport transfer
public struct AssignDriverToTransferRequest: Content {
    public let driverID: UUID
    public let fixedPriceCents: Int?                   // Override price if needed

    public init(driverID: UUID, fixedPriceCents: Int? = nil) {
        self.driverID = driverID
        self.fixedPriceCents = fixedPriceCents
    }
}

/// Admin self-assigns (admin is the driver)
public struct SelfAssignTransferRequest: Content {
    public let adminDriverProfileID: UUID              // Admin's driver profile ID
    public let fixedPriceCents: Int?

    public init(adminDriverProfileID: UUID, fixedPriceCents: Int? = nil) {
        self.adminDriverProfileID = adminDriverProfileID
        self.fixedPriceCents = fixedPriceCents
    }
}

// MARK: - Admin: Set Price

/// Admin sets or overrides the fixed price for an airport transfer
public struct SetTransferPriceRequest: Content {
    public let fixedPriceCents: Int                    // Amount in cents (USD)

    public init(fixedPriceCents: Int) {
        self.fixedPriceCents = fixedPriceCents
    }
}

// MARK: - Checkout (Upfront Payment)

/// Request to initiate a Payonify checkout session for upfront payment
public struct InitiateTransferCheckoutRequest: Content {
    public let tripId: UUID
    public let customerEmail: String
    public let successUrl: String                      // Where to redirect after payment
    public let cancelUrl: String                       // Where to redirect if cancelled

    public init(tripId: UUID, customerEmail: String, successUrl: String, cancelUrl: String) {
        self.tripId = tripId
        self.customerEmail = customerEmail
        self.successUrl = successUrl
        self.cancelUrl = cancelUrl
    }
}

/// Response after initiating checkout — contains the redirect URL
public struct TransferCheckoutResponse: Content {
    public let checkoutUrl: String                     // Redirect client to Payonify checkout
    public let checkoutSessionId: String
    public let expiresAt: Date?

    public init(checkoutUrl: String, checkoutSessionId: String, expiresAt: Date? = nil) {
        self.checkoutUrl = checkoutUrl
        self.checkoutSessionId = checkoutSessionId
        self.expiresAt = expiresAt
    }
}

/// Verify checkout payment status
public struct VerifyTransferCheckoutRequest: Content {
    public let checkoutSessionId: String

    public init(checkoutSessionId: String) {
        self.checkoutSessionId = checkoutSessionId
    }
}

/// Result of checkout verification
public struct TransferCheckoutStatusDTO: Content {
    public let isPaid: Bool
    public let paymentStatus: String                   // "paid", "unpaid", "expired"
    public let amountPaidCents: Int?
    public let currency: String?
    public let paymentReference: String?

    public init(isPaid: Bool, paymentStatus: String, amountPaidCents: Int? = nil, currency: String? = nil, paymentReference: String? = nil) {
        self.isPaid = isPaid
        self.paymentStatus = paymentStatus
        self.amountPaidCents = amountPaidCents
        self.currency = currency
        self.paymentReference = paymentReference
    }
}

// MARK: - Broadcast (Premium Feature)

/// Broadcast an airport transfer to available drivers (first-come-first-served)
public struct BroadcastTransferRequest: Content {
    public let fixedPriceCents: Int                    // Drivers see the fixed price
    public let maxAcceptTimeMinutes: Int?              // How long drivers have to accept (default: 30)

    public init(fixedPriceCents: Int, maxAcceptTimeMinutes: Int? = nil) {
        self.fixedPriceCents = fixedPriceCents
        self.maxAcceptTimeMinutes = maxAcceptTimeMinutes
    }
}

/// Driver accepts a broadcast airport transfer
public struct AcceptBroadcastTransferRequest: Content {
    public let driverID: UUID

    public init(driverID: UUID) {
        self.driverID = driverID
    }
}

// MARK: - Paginated Airport Transfers

public struct PaginatedAirportTransfersResponse: Content {
    public let transfers: [AirportTransferDetailsDTO]
    public let total: Int
    public let page: Int
    public let perPage: Int

    public init(transfers: [AirportTransferDetailsDTO], total: Int, page: Int, perPage: Int) {
        self.transfers = transfers
        self.total = total
        self.page = page
        self.perPage = perPage
    }
}
