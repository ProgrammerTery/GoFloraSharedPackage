//
//  SharedModels.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya
//

import Vapor
import Foundation
import ClientDTO
import TripDTO

// MARK: - Transport Service

public struct TransportServiceDTO: Content {
    public let transportServiceType: String
    public let id: UUID?
    
    public init(transportServiceType: String, id: UUID?) {
        self.transportServiceType = transportServiceType
        self.id = id
    }
}

// MARK: - Status & Statistics

public struct StatusCount: Content {
    public let status: String?
    public let count: Int
    
    public init(status: String?, count: Int) {
        self.status = status
        self.count = count
    }
}

public struct DashboardStats: Content {
    public let totalTrips: Int
    public let pendingTrips: Int
    public let completedTrips: Int
    public let totalSpent: Double
    
    public init(totalTrips: Int, pendingTrips: Int, completedTrips: Int, totalSpent: Double) {
        self.totalTrips = totalTrips
        self.pendingTrips = pendingTrips
        self.completedTrips = completedTrips
        self.totalSpent = totalSpent
    }
}

public struct TripStats: Content {
    public let total: Int
    public let pending: Int
    public let completed: Int
    
    public init(total: Int, pending: Int, completed: Int) {
        self.total = total
        self.pending = pending
        self.completed = completed
    }
}

// MARK: - Pagination

public struct PaginationContext: Content {
    public let current: Int
    public let total: Int
    public let hasPrevious: Bool
    public let hasNext: Bool
    public let previous: Int
    public let next: Int
    
    public init(current: Int, total: Int, hasPrevious: Bool, hasNext: Bool, previous: Int, next: Int) {
        self.current = current
        self.total = total
        self.hasPrevious = hasPrevious
        self.hasNext = hasNext
        self.previous = previous
        self.next = next
    }
}

// MARK: - Notifications

public struct Notification: Content {
    public let id: UUID
    public let message: String
    public let createdAt: Date
    
    public init(id: UUID, message: String, createdAt: Date) {
        self.id = id
        self.message = message
        self.createdAt = createdAt
    }
}

// MARK: - 
public struct IndexContext: Content {
    let title: String
    let user: ClientDTOResponseModel?
}

public struct LoginContext: Content {
    let title: String
    let error: String?
    let email: String?
}

public struct RegisterContext: Content {
    let title: String
    let error: String?
    let success: String?
}

public struct DashboardContext: Content {
    let title: String
    let user: ClientDTOResponseModel
    let stats: DashboardStats
    let recentTrips: [TripRequestDTO]
    let notifications: [Notification]
}

public struct TripsContext: Content {
    let title: String
    let user: ClientDTOResponseModel
    let trips: [TripRequestDTO]
    let stats: TripStats
    let status: String?
    let pagination: PaginationContext
}

public struct NewTripContext: Content {
    let title: String
    let user: ClientDTOResponseModel
    let serviceTypes: [TransportServiceDTO]
    let error: String?
}

public struct TripDetailContext: Content {
    let title: String
    let user: ClientDTOResponseModel
    let trip: TripRequestDTO
    let canCancel: Bool
}

public struct TripCancellationResponse: Content {
    let success: Bool
    let message: String
    let cancellationFee: Double?
    let refundAmount: Double?
    let cancellationId: UUID?
}
