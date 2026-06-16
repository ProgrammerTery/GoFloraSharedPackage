import Foundation
import Vapor

// MARK: - Admin Dashboard DTOs

/// Dashboard statistics response from backend
public struct DashboardStatsDTO: Content {
    public let totalDrivers: Int
    public let activeDrivers: Int
    public let totalClients: Int
    public let activeClients: Int
    public let pendingDisputes: Int
    public let escalatedDisputes: Int
    public let pendingPayouts: Int
    public let pendingPayoutsAmount: Double
    public let totalPayouts: Double
    public let totalTripsToday: Int
    public let completedTripsToday: Int
    
    // Growth percentages (optional - may not be available from backend yet)
    public let driverGrowthPercent: Double?
    public let clientGrowthPercent: Double?
    public let payoutGrowthPercent: Double?
    
    public init(
        totalDrivers: Int,
        activeDrivers: Int,
        totalClients: Int,
        activeClients: Int,
        pendingDisputes: Int,
        escalatedDisputes: Int,
        pendingPayouts: Int,
        pendingPayoutsAmount: Double,
        totalPayouts: Double,
        totalTripsToday: Int,
        completedTripsToday: Int,
        driverGrowthPercent: Double? = nil,
        clientGrowthPercent: Double? = nil,
        payoutGrowthPercent: Double? = nil
    ) {
        self.totalDrivers = totalDrivers
        self.activeDrivers = activeDrivers
        self.totalClients = totalClients
        self.activeClients = activeClients
        self.pendingDisputes = pendingDisputes
        self.escalatedDisputes = escalatedDisputes
        self.pendingPayouts = pendingPayouts
        self.pendingPayoutsAmount = pendingPayoutsAmount
        self.totalPayouts = totalPayouts
        self.totalTripsToday = totalTripsToday
        self.completedTripsToday = completedTripsToday
        self.driverGrowthPercent = driverGrowthPercent
        self.clientGrowthPercent = clientGrowthPercent
        self.payoutGrowthPercent = payoutGrowthPercent
    }
}
