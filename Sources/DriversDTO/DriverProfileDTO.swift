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
    public let vehicle_id: UUID?

    public init(driverID: String, driverName: String, driverPhone: String, driverEmail: String, driverAddress: String, registrationDate: Date, driverLicense: String, vehicle_id: UUID? = nil ) {
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

public struct EditProfilePageContext: Content {
    public let title: String
    public let pageType: String
    public let driver: DriverProfileDTO
    public let errorMessage: String?

    public init(title: String, pageType: String, driver: DriverProfileDTO, errorMessage: String?) {
        self.title = title
        self.pageType = pageType
        self.driver = driver
        self.errorMessage = errorMessage
    }
}

public struct ProfileUpdateFormData: Content {
    public let driverName: String
    public let driverPhone: String
    public let driverEmail: String
    public let driverAddress: String

    public init(driverName: String, driverPhone: String, driverEmail: String, driverAddress: String) {
        self.driverName = driverName
        self.driverPhone = driverPhone
        self.driverEmail = driverEmail
        self.driverAddress = driverAddress
    }
}

public struct ProfilePageContext: Content {
    public let title: String
    public let pageType: String
    public let driver: DriverProfileDTO
    public let stats: DriversDriverStatsContext
    public let successMessage: String?
    public let errorMessage: String?
    public let initial: String?

    public init(title: String, pageType: String, driver: DriverProfileDTO, stats: DriversDriverStatsContext, successMessage: String?, errorMessage: String?, initial: String?) {
        self.title = title
        self.pageType = pageType
        self.driver = driver
        self.stats = stats
        self.successMessage = successMessage
        self.errorMessage = errorMessage
        self.initial = initial
    }
}
