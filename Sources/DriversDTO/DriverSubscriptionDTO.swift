import Vapor

// MARK: - Subscription Plan

public enum SubscriptionPlan: String, Content, Sendable, CaseIterable {
    case premiumMonthly = "premium_monthly"
    
    public var displayName: String {
        switch self {
        case .premiumMonthly: return "Premium Monthly"
        }
    }
    
    public var priceCents: Int {
        switch self {
        case .premiumMonthly: return 250 // $2.50
        }
    }
    
    public var currency: String { "USD" }
    
    public var intervalDays: Int {
        switch self {
        case .premiumMonthly: return 30
        }
    }
}

public enum SubscriptionStatus: String, Content, Sendable {
    case active
    case expired
    case cancelled
    case pendingPayment = "pending_payment"
}

// MARK: - DTOs

public struct DriverSubscriptionDTO: Content {
    public let id: UUID?
    public let driverID: UUID
    public let plan: String
    public let status: String
    public let startDate: Date?
    public let endDate: Date?
    public let autoRenew: Bool
    public let priceCents: Int
    public let currency: String
    public let createdAt: Date?
    
    public var isActive: Bool {
        guard status == "active", let end = endDate else { return false }
        return end > Date()
    }
    
    public var daysRemaining: Int? {
        guard let end = endDate else { return nil }
        return max(0, Calendar.current.dateComponents([.day], from: Date(), to: end).day ?? 0)
    }
    
    public init(id: UUID?, driverID: UUID, plan: String, status: String, startDate: Date?, endDate: Date?, autoRenew: Bool, priceCents: Int, currency: String, createdAt: Date?) {
        self.id = id
        self.driverID = driverID
        self.plan = plan
        self.status = status
        self.startDate = startDate
        self.endDate = endDate
        self.autoRenew = autoRenew
        self.priceCents = priceCents
        self.currency = currency
        self.createdAt = createdAt
    }
}

// MARK: - Subscribe Request (driver pays via EcoCash)

public struct SubscribeRequest: Content {
    public let plan: String           // "premium_monthly"
    public let mobileNumber: String   // EcoCash number e.g. "0771234567"
    public let provider: String       // "ecocash" or "onemoney"
    
    public init(plan: String, mobileNumber: String, provider: String) {
        self.plan = plan
        self.mobileNumber = mobileNumber
        self.provider = provider
    }
}

public struct SubscribeResponse: Content {
    public let subscriptionID: UUID
    public let chargeID: String       // Payonify charge ID for tracking
    public let status: String         // "pending_payment"
    public let message: String
    
    public init(subscriptionID: UUID, chargeID: String, status: String, message: String) {
        self.subscriptionID = subscriptionID
        self.chargeID = chargeID
        self.status = status
        self.message = message
    }
}

// MARK: - Subscription Status Response

public struct SubscriptionStatusResponse: Content {
    public let hasActiveSubscription: Bool
    public let subscription: DriverSubscriptionDTO?
    public let availablePlans: [SubscriptionPlanInfo]
    
    public init(hasActiveSubscription: Bool, subscription: DriverSubscriptionDTO?, availablePlans: [SubscriptionPlanInfo]) {
        self.hasActiveSubscription = hasActiveSubscription
        self.subscription = subscription
        self.availablePlans = availablePlans
    }
}

public struct SubscriptionPlanInfo: Content {
    public let plan: String
    public let displayName: String
    public let priceCents: Int
    public let currency: String
    public let intervalDays: Int
    public let features: [String]
    
    public init(plan: String, displayName: String, priceCents: Int, currency: String, intervalDays: Int, features: [String]) {
        self.plan = plan
        self.displayName = displayName
        self.priceCents = priceCents
        self.currency = currency
        self.intervalDays = intervalDays
        self.features = features
    }
}

// MARK: - Admin Subscription View

public struct AdminDriverSubscriptionDTO: Content {
    public let driverID: UUID
    public let driverName: String
    public let subscription: DriverSubscriptionDTO?
    public let isActive: Bool
    
    public init(driverID: UUID, driverName: String, subscription: DriverSubscriptionDTO?, isActive: Bool) {
        self.driverID = driverID
        self.driverName = driverName
        self.subscription = subscription
        self.isActive = isActive
    }
}
