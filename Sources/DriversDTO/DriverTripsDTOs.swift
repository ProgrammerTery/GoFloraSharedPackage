//
//  DriverTripsDTOs.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 24/11/2025.
//

import Vapor


// MARK: - Dashboard & Profile DTOs

// Note: DashboardPageContext not used - dashboard uses direct context in controller

// MARK: - Trip Management DTOs

public struct AvailableTripsPageContext: Content {
    public let title: String
    public let pageType: String
    public let trips: [TripSummaryContext]
    public let driver: DriverProfileDTO
    // Pagination fields
    public let total: Int
    public let page: Int
    public let perPage: Int
    public let totalPages: Int
    public let hasNextPage: Bool
    public let hasPrevPage: Bool
    // Sidebar stats (optional)
    public let stats: DriversDriverStatsContext?
    public let pendingDisputesCount: Int?

    public init(title: String, pageType: String, trips: [TripSummaryContext], driver: DriverProfileDTO, total: Int, page: Int, perPage: Int, totalPages: Int, hasNextPage: Bool, hasPrevPage: Bool, stats: DriversDriverStatsContext? = nil, pendingDisputesCount: Int? = nil) {
        self.title = title
        self.pageType = pageType
        self.trips = trips
        self.driver = driver
        self.total = total
        self.page = page
        self.perPage = perPage
        self.totalPages = totalPages
        self.hasNextPage = hasNextPage
        self.hasPrevPage = hasPrevPage
        self.stats = stats
        self.pendingDisputesCount = pendingDisputesCount
    }
}

public struct TripSummaryContext: Content {
    public let id: String
    public let pickup: String
    public let destination: String
    public let distance: String?
    public let suggestedPrice: Double?
    public let status: String
    public let bidAmount: Double?
    public let scheduledTime: String?
    public let date: String?
    public let amount: Double?


    public init(id: String, pickup: String, destination: String, distance: String?, suggestedPrice: Double?, status: String, bidAmount: Double?, scheduledTime: String?, date: String?, amount: Double?) {
        self.id = id
        self.pickup = pickup
        self.destination = destination
        self.distance = distance
        self.suggestedPrice = suggestedPrice
        self.status = status
        self.bidAmount = bidAmount
        self.scheduledTime = scheduledTime
        self.date = date
        self.amount = amount
    }
}

public struct TripDetailsPageContext: Content {
    public let title: String
    public let pageType: String
    public let trip: DetailedTripContext
    public let driver: DriverProfileDTO
    public let canBid: Bool
    public let existingBid: BidContext?

    public init(title: String, pageType: String, trip: DetailedTripContext, driver: DriverProfileDTO, canBid: Bool, existingBid: BidContext?) {
        self.title = title
        self.pageType = pageType
        self.trip = trip
        self.driver = driver
        self.canBid = canBid
        self.existingBid = existingBid
    }
}

public struct DetailedTripContext: Content {
    public let id: String
    public let pickup: String
    public let destination: String
    public let distance: String?
    public let suggestedPrice: Double?
    public let status: String
    public let clientName: String?
    public let scheduledTime: String?
    public let numberOfPassengers: Int
    public let specialInstructions: String?
    // Airport transfer fields
    public let isAirportTransfer: Bool?
    public let flightNumber: String?
    public let airlineName: String?
    public let terminalInfo: String?
    public let fixedPrice: Int?

    public init(id: String, pickup: String, destination: String, distance: String?, suggestedPrice: Double?, status: String, clientName: String?, scheduledTime: String?, numberOfPassengers: Int, specialInstructions: String?, isAirportTransfer: Bool? = nil, flightNumber: String? = nil, airlineName: String? = nil, terminalInfo: String? = nil, fixedPrice: Int? = nil) {
        self.id = id
        self.pickup = pickup
        self.destination = destination
        self.distance = distance
        self.suggestedPrice = suggestedPrice
        self.status = status
        self.clientName = clientName
        self.scheduledTime = scheduledTime
        self.numberOfPassengers = numberOfPassengers
        self.specialInstructions = specialInstructions
        self.isAirportTransfer = isAirportTransfer
        self.flightNumber = flightNumber
        self.airlineName = airlineName
        self.terminalInfo = terminalInfo
        self.fixedPrice = fixedPrice
    }
}

public struct BidContext: Content {
    public  let amount: Double
    public  let isApproved: Bool
    public  let submittedAt: String
    public init(amount: Double, isApproved: Bool, submittedAt: String) {
        self.amount = amount
        self.isApproved = isApproved
        self.submittedAt = submittedAt
    }

}

    public struct BidFormData: Content {
        public  let bidAmount: Double
        public init(bidAmount: Double) {
            self.bidAmount = bidAmount
        }
    }

    public struct MyBidsPageContext: Content {
        public  let title: String
        public let pageType: String
        public let bids: [BidSummaryContext]
        public let driver: DriverProfileDTO
        public let pendingBidsCount: Int
        public let acceptedBidsCount: Int
        // Sidebar stats (optional)
        public let stats: DriversDriverStatsContext?
        public let pendingDisputesCount: Int?

        public init(title: String, pageType: String, bids: [BidSummaryContext], driver: DriverProfileDTO, pendingBidsCount : Int, acceptedBidsCount : Int, stats: DriversDriverStatsContext? = nil, pendingDisputesCount: Int? = nil) {
            self.title = title
            self.pageType = pageType
            self.bids = bids
            self.driver = driver
            self.pendingBidsCount = pendingBidsCount
            self.acceptedBidsCount = acceptedBidsCount
            self.stats = stats
            self.pendingDisputesCount = pendingDisputesCount
        }
}

public struct BidSummaryContext: Content {
    public   let tripID: String
    public  let pickup: String
    public   let destination: String
    public  let bidAmount: Double
    public  let status: String
    public  let submittedAt: String
    public  let isApproved: Bool
    public init(tripID: String, pickup: String, destination: String, bidAmount: Double, status: String, submittedAt: String, isApproved: Bool) {
        self.tripID = tripID
        self.pickup = pickup
        self.destination = destination
        self.bidAmount = bidAmount
        self.status = status
        self.submittedAt = submittedAt
        self.isApproved = isApproved
    }
}

public struct AssignedTripsPageContext: Content {
    public let title: String
    public  let pageType: String
    public  let trips: [AssignedTripContext]
    public  let driver: DriverProfileDTO
    // Pagination fields
    public let total: Int
    public let page: Int
    public let perPage: Int
    public let totalPages: Int
    public let hasNextPage: Bool
    public let hasPrevPage: Bool
    // Sidebar stats (optional)
    public let stats: DriversDriverStatsContext?
    public let pendingDisputesCount: Int?

    public init(title: String, pageType: String, trips: [AssignedTripContext], driver: DriverProfileDTO, total: Int, page: Int, perPage: Int, totalPages: Int, hasNextPage: Bool, hasPrevPage: Bool, stats: DriversDriverStatsContext? = nil, pendingDisputesCount: Int? = nil) {
        self.title = title
        self.pageType = pageType
        self.trips = trips
        self.driver = driver
        self.total = total
        self.page = page
        self.perPage = perPage
        self.totalPages = totalPages
        self.hasNextPage = hasNextPage
        self.hasPrevPage = hasPrevPage
        self.stats = stats
        self.pendingDisputesCount = pendingDisputesCount
    }

}

public struct AssignedTripContext: Content {
    public  let id: String
    public let pickup: String
    public  let destination: String
    public  let status: String
    public let scheduledTime: String
    public let clientName: String
    public  let clientPhone: String?
    public  let canStart: Bool
    public  let canComplete: Bool
    // Airport transfer fields
    public let isAirportTransfer: Bool?
    public let flightNumber: String?
    public let airlineName: String?
    public let terminalInfo: String?
    public let fixedPrice: Int?

    public init(id: String, pickup: String, destination: String, status: String, scheduledTime: String, clientName: String, clientPhone: String?, canStart: Bool, canComplete: Bool, isAirportTransfer: Bool? = nil, flightNumber: String? = nil, airlineName: String? = nil, terminalInfo: String? = nil, fixedPrice: Int? = nil) {
        self.id = id
        self.pickup = pickup
        self.destination = destination
        self.status = status
        self.scheduledTime = scheduledTime
        self.clientName = clientName
        self.clientPhone = clientPhone
        self.canStart = canStart
        self.canComplete = canComplete
        self.isAirportTransfer = isAirportTransfer
        self.flightNumber = flightNumber
        self.airlineName = airlineName
        self.terminalInfo = terminalInfo
        self.fixedPrice = fixedPrice
    }
}
