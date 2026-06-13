import Foundation
import Vapor

// MARK: - Revenue Record DTOs

/// Revenue record DTO
public struct RevenueRecordDTO: Content {
    public let id: UUID?
    public let tripId: UUID
    public let driverId: UUID
    public let clientId: UUID
    public let promoCodeId: UUID?
    public let bidAmount: Double
    public let promoDiscount: Double
    public let finalFare: Double
    public let commissionConfigId: UUID?
    public let commissionAmount: Double
    public let driverEarnings: Double
    public let paymentMethod: String
    public let recordedAt: Date?
    
    public init(
        id: UUID? = nil,
        tripId: UUID,
        driverId: UUID,
        clientId: UUID,
        promoCodeId: UUID? = nil,
        bidAmount: Double,
        promoDiscount: Double = 0.0,
        finalFare: Double,
        commissionConfigId: UUID? = nil,
        commissionAmount: Double,
        driverEarnings: Double,
        paymentMethod: String,
        recordedAt: Date? = nil
    ) {
        self.id = id
        self.tripId = tripId
        self.driverId = driverId
        self.clientId = clientId
        self.promoCodeId = promoCodeId
        self.bidAmount = bidAmount
        self.promoDiscount = promoDiscount
        self.finalFare = finalFare
        self.commissionConfigId = commissionConfigId
        self.commissionAmount = commissionAmount
        self.driverEarnings = driverEarnings
        self.paymentMethod = paymentMethod
        self.recordedAt = recordedAt
    }
}

/// Create revenue record request
public struct CreateRevenueRecordRequest: Content {
    public let tripId: UUID
    public let driverId: UUID
    public let clientId: UUID
    public let promoCodeId: UUID?
    public let bidAmount: Double
    public let promoDiscount: Double
    public let finalFare: Double
    public let commissionConfigId: UUID?
    public let commissionAmount: Double
    public let driverEarnings: Double
    public let paymentMethod: String
    
    public init(
        tripId: UUID,
        driverId: UUID,
        clientId: UUID,
        promoCodeId: UUID? = nil,
        bidAmount: Double,
        promoDiscount: Double = 0.0,
        finalFare: Double,
        commissionConfigId: UUID? = nil,
        commissionAmount: Double,
        driverEarnings: Double,
        paymentMethod: String
    ) {
        self.tripId = tripId
        self.driverId = driverId
        self.clientId = clientId
        self.promoCodeId = promoCodeId
        self.bidAmount = bidAmount
        self.promoDiscount = promoDiscount
        self.finalFare = finalFare
        self.commissionConfigId = commissionConfigId
        self.commissionAmount = commissionAmount
        self.driverEarnings = driverEarnings
        self.paymentMethod = paymentMethod
    }
}

/// Update revenue record request
public struct UpdateRevenueRecordRequest: Content {
    public let promoCodeId: UUID?
    public let bidAmount: Double?
    public let promoDiscount: Double?
    public let finalFare: Double?
    public let commissionConfigId: UUID?
    public let commissionAmount: Double?
    public let driverEarnings: Double?
    public let paymentMethod: String?
    
    public init(
        promoCodeId: UUID? = nil,
        bidAmount: Double? = nil,
        promoDiscount: Double? = nil,
        finalFare: Double? = nil,
        commissionConfigId: UUID? = nil,
        commissionAmount: Double? = nil,
        driverEarnings: Double? = nil,
        paymentMethod: String? = nil
    ) {
        self.promoCodeId = promoCodeId
        self.bidAmount = bidAmount
        self.promoDiscount = promoDiscount
        self.finalFare = finalFare
        self.commissionConfigId = commissionConfigId
        self.commissionAmount = commissionAmount
        self.driverEarnings = driverEarnings
        self.paymentMethod = paymentMethod
    }
}

/// Revenue record list response
public struct RevenueRecordListResponse: Content {
    public let records: [RevenueRecordDTO]
    public let total: Int
    public let page: Int
    public let perPage: Int
    
    public init(records: [RevenueRecordDTO], total: Int, page: Int, perPage: Int) {
        self.records = records
        self.total = total
        self.page = page
        self.perPage = perPage
    }
}

/// Revenue record query filters
public struct RevenueRecordQueryFilters: Content {
    public let tripId: UUID?
    public let driverId: UUID?
    public let clientId: UUID?
    public let promoCodeId: UUID?
    public let commissionConfigId: UUID?
    public let paymentMethod: String?
    public let recordedAfter: Date?
    public let recordedBefore: Date?
    public let minFinalFare: Double?
    public let maxFinalFare: Double?
    public let minCommissionAmount: Double?
    public let maxCommissionAmount: Double?
    public let hasPromoDiscount: Bool?
    public let page: Int?
    public let perPage: Int?
    
    public init(
        tripId: UUID? = nil,
        driverId: UUID? = nil,
        clientId: UUID? = nil,
        promoCodeId: UUID? = nil,
        commissionConfigId: UUID? = nil,
        paymentMethod: String? = nil,
        recordedAfter: Date? = nil,
        recordedBefore: Date? = nil,
        minFinalFare: Double? = nil,
        maxFinalFare: Double? = nil,
        minCommissionAmount: Double? = nil,
        maxCommissionAmount: Double? = nil,
        hasPromoDiscount: Bool? = nil,
        page: Int? = nil,
        perPage: Int? = nil
    ) {
        self.tripId = tripId
        self.driverId = driverId
        self.clientId = clientId
        self.promoCodeId = promoCodeId
        self.commissionConfigId = commissionConfigId
        self.paymentMethod = paymentMethod
        self.recordedAfter = recordedAfter
        self.recordedBefore = recordedBefore
        self.minFinalFare = minFinalFare
        self.maxFinalFare = maxFinalFare
        self.minCommissionAmount = minCommissionAmount
        self.maxCommissionAmount = maxCommissionAmount
        self.hasPromoDiscount = hasPromoDiscount
        self.page = page
        self.perPage = perPage
    }
}

/// Revenue statistics DTO
public struct RevenueStatsDTO: Content {
    public let totalRevenue: Double
    public let totalCommission: Double
    public let totalDriverEarnings: Double
    public let totalPromoDiscounts: Double
    public let totalTrips: Int
    public let averageFare: Double
    public let averageCommission: Double
    public let revenueByPaymentMethod: [String: Double]
    public let revenueByDate: [String: Double] // ISO date string: revenue
    
    public init(
        totalRevenue: Double,
        totalCommission: Double,
        totalDriverEarnings: Double,
        totalPromoDiscounts: Double,
        totalTrips: Int,
        averageFare: Double,
        averageCommission: Double,
        revenueByPaymentMethod: [String: Double],
        revenueByDate: [String: Double]
    ) {
        self.totalRevenue = totalRevenue
        self.totalCommission = totalCommission
        self.totalDriverEarnings = totalDriverEarnings
        self.totalPromoDiscounts = totalPromoDiscounts
        self.totalTrips = totalTrips
        self.averageFare = averageFare
        self.averageCommission = averageCommission
        self.revenueByPaymentMethod = revenueByPaymentMethod
        self.revenueByDate = revenueByDate
    }
}

/// Driver revenue summary DTO
public struct DriverRevenueSummaryDTO: Content {
    public let driverId: UUID
    public let totalEarnings: Double
    public let totalTrips: Int
    public let averageEarningsPerTrip: Double
    public let totalCommissionPaid: Double
    public let recentRecords: [RevenueRecordDTO]
    
    public init(
        driverId: UUID,
        totalEarnings: Double,
        totalTrips: Int,
        averageEarningsPerTrip: Double,
        totalCommissionPaid: Double,
        recentRecords: [RevenueRecordDTO]
    ) {
        self.driverId = driverId
        self.totalEarnings = totalEarnings
        self.totalTrips = totalTrips
        self.averageEarningsPerTrip = averageEarningsPerTrip
        self.totalCommissionPaid = totalCommissionPaid
        self.recentRecords = recentRecords
    }
}

/// Client spending summary DTO
public struct ClientSpendingSummaryDTO: Content {
    public let clientId: UUID
    public let totalSpent: Double
    public let totalTrips: Int
    public let averageSpentPerTrip: Double
    public let totalDiscountsReceived: Double
    public let recentRecords: [RevenueRecordDTO]
    
    public init(
        clientId: UUID,
        totalSpent: Double,
        totalTrips: Int,
        averageSpentPerTrip: Double,
        totalDiscountsReceived: Double,
        recentRecords: [RevenueRecordDTO]
    ) {
        self.clientId = clientId
        self.totalSpent = totalSpent
        self.totalTrips = totalTrips
        self.averageSpentPerTrip = averageSpentPerTrip
        self.totalDiscountsReceived = totalDiscountsReceived
        self.recentRecords = recentRecords
    }
}
