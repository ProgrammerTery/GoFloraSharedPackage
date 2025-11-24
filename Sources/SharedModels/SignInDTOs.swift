//
//  SignInDTOs.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 24/11/2025.
//
import Vapor

public struct SignInRequest: Content {
    public  let username: String
    public  let password: String

    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}

public struct SignUpRequest: Content {
    public let name: String
    public let email: String
    public let phone: String?
    public let password: String
    public let confirmPassword: String

    public init(name: String, email: String, phone: String?, password: String, confirmPassword: String) {
        self.name = name
        self.email = email
        self.phone = phone
        self.password = password
        self.confirmPassword = confirmPassword
    }
}
