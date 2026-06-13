import Foundation
import Vapor

// MARK: - Promo Code Usage DTOs

/// Promo code usage DTO
public struct PromoCodeUsageDTO: Content {
    public let id: UUID?
    public let promoCodeId: UUID
    public let clientId: UUID
    public let tripId: UUID?
    public let discountAmount: Double
    public let usedAt: Date?
    
    public init(
        id: UUID? = nil,
        promoCodeId: UUID,
        clientId: UUID,
        tripId: UUID? = nil,
        discountAmount: Double,
        usedAt: Date? = nil
    ) {
        self.id = id
        self.promoCodeId = promoCodeId
        self.clientId = clientId
        self.tripId = tripId
        self.discountAmount = discountAmount
        self.usedAt = usedAt
    }
}

/// Create promo code usage request
public struct CreatePromoCodeUsageRequest: Content {
    public let promoCodeId: UUID
    public let clientId: UUID
    public let tripId: UUID?
    public let discountAmount: Double
    
    public init(
        promoCodeId: UUID,
        clientId: UUID,
        tripId: UUID? = nil,
        discountAmount: Double
    ) {
        self.promoCodeId = promoCodeId
        self.clientId = clientId
        self.tripId = tripId
        self.discountAmount = discountAmount
    }
}

/// Update promo code usage request
public struct UpdatePromoCodeUsageRequest: Content {
    public let tripId: UUID?
    public let discountAmount: Double?
    
    public init(tripId: UUID? = nil, discountAmount: Double? = nil) {
        self.tripId = tripId
        self.discountAmount = discountAmount
    }
}

/// Promo code usage list response
public struct PromoCodeUsageListResponse: Content {
    public let usages: [PromoCodeUsageDTO]
    public let total: Int
    public let page: Int
    public let perPage: Int
    
    public init(usages: [PromoCodeUsageDTO], total: Int, page: Int, perPage: Int) {
        self.usages = usages
        self.total = total
        self.page = page
        self.perPage = perPage
    }
}

/// Promo code usage query filters
public struct PromoCodeUsageQueryFilters: Content {
    public let promoCodeId: UUID?
    public let clientId: UUID?
    public let tripId: UUID?
    public let usedAfter: Date?
    public let usedBefore: Date?
    public let minDiscountAmount: Double?
    public let maxDiscountAmount: Double?
    public let page: Int?
    public let perPage: Int?
    
    public init(
        promoCodeId: UUID? = nil,
        clientId: UUID? = nil,
        tripId: UUID? = nil,
        usedAfter: Date? = nil,
        usedBefore: Date? = nil,
        minDiscountAmount: Double? = nil,
        maxDiscountAmount: Double? = nil,
        page: Int? = nil,
        perPage: Int? = nil
    ) {
        self.promoCodeId = promoCodeId
        self.clientId = clientId
        self.tripId = tripId
        self.usedAfter = usedAfter
        self.usedBefore = usedBefore
        self.minDiscountAmount = minDiscountAmount
        self.maxDiscountAmount = maxDiscountAmount
        self.page = page
        self.perPage = perPage
    }
}

/// Promo code usage statistics
public struct PromoCodeUsageStatsDTO: Content {
    public let promoCodeId: UUID
    public let promoCode: String
    public let totalUsages: Int
    public let uniqueUsers: Int
    public let totalDiscountGiven: Double
    public let averageDiscountAmount: Double
    public let usagesByDate: [String: Int] // ISO date string: count
    
    public init(
        promoCodeId: UUID,
        promoCode: String,
        totalUsages: Int,
        uniqueUsers: Int,
        totalDiscountGiven: Double,
        averageDiscountAmount: Double,
        usagesByDate: [String: Int]
    ) {
        self.promoCodeId = promoCodeId
        self.promoCode = promoCode
        self.totalUsages = totalUsages
        self.uniqueUsers = uniqueUsers
        self.totalDiscountGiven = totalDiscountGiven
        self.averageDiscountAmount = averageDiscountAmount
        self.usagesByDate = usagesByDate
    }
}

/// Client promo code usage summary
public struct ClientPromoCodeUsageSummaryDTO: Content {
    public let clientId: UUID
    public let totalPromoCodesUsed: Int
    public let totalDiscountReceived: Double
    public let mostUsedPromoCode: String?
    public let recentUsages: [PromoCodeUsageDTO]
    
    public init(
        clientId: UUID,
        totalPromoCodesUsed: Int,
        totalDiscountReceived: Double,
        mostUsedPromoCode: String? = nil,
        recentUsages: [PromoCodeUsageDTO]
    ) {
        self.clientId = clientId
        self.totalPromoCodesUsed = totalPromoCodesUsed
        self.totalDiscountReceived = totalDiscountReceived
        self.mostUsedPromoCode = mostUsedPromoCode
        self.recentUsages = recentUsages
    }
}
