//
//  PaymentDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya
//

import Vapor
import Foundation

// MARK: - Request DTOs

public struct InitiatePaymentRequest: Content {
    public let tripId: UUID
    public let paymentMethodId: UUID
    public let paymentMethodType: String
    public let currency: String
    public let clientEmail: String
    public let clientPhone: String
    
    public init(tripId: UUID, paymentMethodId: UUID, paymentMethodType: String, currency: String, clientEmail: String, clientPhone: String) {
        self.tripId = tripId
        self.paymentMethodId = paymentMethodId
        self.paymentMethodType = paymentMethodType
        self.currency = currency
        self.clientEmail = clientEmail
        self.clientPhone = clientPhone
    }
}

public struct PayNowInitiateRequest: Content {
    public let amount: Double
    public let email: String
    public let phone: String
    public let currency: String
    public let paymentMethod: String
    public let integrationId: Int
    public let integrationKey: String
    
    public init(amount: Double, email: String, phone: String, currency: String, paymentMethod: String, integrationId: Int, integrationKey: String) {
        self.amount = amount
        self.email = email
        self.phone = phone
        self.currency = currency
        self.paymentMethod = paymentMethod
        self.integrationId = integrationId
        self.integrationKey = integrationKey
    }
}

public struct ApproveDriverBidRequest: Content {
    public let tripId: UUID
    public let driverId: UUID
    
    public init(tripId: UUID, driverId: UUID) {
        self.tripId = tripId
        self.driverId = driverId
    }
}

public struct SubmitDriverBidRequest: Content {
    public let tripId: UUID
    public let bidAmount: Double
    
    public init(tripId: UUID, bidAmount: Double) {
        self.tripId = tripId
        self.bidAmount = bidAmount
    }
}

// MARK: - Response DTOs

public struct PaymentMethodsResponse: Content {
    public struct PaymentMethodGroup: Content {
        public let methodType: String
        public let currency: String
        public let feeAmount: Double
        public let paymentMethodId: UUID
        public let priority: Int
        
        public init(methodType: String, currency: String, feeAmount: Double, paymentMethodId: UUID, priority: Int) {
            self.methodType = methodType
            self.currency = currency
            self.feeAmount = feeAmount
            self.paymentMethodId = paymentMethodId
            self.priority = priority
        }
    }
    
    public let baseFare: Double
    public let availableMethods: [PaymentMethodGroup]
    
    public init(baseFare: Double, availableMethods: [PaymentMethodGroup]) {
        self.baseFare = baseFare
        self.availableMethods = availableMethods
    }
}

public struct PayNowPaymentSuccessResponse: Content {
    public let status: String
    public let paynowReference: String
    public let pollUrl: String
    public let amount: Double
    public let browserurl: String

    public init(status: String, paynowReference: String, pollUrl: String, amount: Double, browserurl: String) {
        self.status = status
        self.paynowReference = paynowReference
        self.pollUrl = pollUrl
        self.amount = amount
        self.browserurl = browserurl
    }
}

public struct PaymentStatusResponse: Content {
    public let isPaid: Bool
    public let amount: Double
    public let status: String
    public let paynowReference: String?
    public let pollUrl: String?
    
    public init(isPaid: Bool, amount: Double, status: String, paynowReference: String?, pollUrl: String?) {
        self.isPaid = isPaid
        self.amount = amount
        self.status = status
        self.paynowReference = paynowReference
        self.pollUrl = pollUrl
    }
}

public struct DriverPayoutResponse: Content {
    public let invoiceId: UUID
    public let baseFare: Double
    public let platformFee: Double
    public let driverServiceFee: Double
    public let totalPayout: Double
    public let currency: String
    public let status: String
    
    public init(invoiceId: UUID, baseFare: Double, platformFee: Double, driverServiceFee: Double, totalPayout: Double, currency: String, status: String) {
        self.invoiceId = invoiceId
        self.baseFare = baseFare
        self.platformFee = platformFee
        self.driverServiceFee = driverServiceFee
        self.totalPayout = totalPayout
        self.currency = currency
        self.status = status
    }
}

// MARK: - PayNow Webhook

public struct PayNowWebhookPayload: Content {
    public let reference: String
    public let paynowReference: String
    public let amount: String
    public let status: String
    public let pollUrl: String
    public let hash: String?
    
    public init(reference: String, paynowReference: String, amount: String, status: String, pollUrl: String, hash: String?) {
        self.reference = reference
        self.paynowReference = paynowReference
        self.amount = amount
        self.status = status
        self.pollUrl = pollUrl
        self.hash = hash
    }
}

// MARK: - Internal DTOs

public struct PaymentBreakdown: Content {
    public let baseFare: Double
    public let driverServiceFee: Double
    public let platformFee: Double
    public let totalAmount: Double
    public let currency: String
    
    public init(baseFare: Double, driverServiceFee: Double, platformFee: Double, totalAmount: Double, currency: String) {
        self.baseFare = baseFare
        self.driverServiceFee = driverServiceFee
        self.platformFee = platformFee
        self.totalAmount = totalAmount
        self.currency = currency
    }
}
