//
//  DriverCustomServiceFeesDTO.swift
//  GoFloraTranposportService
//
//  Created by Terence Changadeya on 27/11/2025.
//

import Vapor
import Foundation

// MARK: - Request DTOs

public struct CreateDriverCustomServiceFeesRequest: Content {
    public let driverId: UUID
    public let paymentMethodId: UUID
    public let methodType: String
    public let currency: String
    public let feeAmount: Double
    public let priority: Int?
    public let isActive: Bool?

    public init(driverId: UUID, paymentMethodId: UUID, methodType: String, currency: String, feeAmount: Double, priority: Int? = nil, isActive: Bool? = nil) {
        self.driverId = driverId
        self.paymentMethodId = paymentMethodId
        self.methodType = methodType
        self.currency = currency
        self.feeAmount = feeAmount
        self.priority = priority
        self.isActive = isActive
    }
}

public struct UpdateDriverCustomServiceFeesRequest: Content {
    public let methodType: String?
    public let currency: String?
    public let feeAmount: Double?
    public let priority: Int?
    public let isActive: Bool?

    public init(methodType: String? = nil, currency: String? = nil, feeAmount: Double? = nil, priority: Int? = nil, isActive: Bool? = nil) {
        self.methodType = methodType
        self.currency = currency
        self.feeAmount = feeAmount
        self.priority = priority
        self.isActive = isActive
    }
}

// MARK: - Response DTOs

public struct DriverCustomServiceFeesDTO: Content {
    public let id: UUID?
    public let driverId: UUID
    public let paymentMethodId: UUID
    public let methodType: String
    public let currency: String
    public let feeAmount: Double
    public let priority: Int
    public let isActive: Bool
    public let createdAt: Date?
    public let updatedAt: Date?

    // Payment method details (when eager loaded)
    public let paymentMethodName: String?
    public let paymentMethodDescription: String?

    // Driver details (when eager loaded)
    public let driverName: String?
    public let driverEmail: String?

    public init(id: UUID?, driverId: UUID, paymentMethodId: UUID, methodType: String, currency: String, feeAmount: Double, priority: Int, isActive: Bool, createdAt: Date?, updatedAt: Date?, paymentMethodName: String?, paymentMethodDescription: String?, driverName: String?, driverEmail: String?) {
        self.id = id
        self.driverId = driverId
        self.paymentMethodId = paymentMethodId
        self.methodType = methodType
        self.currency = currency
        self.feeAmount = feeAmount
        self.priority = priority
        self.isActive = isActive
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.paymentMethodName = paymentMethodName
        self.paymentMethodDescription = paymentMethodDescription
        self.driverName = driverName
        self.driverEmail = driverEmail
    }
}

public struct DriverCustomServiceFeesListResponse: Content {
    public let serviceFees: [DriverCustomServiceFeesDTO]
    public let total: Int
    public let page: Int
    public let perPage: Int

    public init(serviceFees: [DriverCustomServiceFeesDTO], total: Int, page: Int, perPage: Int) {
        self.serviceFees = serviceFees
        self.total = total
        self.page = page
        self.perPage = perPage
    }
}
