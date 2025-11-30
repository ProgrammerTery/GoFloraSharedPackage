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
    public let baseFare: Double
    public let isTransfer: Bool // Indicates if the service is a transfer type or available for regular trips

    public init(transportServiceType: String, id: UUID?, baseFare: Double, isTransfer: Bool = false) {
        self.transportServiceType = transportServiceType
        self.id = id
        self.baseFare = baseFare
        self.isTransfer = isTransfer

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
    public let title: String
    public let user: ClientDTOResponseModel?

    public init(title: String, user: ClientDTOResponseModel?) {
        self.title = title
        self.user = user
    }
}

public struct LoginContext: Content {
    public let title: String
    public let error: String?
    public let email: String?

    public init(title: String, error: String?, email: String?) {
        self.title = title
        self.error = error
        self.email = email
    }
}

public struct RegisterContext: Content {
    public let title: String
    public let error: String?
    public let success: String?

    public init(title: String, error: String?, success: String?) {
        self.title = title
        self.error = error
        self.success = success
    }
}

public struct DashboardContext: Content {
    public let title: String
    public let user: ClientDTOResponseModel
    public let stats: DashboardStats
    public let recentTrips: [TripRequestDTO]
    public let notifications: [Notification]

    public init(title: String, user: ClientDTOResponseModel, stats: DashboardStats, recentTrips: [TripRequestDTO], notifications: [Notification]) {
        self.title = title
        self.user = user
        self.stats = stats
        self.recentTrips = recentTrips
        self.notifications = notifications
    }
}

public struct TripsContext: Content {
    public let title: String
    public let user: ClientDTOResponseModel
    public let trips: [TripRequestDTO]
    public let stats: TripStats
    public let status: String?
    public let pagination: PaginationContext

    public init(title: String, user: ClientDTOResponseModel, trips: [TripRequestDTO], stats: TripStats, status: String?, pagination: PaginationContext) {
        self.title = title
        self.user = user
        self.trips = trips
        self.stats = stats
        self.status = status
        self.pagination = pagination
    }
}

public struct NewTripContext: Content {
    public let title: String
    public let user: ClientDTOResponseModel
    public let serviceTypes: [TransportServiceDTO]
    public let error: String?

    public init(title: String, user: ClientDTOResponseModel, serviceTypes: [TransportServiceDTO], error: String?) {
        self.title = title
        self.user = user
        self.serviceTypes = serviceTypes
        self.error = error
    }
}

public struct TripDetailContext: Content {
    public let title: String
    public let user: ClientDTOResponseModel
    public let trip: TripRequestDTO
    public let canCancel: Bool

    public init(title: String, user: ClientDTOResponseModel, trip: TripRequestDTO, canCancel: Bool) {
        self.title = title
        self.user = user
        self.trip = trip
        self.canCancel = canCancel
    }
}

public struct TripCancellationResponse: Content {
    public let success: Bool
    public let message: String
    public let cancellationFee: Double?
    public let refundAmount: Double?
    public let cancellationId: UUID?

    public init(success: Bool, message: String, cancellationFee: Double?, refundAmount: Double?, cancellationId: UUID?) {
        self.success = success
        self.message = message
        self.cancellationFee = cancellationFee
        self.refundAmount = refundAmount
        self.cancellationId = cancellationId
    }
}


public struct ServiceTypeAPIResponse: Content {
    public  let id: String
    public  let name: String
    public  let description: String
    public  let baseRate: Double

    public init(id: String, name: String, description: String, baseRate: Double) {
        self.id = id
        self.name = name
        self.description = description
        self.baseRate = baseRate
    }
}
