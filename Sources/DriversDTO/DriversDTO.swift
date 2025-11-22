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

    public static func validations(_ validations: inout Validations) {
        validations.add("name", as: String.self, is: !.empty)
        validations.add("email", as: String.self, is: .email)
        validations.add("password", as: String.self, is: .count(8...))
    }
}

public struct DriverProfileDTO: Content {
    public let driverID: String
    public let driverName: String
    public let driverPhone: String
    public let driverEmail: String
    public let driverAddress: String
    public let registrationDate: Date
    public let driverLicense: String
    public let vehicle_id: UUID
    
    public init(driverID: String, driverName: String, driverPhone: String, driverEmail: String, driverAddress: String, registrationDate: Date, driverLicense: String, vehicle_id: UUID) {
        self.driverID = driverID
        self.driverName = driverName
        self.driverPhone = driverPhone
        self.driverEmail = driverEmail
        self.driverAddress = driverAddress
        self.registrationDate = registrationDate
        self.driverLicense = driverLicense
        self.vehicle_id = vehicle_id
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
    let name: String
    let email: String
    let token: String

}
