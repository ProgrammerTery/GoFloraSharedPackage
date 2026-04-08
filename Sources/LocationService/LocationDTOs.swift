//
//  LocationDTOs.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya
//

import Vapor
import Foundation

// MARK: - Popular Location DTOs

/// Enhanced PopularLocationDTO with future-proof fields
public struct PopularLocationDTO: Content, Codable {
    public let id: String
    public let name: String
    public let category: String
    public let address: String
    public let latitude: Double
    public let longitude: Double
    public let city: String
    public let icon: String
    public var usageCount: Int
    public let placeId: String?
    public let phoneNumber: String?
    public let rating: Double?
    public let isActive: Bool?

    public init(
        id: String,
        name: String,
        category: String,
        address: String,
        latitude: Double,
        longitude: Double,
        city: String,
        icon: String,
        usageCount: Int,
        placeId: String? = nil,
        phoneNumber: String? = nil,
        rating: Double? = nil,
        isActive: Bool? = nil
    ) {
        self.id = id
        self.name = name
        self.category = category
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.city = city
        self.icon = icon
        self.usageCount = usageCount
        self.placeId = placeId
        self.phoneNumber = phoneNumber
        self.rating = rating
        self.isActive = isActive
    }
}

// MARK: - Location Zone DTOs

/// LocationZone DTO for admin-managed settlement zones
public struct LocationZoneDTO: Content, Codable {
    public let id: String
    public let name: String
    public let zoneName: String
    public let description: String?
    public let address: String
    public let latitude: Double
    public let longitude: Double
    public let city: String
    public let radius: Double  // in meters
    public var usageCount: Int
    public let landmark: String?
    public let zoneType: String?
    public let isActive: Bool?
    public let createdAt: Date?
    public let updatedAt: Date?

    public init(
        id: String,
        name: String,
        zoneName: String,
        description: String?,
        address: String,
        latitude: Double,
        longitude: Double,
        city: String,
        radius: Double,
        usageCount: Int,
        landmark: String? = nil,
        zoneType: String? = nil,
        isActive: Bool? = nil,
        createdAt: Date? = nil,
        updatedAt: Date? = nil
    ) {
        self.id = id
        self.name = name
        self.zoneName = zoneName
        self.description = description
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.city = city
        self.radius = radius
        self.usageCount = usageCount
        self.landmark = landmark
        self.zoneType = zoneType
        self.isActive = isActive
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

/// DTO for creating new location zones (admin only)
public struct LocationZoneCreateDTO: Content, Codable {
    public let name: String
    public let zoneName: String
    public let description: String?
    public let address: String
    public let latitude: Double
    public let longitude: Double
    public let city: String
    public let radius: Double
    public let landmark: String?
    public let zoneType: String?

    public init(
        name: String,
        zoneName: String,
        description: String?,
        address: String,
        latitude: Double,
        longitude: Double,
        city: String,
        radius: Double,
        landmark: String? = nil,
        zoneType: String? = nil
    ) {
        self.name = name
        self.zoneName = zoneName
        self.description = description
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.city = city
        self.radius = radius
        self.landmark = landmark
        self.zoneType = zoneType
    }
}

// MARK: - Search DTOs

/// Query parameters for location search
public struct LocationSearchQuery: Content, Codable {
    public let query: String
    public let city: String?
    public let latitude: Double?
    public let longitude: Double?
    public let radius: Double?  // in kilometers

    public init(
        query: String,
        city: String? = nil,
        latitude: Double? = nil,
        longitude: Double? = nil,
        radius: Double? = nil
    ) {
        self.query = query
        self.city = city
        self.latitude = latitude
        self.longitude = longitude
        self.radius = radius
    }
}

/// Unified search result containing both popular locations and zones
public struct LocationSearchResult: Content, Codable {
    public let results: [LocationResultItem]
    public let source: String  // "popular", "zone", or "mixed"
    public let count: Int

    public init(results: [LocationResultItem], source: String) {
        self.results = results
        self.source = source
        self.count = results.count
    }
}

/// Individual location result item (works for both popular locations and zones)
public struct LocationResultItem: Content, Codable {
    public let id: String?
    public let name: String
    public let address: String
    public let latitude: Double
    public let longitude: Double
    public let category: String?
    public let type: String  // "popular" or "zone"
    public let distance: Double?  // in kilometers from search origin
    public let icon: String?
    public let usageCount: Int?

    public init(
        id: String?,
        name: String,
        address: String,
        latitude: Double,
        longitude: Double,
        category: String?,
        type: String,
        distance: Double? = nil,
        icon: String? = nil,
        usageCount: Int? = nil
    ) {
        self.id = id
        self.name = name
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.category = category
        self.type = type
        self.distance = distance
        self.icon = icon
        self.usageCount = usageCount
    }
}
