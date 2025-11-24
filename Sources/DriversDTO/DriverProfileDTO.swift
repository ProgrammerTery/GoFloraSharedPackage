//
//  DriverProfileDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 24/11/2025.
//

import Vapor

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


public struct UpdateDriverProfileRequest: Content {

    public let driverName: String?
    public let driverPhone: String?
    public let driverEmail: String?
    public let driverAddress: String?
    public let driverLicense: String?
    public let vehicle_id: UUID?

    public init(driverName: String?, driverPhone: String?, driverEmail: String?, driverAddress: String?, driverLicense: String?, vehicle_id: UUID?) {
        self.driverName = driverName
        self.driverPhone = driverPhone
        self.driverEmail = driverEmail
        self.driverAddress = driverAddress
        self.driverLicense = driverLicense
        self.vehicle_id = vehicle_id
    }
}

