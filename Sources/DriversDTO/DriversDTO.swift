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

    public init(name: String, email: String, password: String, confirmPassword: String) {
        self.name = name
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
    }

    public static func validations(_ validations: inout Validations) {
        validations.add("name", as: String.self, is: !.empty)
        validations.add("email", as: String.self, is: .email)
        validations.add("password", as: String.self, is: .count(8...))
    }
}



public struct DriverDTOResponseModel: Content {
   public let name: String
   public let email: String
   public let token: String
   public let driverID: UUID

    public init(name: String, email: String, token: String, driverID: UUID) {
        self.name = name
        self.email = email
        self.token = token
        self.driverID = driverID
    }

}

public struct LoginPageContext: Content {
    public   let title: String
    public   let pageType: String
    public   let errorMessage: String?
    public  let prefillEmail: String?
    public let next: String?
    public init(title: String, pageType: String, errorMessage: String?, prefillEmail: String?, next: String? = nil) {
        self.title = title
        self.pageType = pageType
        self.errorMessage = errorMessage
        self.prefillEmail = prefillEmail
        self.next = next
    }
}

public struct PaginatedTripHistoryResponse: Content {
    public let trips: [TripSummaryContext]
    public let total: Int
    public let page: Int
    public let perPage: Int

    public init(trips: [TripSummaryContext], total: Int, page: Int, perPage: Int) {
        self.trips = trips
        self.total = total
        self.page = page
        self.perPage = perPage
    }
}
