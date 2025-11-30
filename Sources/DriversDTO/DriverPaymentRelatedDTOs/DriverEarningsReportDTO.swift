//
//  DriverEarningsReportDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 30/11/2025.
//


//
//  DriverEarningsReportDTO.swift
//  GoFloraTranposportService
//
//  Created by Terence Changadeya on 27/11/2025.
//
import Vapor

public struct DriverEarningsReportDTO: Content {
    public let period: EarningsPeriodDTO
    public let summary: EarningsSummaryDTO
    public let currencyBreakdown: [String: CurrencyEarningsDTO]

    public init(period: EarningsPeriodDTO, summary: EarningsSummaryDTO, currencyBreakdown: [String: CurrencyEarningsDTO]) {
        self.period = period
        self.summary = summary
        self.currencyBreakdown = currencyBreakdown
    }
}

public struct EarningsPeriodDTO: Content {
    public let from: String
    public let to: String

    public init(from: String, to: String) {
        self.from = from
        self.to = to
    }
}

public struct EarningsSummaryDTO: Content {
    public let totalEarnings: Double
    public let totalDriverFees: Double
    public let totalPlatformFees: Double
    public let totalBaseFares: Double
    public let invoiceCount: Int

    public init(totalEarnings: Double, totalDriverFees: Double, totalPlatformFees: Double, totalBaseFares: Double, invoiceCount: Int) {
        self.totalEarnings = totalEarnings
        self.totalDriverFees = totalDriverFees
        self.totalPlatformFees = totalPlatformFees
        self.totalBaseFares = totalBaseFares
        self.invoiceCount = invoiceCount
    }
}

public struct CurrencyEarningsDTO: Content {
    public let count: Int
    public let totalAmount: Double
    public let driverFees: Double

    public init(count: Int, totalAmount: Double, driverFees: Double) {
        self.count = count
        self.totalAmount = totalAmount
        self.driverFees = driverFees
    }
}
