//
//  CustomerTransportServiceDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 13/12/2025.
//
import Vapor

// MARK: - Transport Service

public struct CustomerTransportServiceDTO: Content {
    public let transportServiceType: String
    public let id: UUID?
    public let baseFare: Double?
    public let description: String?
    public let isTransfer: Bool // Indicates if the service is a transfer type or available for regular trips

    public init(transportServiceType: String, id: UUID?, baseFare: Double? = nil, description: String? = nil, isTransfer: Bool = false) {
        self.transportServiceType = transportServiceType
        self.id = id
        self.baseFare = baseFare
        self.description = description
        self.isTransfer = isTransfer

    }
}
