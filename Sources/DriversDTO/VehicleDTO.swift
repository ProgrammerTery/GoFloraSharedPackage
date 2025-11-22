//
//  VehicleDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 22/11/2025.
//
import Vapor

struct VehicleDTO: Content {
    let id : UUID?
    let registrationNumber: String
    let licensePlateNumber: String
    let  make: String
    let model: String
    let yearOfManufacture: String
    let bodyType: String
    let color: String
    let engineSize: String
    let fuelType: String
    let transmissionType: String
    let  seatingCapacity: String
    let ownerName: String
    let  ownerAddress: String
    let  contactInformation: String
    let insuranceDetails: String
    let vehicleHistory: String
    let emissionsStandards: String
    let servicetypeId: UUID
}
