//
//  DriversDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya
//

import Vapor
import Foundation


public struct DriverDTO: Content, Validatable {
    public let name: String
    public let email: String
    public let password: String
    public let confirmPassword: String

    public init(name: String, email: String, password: String, confirmPassword: String) {
        self.name = name
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
    }

    public static func validations(_ validations: inout Validations) {
        validations.add("name", as: String.self, is: !.empty)
        validations.add("email", as: String.self, is: .email)
        validations.add("password", as: String.self, is: .count(8...))
    }
}


public struct DriverTripRequestPivotDTO: Content {
    public let id: UUID?
    public let driverID: UUID
    public let tripRequestID: UUID
    public let bidAmount: Double?
    public let isApproved: Bool
    
    public init(id: UUID?, driverID: UUID, tripRequestID: UUID, bidAmount: Double? = nil, isApproved: Bool = false) {
        self.id = id
        self.driverID = driverID
        self.tripRequestID = tripRequestID
        self.bidAmount = bidAmount
        self.isApproved = isApproved
    }
}

public struct DriverDTOResponseModel: Content {
   public let name: String
   public let email: String
   public let token: String

    public init(name: String, email: String, token: String) {
        self.name = name
        self.email = email
        self.token = token
    }

}
