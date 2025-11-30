
//
//  DriverServiceFeesStatsDTO.swift
//  GoFloraTranposportService
//
//  Created by Terence Changadeya on 27/11/2025.
//

import Vapor


public struct DriverServiceFeesStatsDTO: Content {
    public let totalFees: Int
    public let activeFees: Int
    public let inactiveFees: Int
    public let totalFeeAmount: Double
    public let activeFeeAmount: Double
    public let currencyBreakdown: [String: CurrencyStatsDTO]

    public init(totalFees: Int, activeFees: Int, inactiveFees: Int, totalFeeAmount: Double, activeFeeAmount: Double, currencyBreakdown: [String: CurrencyStatsDTO]) {
        self.totalFees = totalFees
        self.activeFees = activeFees
        self.inactiveFees = inactiveFees
        self.totalFeeAmount = totalFeeAmount
        self.activeFeeAmount = activeFeeAmount
        self.currencyBreakdown = currencyBreakdown
    }
}

public struct CurrencyStatsDTO: Content {
    public let count: Int
    public let totalAmount: Double

    public init(count: Int, totalAmount: Double) {
        self.count = count
        self.totalAmount = totalAmount
    }
}
