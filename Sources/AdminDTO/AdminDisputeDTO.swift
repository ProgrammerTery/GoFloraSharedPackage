import Foundation
import Vapor

// MARK: - Dispute Management DTOs

/// Dispute list response
public struct AdminDisputeListResponse: Content {
    public let disputes: [AdminDisputeDTO]
    public let total: Int
    public let page: Int
    public let perPage: Int
    
    public init(disputes: [AdminDisputeDTO], total: Int, page: Int, perPage: Int) {
        self.disputes = disputes
        self.total = total
        self.page = page
        self.perPage = perPage
    }
}

/// Admin dispute DTO
public struct AdminDisputeDTO: Content {
    public let id: String
    public let tripId: String?
    public let tripRequestId: String?
    public let disputeType: String
    public let status: String
    public let initiatedBy: String // "client" or "driver"
    public let initiatedByName: String
    public let initiatedById: String
    public let againstName: String
    public let againstId: String
    public let description: String
    public let evidence: [DisputeEvidenceDTO]?
    public let hasCounterDispute: Bool
    public let counterReason: String?
    public let resolution: DisputeResolutionDTO?
    public let assignedTo: String?
    public let createdAt: String
    public let updatedAt: String?
    
    public init(
        id: String,
        tripId: String? = nil,
        tripRequestId: String? = nil,
        disputeType: String,
        status: String,
        initiatedBy: String,
        initiatedByName: String,
        initiatedById: String,
        againstName: String,
        againstId: String,
        description: String,
        evidence: [DisputeEvidenceDTO]? = nil,
        hasCounterDispute: Bool = false,
        counterReason: String? = nil,
        resolution: DisputeResolutionDTO? = nil,
        assignedTo: String? = nil,
        createdAt: String,
        updatedAt: String? = nil
    ) {
        self.id = id
        self.tripId = tripId
        self.tripRequestId = tripRequestId
        self.disputeType = disputeType
        self.status = status
        self.initiatedBy = initiatedBy
        self.initiatedByName = initiatedByName
        self.initiatedById = initiatedById
        self.againstName = againstName
        self.againstId = againstId
        self.description = description
        self.evidence = evidence
        self.hasCounterDispute = hasCounterDispute
        self.counterReason = counterReason
        self.resolution = resolution
        self.assignedTo = assignedTo
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

/// Dispute evidence DTO
public struct DisputeEvidenceDTO: Content {
    public let type: String
    public let url: String
    public let uploadedAt: String?
    
    public init(type: String, url: String, uploadedAt: String? = nil) {
        self.type = type
        self.url = url
        self.uploadedAt = uploadedAt
    }
}

/// Dispute resolution DTO
public struct DisputeResolutionDTO: Content {
    public let decision: String
    public let refundAmount: Double?
    public let penaltyAmount: Double?
    public let penalizedParty: String?
    public let resolutionNotes: String
    public let resolvedBy: String
    public let resolvedAt: String
    
    public init(
        decision: String,
        refundAmount: Double? = nil,
        penaltyAmount: Double? = nil,
        penalizedParty: String? = nil,
        resolutionNotes: String,
        resolvedBy: String,
        resolvedAt: String
    ) {
        self.decision = decision
        self.refundAmount = refundAmount
        self.penaltyAmount = penaltyAmount
        self.penalizedParty = penalizedParty
        self.resolutionNotes = resolutionNotes
        self.resolvedBy = resolvedBy
        self.resolvedAt = resolvedAt
    }
}

/// Resolve dispute request
public struct ResolveDisputeRequest: Content {
    public let decision: String
    public let refundAmount: Double?
    public let penaltyAmount: Double?
    public let penalizedParty: String?
    public let resolutionNotes: String
    
    public init(
        decision: String,
        refundAmount: Double? = nil,
        penaltyAmount: Double? = nil,
        penalizedParty: String? = nil,
        resolutionNotes: String
    ) {
        self.decision = decision
        self.refundAmount = refundAmount
        self.penaltyAmount = penaltyAmount
        self.penalizedParty = penalizedParty
        self.resolutionNotes = resolutionNotes
    }
}

/// Escalate dispute request
public struct EscalateDisputeRequest: Content {
    public let escalatedTo: String
    public let reason: String
    
    public init(escalatedTo: String, reason: String) {
        self.escalatedTo = escalatedTo
        self.reason = reason
    }
}

/// Assign dispute request
public struct AssignDisputeRequest: Content {
    public let assignedTo: String
    
    public init(assignedTo: String) {
        self.assignedTo = assignedTo
    }
}

/// Add dispute note request
public struct AddDisputeNoteRequest: Content {
    public let note: String
    
    public init(note: String) {
        self.note = note
    }
}

/// Dispute statistics
public struct DisputeStatsDTO: Content {
    public let totalDisputes: Int
    public let pendingCount: Int
    public let escalatedCount: Int
    public let resolvedCount: Int
    public let dismissedCount: Int
    public let averageResolutionTimeHours: Double
    public let byType: [String: Int]
    
    public init(
        totalDisputes: Int,
        pendingCount: Int,
        escalatedCount: Int,
        resolvedCount: Int,
        dismissedCount: Int,
        averageResolutionTimeHours: Double,
        byType: [String: Int]
    ) {
        self.totalDisputes = totalDisputes
        self.pendingCount = pendingCount
        self.escalatedCount = escalatedCount
        self.resolvedCount = resolvedCount
        self.dismissedCount = dismissedCount
        self.averageResolutionTimeHours = averageResolutionTimeHours
        self.byType = byType
    }
}
