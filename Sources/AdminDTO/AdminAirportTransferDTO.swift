//
//  AdminAirportTransferDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya
//  Admin DTOs for managing airport transfers
//

import Vapor
import Foundation

// MARK: - Admin Airport Transfer List Item

/// Summary view for admin transfer queue
public struct AdminAirportTransferDTO: Content {
    public let tripRequestID: UUID
    public let clientName: String
    public let pickupLocation: String
    public let dropoffLocation: String
    public let pickupTime: Date
    public let numberOfPassengers: Int
    public let flightNumber: String?
    public let airlineName: String?
    public let terminalInfo: String?
    public let status: String
    public let assignedDriverName: String?
    public let fixedPriceCents: Int?
    public let isPaid: Bool
    public let createdAt: Date?

    public init(
        tripRequestID: UUID,
        clientName: String,
        pickupLocation: String,
        dropoffLocation: String,
        pickupTime: Date,
        numberOfPassengers: Int,
        flightNumber: String? = nil,
        airlineName: String? = nil,
        terminalInfo: String? = nil,
        status: String,
        assignedDriverName: String? = nil,
        fixedPriceCents: Int? = nil,
        isPaid: Bool = false,
        createdAt: Date? = nil
    ) {
        self.tripRequestID = tripRequestID
        self.clientName = clientName
        self.pickupLocation = pickupLocation
        self.dropoffLocation = dropoffLocation
        self.pickupTime = pickupTime
        self.numberOfPassengers = numberOfPassengers
        self.flightNumber = flightNumber
        self.airlineName = airlineName
        self.terminalInfo = terminalInfo
        self.status = status
        self.assignedDriverName = assignedDriverName
        self.fixedPriceCents = fixedPriceCents
        self.isPaid = isPaid
        self.createdAt = createdAt
    }
}

// MARK: - Available Driver for Assignment

/// Driver option shown in admin's assign-driver dropdown
public struct AvailableDriverForTransferDTO: Content {
    public let driverID: UUID
    public let name: String
    public let phone: String?
    public let vehicleDescription: String?             // "White Toyota Noah - ABC 1234"
    public let rating: Double?
    public let completedTrips: Int
    public let isAvailable: Bool

    public init(
        driverID: UUID,
        name: String,
        phone: String? = nil,
        vehicleDescription: String? = nil,
        rating: Double? = nil,
        completedTrips: Int = 0,
        isAvailable: Bool = true
    ) {
        self.driverID = driverID
        self.name = name
        self.phone = phone
        self.vehicleDescription = vehicleDescription
        self.rating = rating
        self.completedTrips = completedTrips
        self.isAvailable = isAvailable
    }
}

// MARK: - Paginated Admin Airport Transfers

public struct PaginatedAdminAirportTransfersResponse: Content {
    public let transfers: [AdminAirportTransferDTO]
    public let total: Int
    public let page: Int
    public let perPage: Int

    public init(transfers: [AdminAirportTransferDTO], total: Int, page: Int, perPage: Int) {
        self.transfers = transfers
        self.total = total
        self.page = page
        self.perPage = perPage
    }
}
