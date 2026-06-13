import Foundation
import Vapor

// MARK: - Promo Code DTOs

/// Promo code DTO
public struct PromoCodeDTO: Content {
    public let id: UUID?
    public let code: String
    public let description: String?
    public let discountType: String // "percentage" or "fixed"
    public let discountValue: Double
    public let maxDiscountAmount: Double?
    public let usageLimit: Int?
    public let usedCount: Int
    public let perUserLimit: Int?
    public let isActive: Bool
    public let validFrom: Date?
    public let validUntil: Date?
    public let minTripAmount: Double?
    public let maxTripAmount: Double?
    public let serviceTypes: [String]? // ["sedan", "suv", "van"]
    public let firstTripOnly: Bool
    public let createdAt: Date?
    public let updatedAt: Date?
    
    public init(
        id: UUID? = nil,
        code: String,
        description: String? = nil,
        discountType: String,
        discountValue: Double,
        maxDiscountAmount: Double? = nil,
        usageLimit: Int? = nil,
        usedCount: Int = 0,
        perUserLimit: Int? = nil,
        isActive: Bool = true,
        validFrom: Date? = nil,
        validUntil: Date? = nil,
        minTripAmount: Double? = nil,
        maxTripAmount: Double? = nil,
        serviceTypes: [String]? = nil,
        firstTripOnly: Bool = false,
        createdAt: Date? = nil,
        updatedAt: Date? = nil
    ) {
        self.id = id
        self.code = code
        self.description = description
        self.discountType = discountType
        self.discountValue = discountValue
        self.maxDiscountAmount = maxDiscountAmount
        self.usageLimit = usageLimit
        self.usedCount = usedCount
        self.perUserLimit = perUserLimit
        self.isActive = isActive
        self.validFrom = validFrom
        self.validUntil = validUntil
        self.minTripAmount = minTripAmount
        self.maxTripAmount = maxTripAmount
        self.serviceTypes = serviceTypes
        self.firstTripOnly = firstTripOnly
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

/// Create promo code request
public struct CreatePromoCodeRequest: Content {
    public let code: String
    public let description: String?
    public let discountType: String
    public let discountValue: Double
    public let maxDiscountAmount: Double?
    public let usageLimit: Int?
    public let perUserLimit: Int?
    public let isActive: Bool
    public let validFrom: Date?
    public let validUntil: Date?
    public let minTripAmount: Double?
    public let maxTripAmount: Double?
    public let serviceTypes: [String]?
    public let firstTripOnly: Bool
    
    public init(
        code: String,
        description: String? = nil,
        discountType: String,
        discountValue: Double,
        maxDiscountAmount: Double? = nil,
        usageLimit: Int? = nil,
        perUserLimit: Int? = nil,
        isActive: Bool = true,
        validFrom: Date? = nil,
        validUntil: Date? = nil,
        minTripAmount: Double? = nil,
        maxTripAmount: Double? = nil,
        serviceTypes: [String]? = nil,
        firstTripOnly: Bool = false
    ) {
        self.code = code
        self.description = description
        self.discountType = discountType
        self.discountValue = discountValue
        self.maxDiscountAmount = maxDiscountAmount
        self.usageLimit = usageLimit
        self.perUserLimit = perUserLimit
        self.isActive = isActive
        self.validFrom = validFrom
        self.validUntil = validUntil
        self.minTripAmount = minTripAmount
        self.maxTripAmount = maxTripAmount
        self.serviceTypes = serviceTypes
        self.firstTripOnly = firstTripOnly
    }
}

/// Update promo code request
public struct UpdatePromoCodeRequest: Content {
    public let code: String?
    public let description: String?
    public let discountType: String?
    public let discountValue: Double?
    public let maxDiscountAmount: Double?
    public let usageLimit: Int?
    public let perUserLimit: Int?
    public let isActive: Bool?
    public let validFrom: Date?
    public let validUntil: Date?
    public let minTripAmount: Double?
    public let maxTripAmount: Double?
    public let serviceTypes: [String]?
    public let firstTripOnly: Bool?
    
    public init(
        code: String? = nil,
        description: String? = nil,
        discountType: String? = nil,
        discountValue: Double? = nil,
        maxDiscountAmount: Double? = nil,
        usageLimit: Int? = nil,
        perUserLimit: Int? = nil,
        isActive: Bool? = nil,
        validFrom: Date? = nil,
        validUntil: Date? = nil,
        minTripAmount: Double? = nil,
        maxTripAmount: Double? = nil,
        serviceTypes: [String]? = nil,
        firstTripOnly: Bool? = nil
    ) {
        self.code = code
        self.description = description
        self.discountType = discountType
        self.discountValue = discountValue
        self.maxDiscountAmount = maxDiscountAmount
        self.usageLimit = usageLimit
        self.perUserLimit = perUserLimit
        self.isActive = isActive
        self.validFrom = validFrom
        self.validUntil = validUntil
        self.minTripAmount = minTripAmount
        self.maxTripAmount = maxTripAmount
        self.serviceTypes = serviceTypes
        self.firstTripOnly = firstTripOnly
    }
}

/// Promo code list response
public struct PromoCodeListResponse: Content {
    public let promoCodes: [PromoCodeDTO]
    public let total: Int
    public let page: Int
    public let perPage: Int
    
    public init(promoCodes: [PromoCodeDTO], total: Int, page: Int, perPage: Int) {
        self.promoCodes = promoCodes
        self.total = total
        self.page = page
        self.perPage = perPage
    }
}

/// Promo code query filters
public struct PromoCodeQueryFilters: Content {
    public let isActive: Bool?
    public let discountType: String?
    public let code: String?
    public let validAt: Date?
    public let hasUsageRemaining: Bool?
    public let serviceType: String?
    public let firstTripOnly: Bool?
    public let searchTerm: String?
    public let page: Int?
    public let perPage: Int?
    
    public init(
        isActive: Bool? = nil,
        discountType: String? = nil,
        code: String? = nil,
        validAt: Date? = nil,
        hasUsageRemaining: Bool? = nil,
        serviceType: String? = nil,
        firstTripOnly: Bool? = nil,
        searchTerm: String? = nil,
        page: Int? = nil,
        perPage: Int? = nil
    ) {
        self.isActive = isActive
        self.discountType = discountType
        self.code = code
        self.validAt = validAt
        self.hasUsageRemaining = hasUsageRemaining
        self.serviceType = serviceType
        self.firstTripOnly = firstTripOnly
        self.searchTerm = searchTerm
        self.page = page
        self.perPage = perPage
    }
}

/// Validate promo code request
public struct ValidatePromoCodeRequest: Content {
    public let code: String
    public let clientId: UUID
    public let tripAmount: Double
    public let serviceType: String
    
    public init(code: String, clientId: UUID, tripAmount: Double, serviceType: String) {
        self.code = code
        self.clientId = clientId
        self.tripAmount = tripAmount
        self.serviceType = serviceType
    }
}

/// Validate promo code response
public struct ValidatePromoCodeResponse: Content {
    public let isValid: Bool
    public let promoCode: PromoCodeDTO?
    public let discountAmount: Double?
    public let errorMessage: String?
    
    public init(isValid: Bool, promoCode: PromoCodeDTO? = nil, discountAmount: Double? = nil, errorMessage: String? = nil) {
        self.isValid = isValid
        self.promoCode = promoCode
        self.discountAmount = discountAmount
        self.errorMessage = errorMessage
    }
}
