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
    public let paymentMethodId: UUID
    public let usMethods: [String]
    public let zwMethods: [String]
    public let priority: Int?
    public let isActive: Bool?

    public init(
        paymentMethodId: UUID,
        usMethods: [String] = [],
        zwMethods: [String] = [],
        priority: Int? = nil,
        isActive: Bool? = nil
    ) {
        self.paymentMethodId = paymentMethodId
        self.usMethods = usMethods
        self.zwMethods = zwMethods
        self.priority = priority
        self.isActive = isActive
    }
}

public struct UpdateDriverCustomServiceFeesRequest: Content {
    public let paymentMethodId: UUID?
    public let usMethods: [String]?
    public let zwMethods: [String]?
    public let priority: Int?
    public let isActive: Bool?

    public init(
        paymentMethodId: UUID? = nil,
        usMethods: [String]? = nil,
        zwMethods: [String]? = nil,
        priority: Int? = nil,
        isActive: Bool? = nil
    ) {
        self.paymentMethodId = paymentMethodId
        self.usMethods = usMethods
        self.zwMethods = zwMethods
        self.priority = priority
        self.isActive = isActive
    }
}

// MARK: - Response DTOs

public struct DriverCustomServiceFeesDTO: Content, Sendable {
    public let id: UUID?
    public let driverID: UUID
    public let paymentMethodID: UUID
    public let name: String
    public let description: String?
    public let priority: Int
    public let isActive: Bool
    public let usMethods: [String]
    public let zwMethods: [String]
    public let serviceFeesSharing: Bool
    public let createdAt: Date?
    public let updatedAt: Date?

    public init(id: UUID?, driverID: UUID, paymentMethodId: UUID, name: String, description: String?, priority: Int, isActive: Bool, usMethods: [String], zwMethods: [String], serviceFeesSharing: Bool, createdAt: Date?, updatedAt: Date?) {
        self.id = id
        self.driverID = driverID
        self.paymentMethodID = paymentMethodId
        self.name = name
        self.description = description
        self.priority = priority
        self.isActive = isActive
        self.usMethods = usMethods
        self.zwMethods = zwMethods
        self.serviceFeesSharing = serviceFeesSharing
        self.createdAt = createdAt
        self.updatedAt = updatedAt
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
