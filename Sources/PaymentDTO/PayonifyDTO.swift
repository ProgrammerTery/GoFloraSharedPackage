//
//  PayonifyDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya
//  Payonify API Integration DTOs
//  API Docs: https://docs.payonify.com/api
//

import Vapor
import Foundation

// MARK: - Common Types

/// Payonify currency enum
public enum PayonifyCurrency: String, Codable {
    case usd = "usd"
    case zwg = "zwg"
}

/// Payonify payment source enum
public enum PayonifySource: String, Codable {
    case pos = "pos"
    case web = "web"
    case mobile = "mobile"
    case ussd = "ussd"
}

/// Payonify charge status enum
public enum PayonifyChargeStatus: String, Codable {
    case requiresPaymentMethod = "requires_payment_method"
    case requiresAuthorization = "requires_authorization"
    case pending = "pending"
    case succeeded = "succeeded"
    case failed = "failed"
    case cancelled = "cancelled"
}

/// Payonify payout status enum
public enum PayonifyPayoutStatus: String, Codable {
    case pending = "pending"
    case paid = "paid"
    case failed = "failed"
}

/// Payonify cancellation reason enum
public enum PayonifyCancellationReason: String, Codable {
    case duplicate = "duplicate"
    case fraudulent = "fraudulent"
    case abandoned = "abandoned"
    case requestedByCustomer = "requested_by_customer"
}

/// Payonify webhook event type enum
public enum PayonifyEventType: String, Codable {
    case chargeSucceeded = "charge.succeeded"
    case chargeFailed = "charge.failed"
    case checkoutSucceeded = "checkout.succeeded"
    case checkoutFailed = "checkout.failed"
    case refundSucceeded = "refund.succeeded"
    case refundFailed = "refund.failed"
    case payoutSucceeded = "payout.succeeded"
    case payoutFailed = "payout.failed"
}

// MARK: - Nested Object Types

/// Amount object structure
public struct PayonifyAmount: Content {
    public let value: Int           // Amount in smallest currency unit (cents)
    public let currency: String

    public init(value: Int, currency: String) {
        self.value = value
        self.currency = currency
    }
}

/// Mobile money payment method
public struct PayonifyMobileMoney: Content {
    public let ecocash: PayonifyEcocash?
    public let onemoney: PayonifyOneMoney?

    public init(ecocash: PayonifyEcocash? = nil, onemoney: PayonifyOneMoney? = nil) {
        self.ecocash = ecocash
        self.onemoney = onemoney
    }
}

/// EcoCash mobile money details
public struct PayonifyEcocash: Content {
    public let mobile_number: String

    public init(mobile_number: String) {
        self.mobile_number = mobile_number
    }
}

/// OneMoney mobile money details
public struct PayonifyOneMoney: Content {
    public let mobile_number: String

    public init(mobile_number: String) {
        self.mobile_number = mobile_number
    }
}

/// Payment method wrapper
public struct PayonifyPaymentMethod: Content {
    public let mobile_money: PayonifyMobileMoney?

    public init(mobile_money: PayonifyMobileMoney?) {
        self.mobile_money = mobile_money
    }
}

/// Shipping address
public struct PayonifyAddress: Content {
    public let line1: String
    public let line2: String?
    public let city: String
    public let province: String
    public let country: String

    public init(line1: String, line2: String? = nil, city: String, province: String, country: String) {
        self.line1 = line1
        self.line2 = line2
        self.city = city
        self.province = province
        self.country = country
    }
}

/// Shipping details
public struct PayonifyShipping: Content {
    public let name: String
    public let carrier: String?
    public let tracking_number: String?
    public let phone: String?
    public let address: PayonifyAddress

    public init(name: String, carrier: String? = nil, tracking_number: String? = nil, phone: String? = nil, address: PayonifyAddress) {
        self.name = name
        self.carrier = carrier
        self.tracking_number = tracking_number
        self.phone = phone
        self.address = address
    }
}

/// Payment method details (response)
public struct PayonifyPaymentMethodDetails: Content {
    public let mobile_money: PayonifyMobileMoney?

    public init(mobile_money: PayonifyMobileMoney?) {
        self.mobile_money = mobile_money
    }
}

/// Pagination metadata
public struct PayonifyPaging: Content {
    public let after: String?
    public let before: String?
    public let has_more: Bool

    public init(after: String? = nil, before: String? = nil, has_more: Bool) {
        self.after = after
        self.before = before
        self.has_more = has_more
    }
}

/// Destination for payouts
public struct PayonifyDestination: Content {
    public let mobile_money: PayonifyMobileMoney

    public init(mobile_money: PayonifyMobileMoney) {
        self.mobile_money = mobile_money
    }
}

/// Validated recipient details
public struct PayonifyRecipient: Content {
    public let name: String
    public let account_status: String
    public let mobile_number: String

    public init(name: String, account_status: String, mobile_number: String) {
        self.name = name
        self.account_status = account_status
        self.mobile_number = mobile_number
    }
}

// MARK: - Charges API - Request DTOs

/// Create charge request
public struct PayonifyCreateChargeRequest: Content {
    public let amount: Int                              // Required, min: 100
    public let currency: String                         // Required: "usd" | "zwg"
    public let source: String                           // Required: "pos" | "web" | "mobile" | "ussd"
    public let description: String?                     // Optional, 4-150 chars
    public let payment_method: PayonifyPaymentMethod?   // Optional
    public let metadata: [String: String]?              // Optional, max 5 keys
    public let confirm: Bool?                           // Optional, default: false
    public let receipt_email: String?                   // Optional
    public let statement_descriptor: String?            // Optional, 4-22 chars
    public let shipping: PayonifyShipping?              // Optional
    public let return_url: String?                      // Optional

    public init(
        amount: Int,
        currency: String,
        source: String,
        description: String? = nil,
        payment_method: PayonifyPaymentMethod? = nil,
        metadata: [String: String]? = nil,
        confirm: Bool? = nil,
        receipt_email: String? = nil,
        statement_descriptor: String? = nil,
        shipping: PayonifyShipping? = nil,
        return_url: String? = nil
    ) {
        self.amount = amount
        self.currency = currency
        self.source = source
        self.description = description
        self.payment_method = payment_method
        self.metadata = metadata
        self.confirm = confirm
        self.receipt_email = receipt_email
        self.statement_descriptor = statement_descriptor
        self.shipping = shipping
        self.return_url = return_url
    }
}

/// Confirm charge request
public struct PayonifyConfirmChargeRequest: Content {
    public let payment_method: PayonifyPaymentMethod    // Required
    public let description: String?                     // Optional
    public let metadata: [String: String]?              // Optional
    public let receipt_email: String?                   // Optional
    public let statement_descriptor: String?            // Optional
    public let shipping: PayonifyShipping?              // Optional
    public let return_url: String?                      // Optional

    public init(
        payment_method: PayonifyPaymentMethod,
        description: String? = nil,
        metadata: [String: String]? = nil,
        receipt_email: String? = nil,
        statement_descriptor: String? = nil,
        shipping: PayonifyShipping? = nil,
        return_url: String? = nil
    ) {
        self.payment_method = payment_method
        self.description = description
        self.metadata = metadata
        self.receipt_email = receipt_email
        self.statement_descriptor = statement_descriptor
        self.shipping = shipping
        self.return_url = return_url
    }
}

/// Cancel charge request
public struct PayonifyCancelChargeRequest: Content {
    public let cancellation_reason: String?             // Optional: "duplicate" | "fraudulent" | "abandoned" | "requested_by_customer"

    public init(cancellation_reason: String? = nil) {
        self.cancellation_reason = cancellation_reason
    }
}

// MARK: - Charges API - Response DTOs

/// Charge response object
public struct PayonifyChargeResponse: Content {
    public let id: String
    public let object: String                           // "charge"
    public let amount: PayonifyAmount
    public let livemode: Bool
    public let created: Int                             // Unix timestamp
    public let paid: Bool
    public let metadata: [String: String]?
    public let client_secret: String
    public let payment_method: String?                  // Payment method ID
    public let description: String?
    public let receipt_email: String?
    public let return_url: String?
    public let statement_descriptor: String?
    public let shipping: PayonifyShipping?
    public let refund_reference: String?
    public let status: String                           // PayonifyChargeStatus
    public let failure_code: String?
    public let failure_reason: String?
    public let cancelled_at: Int?
    public let cancellation_reason: String?
    public let payment_method_details: PayonifyPaymentMethodDetails?

    public init(
        id: String,
        object: String,
        amount: PayonifyAmount,
        livemode: Bool,
        created: Int,
        paid: Bool,
        metadata: [String: String]?,
        client_secret: String,
        payment_method: String?,
        description: String?,
        receipt_email: String?,
        return_url: String?,
        statement_descriptor: String?,
        shipping: PayonifyShipping?,
        refund_reference: String?,
        status: String,
        failure_code: String?,
        failure_reason: String?,
        cancelled_at: Int?,
        cancellation_reason: String?,
        payment_method_details: PayonifyPaymentMethodDetails?
    ) {
        self.id = id
        self.object = object
        self.amount = amount
        self.livemode = livemode
        self.created = created
        self.paid = paid
        self.metadata = metadata
        self.client_secret = client_secret
        self.payment_method = payment_method
        self.description = description
        self.receipt_email = receipt_email
        self.return_url = return_url
        self.statement_descriptor = statement_descriptor
        self.shipping = shipping
        self.refund_reference = refund_reference
        self.status = status
        self.failure_code = failure_code
        self.failure_reason = failure_reason
        self.cancelled_at = cancelled_at
        self.cancellation_reason = cancellation_reason
        self.payment_method_details = payment_method_details
    }
}

/// List charges response
public struct PayonifyListChargesResponse: Content {
    public let object: String                           // "list"
    public let data: [PayonifyChargeResponse]
    public let paging: PayonifyPaging

    public init(object: String, data: [PayonifyChargeResponse], paging: PayonifyPaging) {
        self.object = object
        self.data = data
        self.paging = paging
    }
}

// MARK: - Payouts API - Request DTOs

/// Validate payout recipient request
public struct PayonifyValidatePayoutRequest: Content {
    public let destination: PayonifyDestination

    public init(destination: PayonifyDestination) {
        self.destination = destination
    }
}

/// Create payout request
public struct PayonifyCreatePayoutRequest: Content {
    public let amount: Int                              // Required, min: 100
    public let currency: String                         // Required: "usd" | "zwg"
    public let destination: PayonifyDestination         // Required
    public let description: String?                     // Optional, max 150 chars
    public let metadata: [String: String]?              // Optional, max 5 keys

    public init(
        amount: Int,
        currency: String,
        destination: PayonifyDestination,
        description: String? = nil,
        metadata: [String: String]? = nil
    ) {
        self.amount = amount
        self.currency = currency
        self.destination = destination
        self.description = description
        self.metadata = metadata
    }
}

// MARK: - Payouts API - Response DTOs

/// Validate payout recipient response
public struct PayonifyValidatePayoutResponse: Content {
    public let valid: Bool
    public let recipient: PayonifyRecipient?

    public init(valid: Bool, recipient: PayonifyRecipient?) {
        self.valid = valid
        self.recipient = recipient
    }
}

/// Payout response object
public struct PayonifyPayoutResponse: Content {
    public let id: String                               // Prefix: "po_"
    public let object: String                           // "payout"
    public let amount: PayonifyAmount
    public let created: Int                             // Unix timestamp
    public let livemode: Bool
    public let status: String                           // PayonifyPayoutStatus
    public let destination: PayonifyDestination
    public let description: String?
    public let metadata: [String: String]?
    public let failure_code: String?
    public let failure_message: String?

    public init(
        id: String,
        object: String,
        amount: PayonifyAmount,
        created: Int,
        livemode: Bool,
        status: String,
        destination: PayonifyDestination,
        description: String?,
        metadata: [String: String]?,
        failure_code: String?,
        failure_message: String?
    ) {
        self.id = id
        self.object = object
        self.amount = amount
        self.created = created
        self.livemode = livemode
        self.status = status
        self.destination = destination
        self.description = description
        self.metadata = metadata
        self.failure_code = failure_code
        self.failure_message = failure_message
    }
}

/// List payouts response
public struct PayonifyListPayoutsResponse: Content {
    public let object: String                           // "list"
    public let data: [PayonifyPayoutResponse]
    public let paging: PayonifyPaging

    public init(object: String, data: [PayonifyPayoutResponse], paging: PayonifyPaging) {
        self.object = object
        self.data = data
        self.paging = paging
    }
}

// MARK: - Webhooks

/// Webhook event payload
public struct PayonifyWebhookEvent: Content {
    public let id: String                               // Event ID
    public let object: String                           // "event"
    public let type: String                             // PayonifyEventType
    public let created: Int                             // Unix timestamp
    public let livemode: Bool
    public let data: PayonifyWebhookData

    public init(id: String, object: String, type: String, created: Int, livemode: Bool, data: PayonifyWebhookData) {
        self.id = id
        self.object = object
        self.type = type
        self.created = created
        self.livemode = livemode
        self.data = data
    }
}

/// Webhook data wrapper
public struct PayonifyWebhookData: Content {
    // Note: The object can be either PayonifyChargeResponse or PayonifyPayoutResponse
    // Decode based on event type
    public let object: [String: AnyCodable]

    public init(object: [String: AnyCodable]) {
        self.object = object
    }
}

// MARK: - Error Handling

/// Payonify error response
public struct PayonifyErrorResponse: Content {
    public let type: String                             // Error category
    public let code: String                             // Specific error code
    public let message: String                          // Human-readable explanation
    public let param: String?                           // Field that caused error
    public let doc_url: String?                         // Documentation link

    public init(type: String, code: String, message: String, param: String? = nil, doc_url: String? = nil) {
        self.type = type
        self.code = code
        self.message = message
        self.param = param
        self.doc_url = doc_url
    }
}

// MARK: - Helper for Any Codable (used in webhook data)

public struct AnyCodable: Codable, @unchecked Sendable {
    public let value: Any

    public init(_ value: Any) {
        self.value = value
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let intValue = try? container.decode(Int.self) {
            value = intValue
        } else if let doubleValue = try? container.decode(Double.self) {
            value = doubleValue
        } else if let boolValue = try? container.decode(Bool.self) {
            value = boolValue
        } else if let stringValue = try? container.decode(String.self) {
            value = stringValue
        } else if let arrayValue = try? container.decode([AnyCodable].self) {
            value = arrayValue.map { $0.value }
        } else if let dictValue = try? container.decode([String: AnyCodable].self) {
            value = dictValue.mapValues { $0.value }
        } else {
            value = NSNull()
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch value {
        case let intValue as Int:
            try container.encode(intValue)
        case let doubleValue as Double:
            try container.encode(doubleValue)
        case let boolValue as Bool:
            try container.encode(boolValue)
        case let stringValue as String:
            try container.encode(stringValue)
        case let arrayValue as [Any]:
            try container.encode(arrayValue.map { AnyCodable($0) })
        case let dictValue as [String: Any]:
            try container.encode(dictValue.mapValues { AnyCodable($0) })
        default:
            try container.encodeNil()
        }
    }
}
