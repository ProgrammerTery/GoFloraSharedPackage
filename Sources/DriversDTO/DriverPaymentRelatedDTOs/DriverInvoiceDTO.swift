//
//  DriverInvoiceDTO.swift
//  GoFloraTranposportService
//
//  Created by Terence Changadeya on 27/11/2025.
//

import Vapor
import Foundation

// MARK: - Request DTOs

public struct CreateDriverInvoiceRequest: Content {
    public let driverCustomFeesId: UUID
    public let tripId: UUID
    public let method: String
    public let currency: String
    public let baseFare: Double
    public let driverServiceFee: Double
    public let platformFee: Double
    public let amount: Double
    public let status: String
    public let paidAt: Date?

    public init(driverCustomFeesId: UUID, tripId: UUID, method: String, currency: String, baseFare: Double, driverServiceFee: Double, platformFee: Double, amount: Double, status: String, paidAt: Date? = nil) {
        self.driverCustomFeesId = driverCustomFeesId
        self.tripId = tripId
        self.method = method
        self.currency = currency
        self.baseFare = baseFare
        self.driverServiceFee = driverServiceFee
        self.platformFee = platformFee
        self.amount = amount
        self.status = status
        self.paidAt = paidAt
    }
}

public struct UpdateDriverInvoiceRequest: Content {
    public let method: String?
    public let currency: String?
    public let baseFare: Double?
    public let driverServiceFee: Double?
    public let platformFee: Double?
    public let amount: Double?
    public let status: String?
    public let paidAt: Date?

    public init(method: String? = nil, currency: String? = nil, baseFare: Double? = nil, driverServiceFee: Double? = nil, platformFee: Double? = nil, amount: Double? = nil, status: String? = nil, paidAt: Date? = nil) {
        self.method = method
        self.currency = currency
        self.baseFare = baseFare
        self.driverServiceFee = driverServiceFee
        self.platformFee = platformFee
        self.amount = amount
        self.status = status
        self.paidAt = paidAt
    }
}

public struct MarkInvoicePaidRequest: Content {
    public let paidAt: Date?

    public init(paidAt: Date? = nil) {
        self.paidAt = paidAt
    }
}

// MARK: - Response DTOs

public struct DriverInvoiceDTO: Content {
    public let id: UUID?
    public let driverCustomFeesId: UUID
    public let tripId: UUID
    public let method: String
    public let currency: String
    public let baseFare: Double
    public let driverServiceFee: Double
    public let platformFee: Double
    public let amount: Double
    public let status: String
    public let paidAt: Date?
    public let createdAt: Date?
    public let updatedAt: Date?

    // Related data (when eager loaded)
    public let tripPickupLocation: String?
    public let tripDropoffLocation: String?
    public let tripStatus: String?
    public let driverName: String?
    public let methodType: String?
    public let feeAmount: Double?

    public init(id: UUID?, driverCustomFeesId: UUID, tripId: UUID, method: String, currency: String, baseFare: Double, driverServiceFee: Double, platformFee: Double, amount: Double, status: String, paidAt: Date?, createdAt: Date?, updatedAt: Date?, tripPickupLocation: String?, tripDropoffLocation: String?, tripStatus: String?, driverName: String?, methodType: String?, feeAmount: Double?) {
        self.id = id
        self.driverCustomFeesId = driverCustomFeesId
        self.tripId = tripId
        self.method = method
        self.currency = currency
        self.baseFare = baseFare
        self.driverServiceFee = driverServiceFee
        self.platformFee = platformFee
        self.amount = amount
        self.status = status
        self.paidAt = paidAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.tripPickupLocation = tripPickupLocation
        self.tripDropoffLocation = tripDropoffLocation
        self.tripStatus = tripStatus
        self.driverName = driverName
        self.methodType = methodType
        self.feeAmount = feeAmount
    }
}

public struct DriverInvoiceListResponse: Content {
    public let invoices: [DriverInvoiceDTO]
    public let total: Int
    public let page: Int
    public let perPage: Int
    public let totalAmount: Double
    public let paidAmount: Double
    public let pendingAmount: Double

    public init(invoices: [DriverInvoiceDTO], total: Int, page: Int, perPage: Int, totalAmount: Double, paidAmount: Double, pendingAmount: Double) {
        self.invoices = invoices
        self.total = total
        self.page = page
        self.perPage = perPage
        self.totalAmount = totalAmount
        self.paidAmount = paidAmount
        self.pendingAmount = pendingAmount
    }
}
public struct DriverInvoiceStatsDTO: Content {
    public let totalInvoices: Int
    public let paidInvoices: Int
    public let pendingInvoices: Int
    public let totalAmount: Double
    public let paidAmount: Double
    public let pendingAmount: Double
    public let averageInvoiceAmount: Double

    public init(totalInvoices: Int, paidInvoices: Int, pendingInvoices: Int, totalAmount: Double, paidAmount: Double, pendingAmount: Double, averageInvoiceAmount: Double) {
        self.totalInvoices = totalInvoices
        self.paidInvoices = paidInvoices
        self.pendingInvoices = pendingInvoices
        self.totalAmount = totalAmount
        self.paidAmount = paidAmount
        self.pendingAmount = pendingAmount
        self.averageInvoiceAmount = averageInvoiceAmount
    }
}
