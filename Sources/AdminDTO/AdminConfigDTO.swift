import Foundation
import Vapor

// MARK: - System Configuration DTOs

/// Service type DTO
public struct ServiceTypeDTO: Content {
    public let id: UUID?
    public let serviceName: String
    public let basefare: Double
    public let description: String?
    public let isActive: Bool
    public let createdAt: Date?
    
    public init(
        id: UUID? = nil,
        serviceName: String,
        basefare: Double,
        description: String? = nil,
        isActive: Bool = true,
        createdAt: Date? = nil
    ) {
        self.id = id
        self.serviceName = serviceName
        self.basefare = basefare
        self.description = description
        self.isActive = isActive
        self.createdAt = createdAt
    }
}

/// Create/Update service type request
public struct ServiceTypeRequest: Content {
    public let serviceName: String
    public let basefare: Double
    public let description: String?
    
    public init(serviceName: String, basefare: Double, description: String? = nil) {
        self.serviceName = serviceName
        self.basefare = basefare
        self.description = description
    }
}

/// Popular location DTO
public struct PopularLocationConfigDTO: Content {
    public let id: UUID?
    public let name: String
    public let latitude: Double
    public let longitude: Double
    public let usageCount: Int
    public let isActive: Bool
    public let createdAt: Date?
    
    public init(
        id: UUID? = nil,
        name: String,
        latitude: Double,
        longitude: Double,
        usageCount: Int = 0,
        isActive: Bool = true,
        createdAt: Date? = nil
    ) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.usageCount = usageCount
        self.isActive = isActive
        self.createdAt = createdAt
    }
}

/// Create/Update popular location request
public struct PopularLocationRequest: Content {
    public let name: String
    public let latitude: Double
    public let longitude: Double
    public let usageCount: Int?
    
    public init(name: String, latitude: Double, longitude: Double, usageCount: Int? = nil) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.usageCount = usageCount
    }
}

/// Zone DTO
public struct ZoneConfigDTO: Content {
    public let id: UUID?
    public let zoneName: String
    public let centerLatitude: Double
    public let centerLongitude: Double
    public let radiusInMeters: Double
    public let isActive: Bool
    public let createdAt: Date?
    
    public init(
        id: UUID? = nil,
        zoneName: String,
        centerLatitude: Double,
        centerLongitude: Double,
        radiusInMeters: Double,
        isActive: Bool = true,
        createdAt: Date? = nil
    ) {
        self.id = id
        self.zoneName = zoneName
        self.centerLatitude = centerLatitude
        self.centerLongitude = centerLongitude
        self.radiusInMeters = radiusInMeters
        self.isActive = isActive
        self.createdAt = createdAt
    }
}

/// Create/Update zone request
public struct ZoneRequest: Content {
    public let zoneName: String
    public let centerLatitude: Double
    public let centerLongitude: Double
    public let radiusInMeters: Double
    
    public init(zoneName: String, centerLatitude: Double, centerLongitude: Double, radiusInMeters: Double) {
        self.zoneName = zoneName
        self.centerLatitude = centerLatitude
        self.centerLongitude = centerLongitude
        self.radiusInMeters = radiusInMeters
    }
}

/// Service fees configuration
public struct ServiceFeesConfigDTO: Content {
    public let platformFeePercentage: Double
    public let minimumPlatformFee: Double
    public let driverMinimumFee: Double
    public let driverMaximumFee: Double
    
    public init(
        platformFeePercentage: Double,
        minimumPlatformFee: Double,
        driverMinimumFee: Double,
        driverMaximumFee: Double
    ) {
        self.platformFeePercentage = platformFeePercentage
        self.minimumPlatformFee = minimumPlatformFee
        self.driverMinimumFee = driverMinimumFee
        self.driverMaximumFee = driverMaximumFee
    }
}

/// Update platform fee request
public struct UpdatePlatformFeeRequest: Content {
    public let percentage: Double
    public let minimumFee: Double
    
    public init(percentage: Double, minimumFee: Double) {
        self.percentage = percentage
        self.minimumFee = minimumFee
    }
}

/// Update driver fee limits request
public struct UpdateDriverFeeLimitsRequest: Content {
    public let minimum: Double
    public let maximum: Double
    
    public init(minimum: Double, maximum: Double) {
        self.minimum = minimum
        self.maximum = maximum
    }
}
