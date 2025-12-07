//
//  DriverDashboardDTOs.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 26/11/2025.
//

import Vapor




// MARK: - Dashboard DTOs and Context Structures

public struct DriversDriverStatsContext: Content {
    public  let totalEarnings: String
    public  let totalTrips: String
    public  let averageRating: String
    public  let thisWeekTrips: String
    public  let activeBids: String?
    public  let assignedTrips: String?
    public  let earningsToday: String?
    public  let completedTrips: String?
    public  let successRate: String?
    public  let weeklyTrips: String?
    public let weeklyEarnings: String?
    public let weeklyHours: String?
    public let availableTrips: String?

    // Revenue Trajectory Properties
    public let monthlyEarnings: String?
    public let monthlyGrowth: String?
    public let monthlyGoal: String?
    public let goalProgress: String?
    public let goalExceeded: String?
    public  let avgTripEarnings: String?
    public   let daysLeft: String?
    public init(totalEarnings: String, totalTrips: String, averageRating: String, thisWeekTrips: String, activeBids: String?, assignedTrips: String?, earningsToday: String?, completedTrips: String?, successRate: String?, weeklyTrips: String?, weeklyEarnings: String?, weeklyHours: String?, availableTrips: String?, monthlyEarnings: String?, monthlyGrowth: String?, monthlyGoal: String?, goalProgress: String?, goalExceeded: String?, avgTripEarnings: String?, daysLeft: String?) {
        self.totalEarnings = totalEarnings
        self.totalTrips = totalTrips
        self.averageRating = averageRating
        self.thisWeekTrips = thisWeekTrips
        self.activeBids = activeBids
        self.assignedTrips = assignedTrips
        self.earningsToday = earningsToday
        self.completedTrips = completedTrips
        self.successRate = successRate
        self.weeklyTrips = weeklyTrips
        self.weeklyEarnings = weeklyEarnings
        self.weeklyHours = weeklyHours
        self.availableTrips = availableTrips
        self.monthlyEarnings = monthlyEarnings
        self.monthlyGrowth = monthlyGrowth
        self.monthlyGoal = monthlyGoal
        self.goalProgress = goalProgress
        self.goalExceeded = goalExceeded
        self.avgTripEarnings = avgTripEarnings
        self.daysLeft = daysLeft
    }
}

public struct DriversDashboardPageContext: Content {
    public   let title: String
    public   let pageType: String
    public   let driver: DriverProfileDTO
    public  let stats: DriversDriverStatsContext
    public   let recentTrips: [DriversTripSummaryContext]?
    public  let profileIncomplete: Bool?
    public  let vehicleIncomplete: Bool?

    public init(title: String, pageType: String, driver: DriverProfileDTO, stats: DriversDriverStatsContext, recentTrips: [DriversTripSummaryContext]?, profileIncomplete: Bool?, vehicleIncomplete: Bool? = nil) {
        self.title = title
        self.pageType = pageType
        self.driver = driver
        self.stats = stats
        self.recentTrips = recentTrips
        self.profileIncomplete = profileIncomplete
        self.vehicleIncomplete = vehicleIncomplete
    }
}

public struct DriversTripSummaryContext: Content {
    public let id: String
    public let pickup: String
    public let destination: String
    public let distance: String
    public let suggestedPrice: Double
    public let status: String
    public let bidAmount: Double?
    public let scheduledTime: String
    public let date: String?
    public let amount: String?

    public init(id: String, pickup: String, destination: String, distance: String, suggestedPrice: Double, status: String, bidAmount: Double?, scheduledTime: String, date: String?, amount: String?) {
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

