//
//  VehicleDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 22/11/2025.
//
import Vapor

struct VehicleDTO: Content {
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
