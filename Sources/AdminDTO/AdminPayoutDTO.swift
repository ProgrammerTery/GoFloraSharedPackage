import Foundation
import Vapor

// MARK: - Payout Management DTOs

/// Payout list response
public struct AdminPayoutListResponse: Content {
    public let payouts: [AdminPayoutDTO]
    public let total: Int
    public let page: Int?
    public let perPage: Int?
    
    public init(payouts: [AdminPayoutDTO], total: Int, page: Int? = nil, perPage: Int? = nil) {
        self.payouts = payouts
        self.total = total
        self.page = page
        self.perPage = perPage
    }
}

/// Admin payout DTO
public struct AdminPayoutDTO: Content {
    public let id: UUID
    public let driverId: UUID
    public let driverName: String
    public let driverPhone: String?
    public let amountCents: Int
    public let amount: Double
    public let currency: String
    public let status: String
    public let isManual: Bool
    public let notes: String?
    public let reference: String?
    public let approvedBy: String?
    public let approvedAt: Date?
    public let completedAt: Date?
    public let rejectedReason: String?
    public let createdAt: Date
    
    public init(
        id: UUID,
        driverId: UUID,
        driverName: String,
        driverPhone: String? = nil,
        amountCents: Int,
        amount: Double,
        currency: String,
        status: String,
        isManual: Bool = false,
        notes: String? = nil,
        reference: String? = nil,
        approvedBy: String? = nil,
        approvedAt: Date? = nil,
        completedAt: Date? = nil,
        rejectedReason: String? = nil,
        createdAt: Date
    ) {
        self.id = id
        self.driverId = driverId
        self.driverName = driverName
        self.driverPhone = driverPhone
        self.amountCents = amountCents
        self.amount = amount
        self.currency = currency
        self.status = status
        self.isManual = isManual
        self.notes = notes
        self.reference = reference
        self.approvedBy = approvedBy
        self.approvedAt = approvedAt
        self.completedAt = completedAt
        self.rejectedReason = rejectedReason
        self.createdAt = createdAt
    }
}

/// Approve payout request
public struct ApprovePayoutRequest: Content {
    public let adminId: String
    public let notes: String?
    
    public init(adminId: String, notes: String? = nil) {
        self.adminId = adminId
        self.notes = notes
    }
}

/// Reject payout request
public struct RejectPayoutRequest: Content {
    public let adminId: String
    public let reason: String
    
    public init(adminId: String, reason: String) {
        self.adminId = adminId
        self.reason = reason
    }
}

/// Complete payout request
public struct CompletePayoutRequest: Content {
    public let adminId: String
    public let reference: String
    public let notes: String?
    
    public init(adminId: String, reference: String, notes: String? = nil) {
        self.adminId = adminId
        self.reference = reference
        self.notes = notes
    }
}

/// Payout feature flags response
public struct PayoutFeaturesResponse: Content {
    public let payonifyB2CEnabled: Bool
    public let automaticPayoutsEnabled: Bool
    public let manualPayoutApprovalRequired: Bool
    
    public init(
        payonifyB2CEnabled: Bool,
        automaticPayoutsEnabled: Bool,
        manualPayoutApprovalRequired: Bool
    ) {
        self.payonifyB2CEnabled = payonifyB2CEnabled
        self.automaticPayoutsEnabled = automaticPayoutsEnabled
        self.manualPayoutApprovalRequired = manualPayoutApprovalRequired
    }
}

/// Toggle feature request
public struct ToggleFeatureRequest: Content {
    public let enabled: Bool
    
    public init(enabled: Bool) {
        self.enabled = enabled
    }
}
