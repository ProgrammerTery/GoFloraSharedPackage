import Foundation
import Vapor

// MARK: - Commission Configuration DTOs

/// Commission configuration DTO
public struct CommissionConfigDTO: Content {
    public let id: UUID?
    public let name: String
    public let description: String?
    public let isActive: Bool
    public let priority: Int
    public let commissionType: String // "percentage" or "fixed"
    public let commissionValue: Double
    public let minTripAmount: Double?
    public let maxTripAmount: Double?
    public let serviceType: String? // "sedan", "suv", "van"
    public let zoneName: String?
    public let dayOfWeek: Int? // 1-7 (Sunday=1)
    public let startTime: String? // HH:mm format
    public let endTime: String? // HH:mm format
    public let createdAt: Date?
    public let updatedAt: Date?
    
    public init(
        id: UUID? = nil,
        name: String,
        description: String? = nil,
        isActive: Bool = true,
        priority: Int = 0,
        commissionType: String,
        commissionValue: Double,
        minTripAmount: Double? = nil,
        maxTripAmount: Double? = nil,
        serviceType: String? = nil,
        zoneName: String? = nil,
        dayOfWeek: Int? = nil,
        startTime: String? = nil,
        endTime: String? = nil,
        createdAt: Date? = nil,
        updatedAt: Date? = nil
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.isActive = isActive
        self.priority = priority
        self.commissionType = commissionType
        self.commissionValue = commissionValue
        self.minTripAmount = minTripAmount
        self.maxTripAmount = maxTripAmount
        self.serviceType = serviceType
        self.zoneName = zoneName
        self.dayOfWeek = dayOfWeek
        self.startTime = startTime
        self.endTime = endTime
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

/// Create commission configuration request
public struct CreateCommissionConfigRequest: Content {
    public let name: String
    public let description: String?
    public let isActive: Bool
    public let priority: Int
    public let commissionType: String
    public let commissionValue: Double
    public let minTripAmount: Double?
    public let maxTripAmount: Double?
    public let serviceType: String?
    public let zoneName: String?
    public let dayOfWeek: Int?
    public let startTime: String?
    public let endTime: String?
    
    public init(
        name: String,
        description: String? = nil,
        isActive: Bool = true,
        priority: Int = 0,
        commissionType: String,
        commissionValue: Double,
        minTripAmount: Double? = nil,
        maxTripAmount: Double? = nil,
        serviceType: String? = nil,
        zoneName: String? = nil,
        dayOfWeek: Int? = nil,
        startTime: String? = nil,
        endTime: String? = nil
    ) {
        self.name = name
        self.description = description
        self.isActive = isActive
        self.priority = priority
        self.commissionType = commissionType
        self.commissionValue = commissionValue
        self.minTripAmount = minTripAmount
        self.maxTripAmount = maxTripAmount
        self.serviceType = serviceType
        self.zoneName = zoneName
        self.dayOfWeek = dayOfWeek
        self.startTime = startTime
        self.endTime = endTime
    }
}

/// Update commission configuration request
public struct UpdateCommissionConfigRequest: Content {
    public let name: String?
    public let description: String?
    public let isActive: Bool?
    public let priority: Int?
    public let commissionType: String?
    public let commissionValue: Double?
    public let minTripAmount: Double?
    public let maxTripAmount: Double?
    public let serviceType: String?
    public let zoneName: String?
    public let dayOfWeek: Int?
    public let startTime: String?
    public let endTime: String?
    
    public init(
        name: String? = nil,
        description: String? = nil,
        isActive: Bool? = nil,
        priority: Int? = nil,
        commissionType: String? = nil,
        commissionValue: Double? = nil,
        minTripAmount: Double? = nil,
        maxTripAmount: Double? = nil,
        serviceType: String? = nil,
        zoneName: String? = nil,
        dayOfWeek: Int? = nil,
        startTime: String? = nil,
        endTime: String? = nil
    ) {
        self.name = name
        self.description = description
        self.isActive = isActive
        self.priority = priority
        self.commissionType = commissionType
        self.commissionValue = commissionValue
        self.minTripAmount = minTripAmount
        self.maxTripAmount = maxTripAmount
        self.serviceType = serviceType
        self.zoneName = zoneName
        self.dayOfWeek = dayOfWeek
        self.startTime = startTime
        self.endTime = endTime
    }
}

/// Commission configuration list response
public struct CommissionConfigListResponse: Content {
    public let configs: [CommissionConfigDTO]
    public let total: Int
    public let page: Int
    public let perPage: Int
    
    public init(configs: [CommissionConfigDTO], total: Int, page: Int, perPage: Int) {
        self.configs = configs
        self.total = total
        self.page = page
        self.perPage = perPage
    }
}

/// Commission configuration query filters
public struct CommissionConfigQueryFilters: Content {
    public let isActive: Bool?
    public let commissionType: String?
    public let serviceType: String?
    public let zoneName: String?
    public let minPriority: Int?
    public let maxPriority: Int?
    public let searchTerm: String?
    public let page: Int?
    public let perPage: Int?
    
    public init(
        isActive: Bool? = nil,
        commissionType: String? = nil,
        serviceType: String? = nil,
        zoneName: String? = nil,
        minPriority: Int? = nil,
        maxPriority: Int? = nil,
        searchTerm: String? = nil,
        page: Int? = nil,
        perPage: Int? = nil
    ) {
        self.isActive = isActive
        self.commissionType = commissionType
        self.serviceType = serviceType
        self.zoneName = zoneName
        self.minPriority = minPriority
        self.maxPriority = maxPriority
        self.searchTerm = searchTerm
        self.page = page
        self.perPage = perPage
    }
}
