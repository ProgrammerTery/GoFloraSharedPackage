//
//  ClientTokenDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya
//

import Vapor

public struct ClientTokenDTO: Content {
    public let id: UUID?
    public let tokenValue: String
    public let expiresAt: Date?
    public let clientID: UUID
    
    public init(id: UUID?, tokenValue: String, expiresAt: Date?, clientID: UUID) {
        self.id = id
        self.tokenValue = tokenValue
        self.expiresAt = expiresAt
        self.clientID = clientID
    }
}

public struct ClientDTOResponseModel: Content {
    public let name: String
    public let email: String
    public let token: String
    
    public init(name: String, email: String, token: String) {
        self.name = name
        self.email = email
        self.token = token
    }
}

public struct ClientTokenResponse: Content {
    public let token: String
    
    public init(token: String) {
        self.token = token
    }
}
