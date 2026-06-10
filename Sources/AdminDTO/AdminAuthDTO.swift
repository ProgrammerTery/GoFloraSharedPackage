import Foundation
import Vapor

// MARK: - Admin Authentication DTOs

/// Admin login request
public struct AdminLoginRequest: Content {
    public let email: String
    public let password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

/// Admin signup request
public struct AdminSignupRequest: Content {
    public let name: String
    public let email: String
    public let password: String
    public let priviledgeLevel: String // "admin" or "superadmin"
    public let department: String?
    
    public init(name: String, email: String, password: String, priviledgeLevel: String, department: String? = nil) {
        self.name = name
        self.email = email
        self.password = password
        self.priviledgeLevel = priviledgeLevel
        self.department = department
    }
}

/// Admin authentication response
public struct AdminAuthResponse: Content {
    public let token: String
    public let expiresAt: Date
    public let admin: AdminDTO
    
    public init(token: String, expiresAt: Date, admin: AdminDTO) {
        self.token = token
        self.expiresAt = expiresAt
        self.admin = admin
    }
}

/// Admin profile DTO
public struct AdminDTO: Content {
    public let id: UUID?
    public let name: String
    public let email: String
    public let priviledgeLevel: String
    public let department: String?
    public let isActive: Bool
    public let createdAt: Date?
    public let updatedAt: Date?
    
    public init(
        id: UUID? = nil,
        name: String,
        email: String,
        priviledgeLevel: String,
        department: String? = nil,
        isActive: Bool = true,
        createdAt: Date? = nil,
        updatedAt: Date? = nil
    ) {
        self.id = id
        self.name = name
        self.email = email
        self.priviledgeLevel = priviledgeLevel
        self.department = department
        self.isActive = isActive
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

/// Change password request
public struct ChangePasswordRequest: Content {
    public let oldPassword: String
    public let newPassword: String
    
    public init(oldPassword: String, newPassword: String) {
        self.oldPassword = oldPassword
        self.newPassword = newPassword
    }
}

/// Token verification response
public struct TokenVerificationResponse: Content {
    public let valid: Bool
    public let admin: AdminDTO?
    
    public init(valid: Bool, admin: AdminDTO? = nil) {
        self.valid = valid
        self.admin = admin
    }
}
