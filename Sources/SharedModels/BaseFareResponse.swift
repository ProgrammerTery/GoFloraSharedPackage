//
//  BaseFareResponse.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 30/11/2025.
//
import Vapor

   public struct BaseFareResponse: Content {
       public let baseFare: Double?

        public init(baseFare: Double?) {
            self.baseFare = baseFare
        }
    }
