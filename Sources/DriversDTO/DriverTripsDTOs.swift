//
//  DriverTripsDTOs.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 24/11/2025.
//

import Vapor

// MARK: - Dashboard & Profile DTOs

public struct DashboardPageContext: Content {
    public let title: String
    public let pageType: String
    public let driver: DriverProfileDTO
    public let stats: DriverStatsContext
    public let recentTrips: [TripSummaryContext]

    public init(title: String, pageType: String, driver: DriverProfileDTO, stats: DriverStatsContext, recentTrips: [TripSummaryContext]) {
        self.title = title
        self.pageType = pageType
        self.driver = driver
        self.stats = stats
        self.recentTrips = recentTrips
    }
}



public struct DriverStatsContext: Content {
    public let activeBids: Int
    public let assignedTrips: Int
    public let completedTrips: Int
    public let earnings: String

    public init(activeBids: Int, assignedTrips: Int, completedTrips: Int, earnings: String) {
        self.activeBids = activeBids
        self.assignedTrips = assignedTrips
        self.completedTrips = completedTrips
        self.earnings = earnings
    }
}

// MARK: - Trip Management DTOs

public struct AvailableTripsPageContext: Content {
    public let title: String
    public let pageType: String
    public let trips: [TripSummaryContext]
    public let driver: DriverProfileDTO

    public init(title: String, pageType: String, trips: [TripSummaryContext], driver: DriverProfileDTO) {
        self.title = title
        self.pageType = pageType
        self.trips = trips
        self.driver = driver
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

    public init(id: String, pickup: String, destination: String, distance: String?, suggestedPrice: Double?, status: String, clientName: String?, scheduledTime: String?, numberOfPassengers: Int, specialInstructions: String?) {
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

        public init(title: String, pageType: String, bids: [BidSummaryContext], driver: DriverProfileDTO, pendingBidsCount : Int, acceptedBidsCount : Int) {
            self.title = title
            self.pageType = pageType
            self.bids = bids
            self.driver = driver
            self.pendingBidsCount = pendingBidsCount
            self.acceptedBidsCount = acceptedBidsCount
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

    public init(title: String, pageType: String, trips: [AssignedTripContext], driver: DriverProfileDTO) {
        self.title = title
        self.pageType = pageType
        self.trips = trips
        self.driver = driver
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

    public init(id: String, pickup: String, destination: String, status: String, scheduledTime: String, clientName: String, clientPhone: String?, canStart: Bool, canComplete: Bool) {
        self.id = id
        self.pickup = pickup
        self.destination = destination
        self.status = status
        self.scheduledTime = scheduledTime
        self.clientName = clientName
        self.clientPhone = clientPhone
        self.canStart = canStart
        self.canComplete = canComplete
    }
}
