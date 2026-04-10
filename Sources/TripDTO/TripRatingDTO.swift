//
//  TripRatingDTO.swift
//  GoFloraSharedPackage
//
//  Created by Claude on 11/4/2026.
//

import Foundation
import Vapor

// MARK: - Create Rating DTO
/// DTO for submitting a new trip rating
public struct TripRatingCreateDTO: Content, Codable {
    public let rating: Int  // 1-5 stars
    public let comment: String?

    public init(rating: Int, comment: String? = nil) {
        self.rating = rating
        self.comment = comment
    }
}

// MARK: - Rating Response DTO
/// DTO for returning trip rating details
public struct TripRatingDTO: Content, Codable {
    public let id: String
    public let tripId: String
    public let clientId: String
    public let driverId: String
    public let rating: Int
    public let comment: String?
    public let createdAt: Date
    public let updatedAt: Date?

    public init(
        id: String,
        tripId: String,
        clientId: String,
        driverId: String,
        rating: Int,
        comment: String?,
        createdAt: Date,
        updatedAt: Date?
    ) {
        self.id = id
        self.tripId = tripId
        self.clientId = clientId
        self.driverId = driverId
        self.rating = rating
        self.comment = comment
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

// MARK: - Driver Rating Summary DTO
/// DTO for driver's overall rating statistics
public struct DriverRatingSummaryDTO: Content, Codable {
    public let driverId: String
    public let averageRating: Double
    public let totalRatings: Int
    public let fiveStarCount: Int
    public let fourStarCount: Int
    public let threeStarCount: Int
    public let twoStarCount: Int
    public let oneStarCount: Int

    public init(
        driverId: String,
        averageRating: Double,
        totalRatings: Int,
        fiveStarCount: Int,
        fourStarCount: Int,
        threeStarCount: Int,
        twoStarCount: Int,
        oneStarCount: Int
    ) {
        self.driverId = driverId
        self.averageRating = averageRating
        self.totalRatings = totalRatings
        self.fiveStarCount = fiveStarCount
        self.fourStarCount = fourStarCount
        self.threeStarCount = threeStarCount
        self.twoStarCount = twoStarCount
        self.oneStarCount = oneStarCount
    }
}

// MARK: - Ratings List Response DTO
/// DTO for paginated list of ratings
public struct TripRatingsListDTO: Content, Codable {
    public let ratings: [TripRatingDTO]
    public let totalCount: Int
    public let page: Int
    public let perPage: Int

    public init(
        ratings: [TripRatingDTO],
        totalCount: Int,
        page: Int,
        perPage: Int
    ) {
        self.ratings = ratings
        self.totalCount = totalCount
        self.page = page
        self.perPage = perPage
    }
}
