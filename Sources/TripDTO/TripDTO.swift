//
//  TripDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya
//

import Vapor
import Foundation

/// Client's declared payment intent when creating a trip request.
/// - `any`: any accepted method, cash offered only if the assigned driver is activation-paid.
/// - `cash`: only reach activation-paid drivers; only cash offered at payment time.
/// - `online`: exclude cash regardless of driver activation status.
public enum PaymentMethodPreference: String, Content, CaseIterable {
    case any
    case cash
    case online
}

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

    // Airport Transfer fields
    public let isAirportTransfer: Bool?
    public let flightNumber: String?
    public let airlineName: String?
    public let terminalInfo: String?
    public let fixedPriceCents: Int?
    public let isPrepaid: Bool?
    public let assignmentMode: String?  // "admin_assign" | "broadcast"

    // Payment method preference (client declares at trip creation)
    public let paymentMethodPreference: String?  // "any" | "cash" | "online"

    public init(id: UUID?, clientName: String, pickupLocation: String, pickupLatitude: Double?, pickupLongitude: Double?, dropoffLocation: String, dropoffLatitude: Double?, dropoffLongitude: Double?, pickupTime: Date, numberOfPassengers: Int, specialInstructions: String?, estimatedDistance: Double?, estimatedDuration: Int?, status: String?, driver_id: UUID?, client_id: UUID?, isAirportTransfer: Bool? = nil, flightNumber: String? = nil, airlineName: String? = nil, terminalInfo: String? = nil, fixedPriceCents: Int? = nil, isPrepaid: Bool? = nil, assignmentMode: String? = nil, paymentMethodPreference: String? = nil) {
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
        self.isAirportTransfer = isAirportTransfer
        self.flightNumber = flightNumber
        self.airlineName = airlineName
        self.terminalInfo = terminalInfo
        self.fixedPriceCents = fixedPriceCents
        self.isPrepaid = isPrepaid
        self.assignmentMode = assignmentMode
        self.paymentMethodPreference = paymentMethodPreference
    }
}

public struct TripRequestCreateDTO: Content {
    public let clientName: String
    public let pickupLocation: String
    public let pickupLatitude: Double?
    public let pickupLongitude: Double?
    public let pickupLocationID: UUID?  // ID of selected popular location or zone
    public let pickupLocationType: String?  // "popular", "zone", or "manual"
    public let dropoffLocation: String
    public let dropoffLatitude: Double?
    public let dropoffLongitude: Double?
    public let dropoffLocationID: UUID?
    public let dropoffLocationType: String?
    public let pickupTime: Date
    public let numberOfPassengers: Int
    public let specialInstructions: String?
    public let promoCode: String?

    // Airport Transfer fields
    public let isAirportTransfer: Bool?
    public let flightNumber: String?
    public let airlineName: String?
    public let terminalInfo: String?

    // Payment method preference — nil is treated as .any server-side
    public let paymentMethodPreference: PaymentMethodPreference?

    public init(clientName: String, pickupLocation: String, pickupLatitude: Double?, pickupLongitude: Double?, pickupLocationID: UUID? = nil, pickupLocationType: String? = nil, dropoffLocation: String, dropoffLatitude: Double?, dropoffLongitude: Double?, dropoffLocationID: UUID? = nil, dropoffLocationType: String? = nil, pickupTime: Date, numberOfPassengers: Int, specialInstructions: String?, promoCode: String? = nil, isAirportTransfer: Bool? = nil, flightNumber: String? = nil, airlineName: String? = nil, terminalInfo: String? = nil, paymentMethodPreference: PaymentMethodPreference? = nil) {
        self.clientName = clientName
        self.pickupLocation = pickupLocation
        self.pickupLatitude = pickupLatitude
        self.pickupLongitude = pickupLongitude
        self.pickupLocationID = pickupLocationID
        self.pickupLocationType = pickupLocationType
        self.dropoffLocation = dropoffLocation
        self.dropoffLatitude = dropoffLatitude
        self.dropoffLongitude = dropoffLongitude
        self.dropoffLocationID = dropoffLocationID
        self.dropoffLocationType = dropoffLocationType
        self.pickupTime = pickupTime
        self.numberOfPassengers = numberOfPassengers
        self.specialInstructions = specialInstructions
        self.promoCode = promoCode
        self.isAirportTransfer = isAirportTransfer
        self.flightNumber = flightNumber
        self.airlineName = airlineName
        self.terminalInfo = terminalInfo
        self.paymentMethodPreference = paymentMethodPreference
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


// MARK: - Paginated Response DTOs

public struct PaginatedTripsResponse: Content {
    public let trips: [TripRequestDTO]
    public let total: Int
    public let page: Int
    public let perPage: Int

    public init(trips: [TripRequestDTO], total: Int, page: Int, perPage: Int) {
        self.trips = trips
        self.total = total
        self.page = page
        self.perPage = perPage
    }
}

public struct PaginatedAssignedTripsResponse: Content {
    public let trips: [TripRequestDTO]
    public let total: Int
    public let page: Int
    public let perPage: Int

    public init(trips: [TripRequestDTO], total: Int, page: Int, perPage: Int) {
        self.trips = trips
        self.total = total
        self.page = page
        self.perPage = perPage
    }
}
