//
//  DriverTripRequestPivotDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 23/11/2025.
//

import Vapor

public struct DriverTripRequestPivotDTO: Content {
   public let id: UUID?
   public  let driverID: UUID
   public let tripRequestID: UUID

    public init(id: UUID?, driverID: UUID, tripRequestID: UUID) {
        self.id = id
        self.driverID = driverID
        self.tripRequestID = tripRequestID
    }


}
