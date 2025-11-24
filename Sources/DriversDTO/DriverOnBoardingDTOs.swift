//
//  DriverOnBoardingDTOs.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 24/11/2025.
//

import Vapor

// MARK: - Onboarding DTOs

public struct WelcomePageContext: Content {
    public let title: String
    public let pageType: String

    public init(title: String, pageType: String) {
        self.title = title
        self.pageType = pageType
    }
}

public struct JoinDriverPageContext: Content {
    public let title: String
    public let pageType: String

    public init(title: String, pageType: String) {
        self.title = title
        self.pageType = pageType
    }
}

public struct SignupPageContext: Content {
    public let title: String
    public let pageType: String
    public let errorMessage: String?

    public init(title: String, pageType: String, errorMessage: String?) {
        self.title = title
        self.pageType = pageType
        self.errorMessage = errorMessage
    }
}

public struct DriverRegistrationPageContext: Content {
    public let title: String
    public let pageType: String
    public let errorMessage: String?
    public let prefillData: DriverProfileDTO?

    public init(title: String, pageType: String, errorMessage: String?, prefillData: DriverProfileDTO?) {
        self.title = title
        self.pageType = pageType
        self.errorMessage = errorMessage
        self.prefillData = prefillData
    }
}


public struct VehicleChoicePageContext: Content {
    public let title: String
    public let pageType: String
    public let driverID: String
    public let driverName: String

    public init(title: String, pageType: String, driverID: String, driverName: String) {
        self.title = title
        self.pageType = pageType
        self.driverID = driverID
        self.driverName = driverName
    }
}

public struct VehicleChoiceFormData: Content {
    public let registerVehicleNow: Bool

    public init(registerVehicleNow: Bool) {
        self.registerVehicleNow = registerVehicleNow
    }
}

public struct RegistrationSuccessContext: Content {
    public let title: String
    public let pageType: String
    public let driverName: String
    public let hasVehicle: Bool
    public let nextStepURL: String

    public init(title: String, pageType: String, driverName: String, hasVehicle: Bool, nextStepURL: String) {
        self.title = title
        self.pageType = pageType
        self.driverName = driverName
        self.hasVehicle = hasVehicle
        self.nextStepURL = nextStepURL
    }
}
