import Foundation
import Vapor

// MARK: - Driver Management DTOs

/// Driver list response with pagination
public struct AdminDriverListResponse: Content {
    public let drivers: [AdminDriverDTO]
    public let total: Int
    public let page: Int
    public let perPage: Int
    
    public init(drivers: [AdminDriverDTO], total: Int, page: Int, perPage: Int) {
        self.drivers = drivers
        self.total = total
        self.page = page
        self.perPage = perPage
    }
}

/// Driver detail DTO for admin view
public struct AdminDriverDTO: Content {
    public let id: UUID?
    public let name: String
    public let email: String
    public let mobileNumber: String?
    public let isActive: Bool
    public let isSuspended: Bool
    public let suspensionReason: String?
    public let activationDepositPaid: Bool
    public let activationDepositDate: Date?
    public let tier: String?
    public let walletBalance: Double?
    public let reservedBalance: Double?
    public let minimumBalance: Double?
    public let totalTrips: Int?
    public let completedTrips: Int?
    public let cancelledTrips: Int?
    public let rating: Double?
    public let totalEarnings: Double?
    public let createdAt: Date?
    public let vehicle: VehicleInfoDTO?
    public let subscriptionStatus: String?
    
    public init(
        id: UUID? = nil,
        name: String,
        email: String,
        mobileNumber: String? = nil,
        isActive: Bool = true,
        isSuspended: Bool = false,
        suspensionReason: String? = nil,
        activationDepositPaid: Bool = false,
        activationDepositDate: Date? = nil,
        tier: String? = nil,
        walletBalance: Double? = nil,
        reservedBalance: Double? = nil,
        minimumBalance: Double? = nil,
        totalTrips: Int? = nil,
        completedTrips: Int? = nil,
        cancelledTrips: Int? = nil,
        rating: Double? = nil,
        totalEarnings: Double? = nil,
        createdAt: Date? = nil,
        vehicle: VehicleInfoDTO? = nil,
        subscriptionStatus: String? = nil
    ) {
        self.id = id
        self.name = name
        self.email = email
        self.mobileNumber = mobileNumber
        self.isActive = isActive
        self.isSuspended = isSuspended
        self.suspensionReason = suspensionReason
        self.activationDepositPaid = activationDepositPaid
        self.activationDepositDate = activationDepositDate
        self.tier = tier
        self.walletBalance = walletBalance
        self.reservedBalance = reservedBalance
        self.minimumBalance = minimumBalance
        self.totalTrips = totalTrips
        self.completedTrips = completedTrips
        self.cancelledTrips = cancelledTrips
        self.rating = rating
        self.totalEarnings = totalEarnings
        self.createdAt = createdAt
        self.vehicle = vehicle
        self.subscriptionStatus = subscriptionStatus
    }
}

/// Vehicle information DTO
public struct VehicleInfoDTO: Content {
    public let make: String?
    public let model: String?
    public let year: Int?
    public let licensePlate: String?
    public let color: String?
    
    public init(make: String? = nil, model: String? = nil, year: Int? = nil, licensePlate: String? = nil, color: String? = nil) {
        self.make = make
        self.model = model
        self.year = year
        self.licensePlate = licensePlate
        self.color = color
    }
}

/// Account action request (activate/deactivate/suspend)
public struct AdminAccountActionRequest: Content {
    public let reason: String
    public let duration: Int? // For suspension duration in days
    
    public init(reason: String, duration: Int? = nil) {
        self.reason = reason
        self.duration = duration
    }
}

/// Wallet adjustment request
public struct WalletAdjustmentRequest: Content {
    public let type: String // "credit" or "debit"
    public let amountCents: Int
    public let currency: String
    public let reason: String
    
    public init(type: String, amountCents: Int, currency: String, reason: String) {
        self.type = type
        self.amountCents = amountCents
        self.currency = currency
        self.reason = reason
    }
}

/// Wallet details response
public struct AdminWalletResponse: Content {
    public let driverId: UUID
    public let driverName: String
    public let availableBalance: Double
    public let reservedBalance: Double
    public let totalBalance: Double
    public let minimumBalance: Double
    public let currency: String
    public let transactions: [WalletTransactionDTO]
    public let lastUpdated: Date
    
    public init(
        driverId: UUID,
        driverName: String,
        availableBalance: Double,
        reservedBalance: Double,
        totalBalance: Double,
        minimumBalance: Double,
        currency: String,
        transactions: [WalletTransactionDTO],
        lastUpdated: Date
    ) {
        self.driverId = driverId
        self.driverName = driverName
        self.availableBalance = availableBalance
        self.reservedBalance = reservedBalance
        self.totalBalance = totalBalance
        self.minimumBalance = minimumBalance
        self.currency = currency
        self.transactions = transactions
        self.lastUpdated = lastUpdated
    }
}

/// Wallet transaction DTO
public struct WalletTransactionDTO: Content {
    public let id: UUID
    public let type: String
    public let amount: Double
    public let balanceBefore: Double
    public let balanceAfter: Double
    public let reason: String
    public let createdAt: Date
    
    public init(
        id: UUID,
        type: String,
        amount: Double,
        balanceBefore: Double,
        balanceAfter: Double,
        reason: String,
        createdAt: Date
    ) {
        self.id = id
        self.type = type
        self.amount = amount
        self.balanceBefore = balanceBefore
        self.balanceAfter = balanceAfter
        self.reason = reason
        self.createdAt = createdAt
    }
}

// MARK: - Client Management DTOs

/// Client list response
public struct AdminClientListResponse: Content {
    public let clients: [AdminClientDTO]
    public let total: Int
    public let page: Int
    public let perPage: Int
    
    public init(clients: [AdminClientDTO], total: Int, page: Int, perPage: Int) {
        self.clients = clients
        self.total = total
        self.page = page
        self.perPage = perPage
    }
}

/// Client detail DTO for admin view
public struct AdminClientDTO: Content {
    public let id: UUID?
    public let name: String
    public let email: String
    public let mobileNumber: String?
    public let isActive: Bool
    public let totalTrips: Int?
    public let rating: Double?
    public let createdAt: Date?
    
    public init(
        id: UUID? = nil,
        name: String,
        email: String,
        mobileNumber: String? = nil,
        isActive: Bool = true,
        totalTrips: Int? = nil,
        rating: Double? = nil,
        createdAt: Date? = nil
    ) {
        self.id = id
        self.name = name
        self.email = email
        self.mobileNumber = mobileNumber
        self.isActive = isActive
        self.totalTrips = totalTrips
        self.rating = rating
        self.createdAt = createdAt
    }
}
