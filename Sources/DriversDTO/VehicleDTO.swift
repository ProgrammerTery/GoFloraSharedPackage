//
//  VehicleDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 22/11/2025.
//
import Vapor

public struct VehicleDTO: Content {
    public let id : UUID?
    public let registrationNumber: String
    public let licensePlateNumber: String
    public let  make: String
    public let model: String
    public let yearOfManufacture: String
    public let bodyType: String
    public let color: String
    public let engineSize: String
    public let fuelType: String
    public let transmissionType: String
    public let  seatingCapacity: String
    public let ownerName: String
    public let  ownerAddress: String
    public let  contactInformation: String
    public let insuranceDetails: String
    public let vehicleHistory: String
    public let emissionsStandards: String
    public let servicetypeId: UUID

    public init(id: UUID?, registrationNumber: String, licensePlateNumber: String, make: String, model: String, yearOfManufacture: String, bodyType: String, color: String, engineSize: String, fuelType: String, transmissionType: String, seatingCapacity: String, ownerName: String, ownerAddress: String, contactInformation: String, insuranceDetails: String, vehicleHistory: String, emissionsStandards: String, servicetypeId: UUID) {
        self.id = id
        self.registrationNumber = registrationNumber
        self.licensePlateNumber = licensePlateNumber
        self.make = make
        self.model = model
        self.yearOfManufacture = yearOfManufacture
        self.bodyType = bodyType
        self.color = color
        self.engineSize = engineSize
        self.fuelType = fuelType
        self.transmissionType = transmissionType
        self.seatingCapacity = seatingCapacity
        self.ownerName = ownerName
        self.ownerAddress = ownerAddress
        self.contactInformation = contactInformation
        self.insuranceDetails = insuranceDetails
        self.vehicleHistory = vehicleHistory
        self.emissionsStandards = emissionsStandards
        self.servicetypeId = servicetypeId
    }
}


// MARK: - Vehicle Registration DTOs

public struct ServiceTypeSelectionContext: Content {
    public let title: String
    public let pageType: String
    public let driverID: String
    public let driverName: String
    public let serviceTypes: [ServiceTypeContext]
    public let errorMessage: String?
    public init(title: String, pageType: String, driverID: String, driverName: String, serviceTypes: [ServiceTypeContext], errorMessage: String?) {
        self.title = title
        self.pageType = pageType
        self.driverID = driverID
        self.driverName = driverName
        self.serviceTypes = serviceTypes
        self.errorMessage = errorMessage
    }
}

public struct ServiceTypeContext: Content {
    public let id: String
    public let name: String
    public let description: String
    public let baseRate: Double
    public init(id: String, name: String, description: String, baseRate: Double) {
        self.id = id
        self.name = name
        self.description = description
        self.baseRate = baseRate
    }
}

public struct ServiceTypeSelectionFormData: Content {
    public  let serviceTypeID: String

    public init(serviceTypeID: String) {
        self.serviceTypeID = serviceTypeID
    }
}

public struct VehicleRegistrationPageContext: Content {
    public   let title: String
    public   let pageType: String
    public   let driverID: String
    public   let driverName: String
    public  let selectedServiceType: ServiceTypeContext?
    public   let errorMessage: String?

    public init(title: String, pageType: String, driverID: String, driverName: String, selectedServiceType: ServiceTypeContext?, errorMessage: String?) {
        self.title = title
        self.pageType = pageType
        self.driverID = driverID
        self.driverName = driverName
        self.selectedServiceType = selectedServiceType
        self.errorMessage = errorMessage
    }
}

public struct VehicleRegistrationFormData: Content {
    public  let make: String
    public  let model: String
    public  let year: Int
    public  let licensePlate: String
    public  let color: String
    public  let serviceTypeID: String

    public init(make: String, model: String, year: Int, licensePlate: String, color: String, serviceTypeID: String) {
        self.make = make
        self.model = model
        self.year = year
        self.licensePlate = licensePlate
        self.color = color
        self.serviceTypeID = serviceTypeID
    }
}

public struct VehicleConfirmationContext: Content {
    public let title: String
    public let pageType: String
    public let driverName: String
    public let vehicle: VehicleContext
    public let serviceType: ServiceTypeContext

    public init(title: String, pageType: String, driverName: String, vehicle: VehicleContext, serviceType: ServiceTypeContext) {
        self.title = title
        self.pageType = pageType
        self.driverName = driverName
        self.vehicle = vehicle
        self.serviceType = serviceType
    }
}

public struct VehicleContext: Content {
    public  let make: String
    public let model: String
    public let year: Int
    public let licensePlate: String
    public let color: String

    public init(make: String, model: String, year: Int, licensePlate: String, color: String) {
        self.make = make
        self.model = model
        self.year = year
        self.licensePlate = licensePlate
        self.color = color
    }
}
