//
//  TripCancellationResponse.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 23/11/2025.
//

import Vapor

public struct TripCancellationResponse: Content {
   public let success: Bool
    public  let message: String
    public let cancellationId: UUID?

    public init(success: Bool, message: String,cancellationId: UUID?) {
        self.success = success
        self.message = message
        self.cancellationId = cancellationId
    }
}
