//
//  ClientProfileDTO.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 30/12/2025.
//
import Vapor

public struct ClientProfileDTO: Content {
    public let clientID: String
    public let clientName: String
    public let nickName: String?
    public let clientPhone: String
    public let clientEmail: String
    public let clientAddress: String
    public let bio: String?
    public let profileImage: String?
    public init(clientID: String, clientName: String, clientPhone: String, nickname: String? = nil, clientEmail: String, clientAddress: String, bio: String?, profileImage: String? = nil) {
        self.clientID = clientID
        self.clientName = clientName
        self.nickName = nickname
        self.clientPhone = clientPhone
        self.clientEmail = clientEmail
        self.clientAddress = clientAddress
        self.bio = bio
        self.profileImage = profileImage
    }
}


public struct UpdateClientProfileRequest: Content {

    public let nickName: String?
    public let clientPhone: String?
    public let clientEmail: String?
    public let clientAddress: String?
    public let bio: String?
    public let profileImage: String?

    public init(nickName: String? = nil, clientPhone: String? = nil, clientEmail: String? = nil, clientAddress: String? = nil, bio: String? = nil, profileImage: String? = nil) {
        self.nickName = nickName
        self.clientPhone = clientPhone
        self.clientEmail = clientEmail
        self.clientAddress = clientAddress
        self.bio = bio
        self.profileImage = profileImage
    }
}


public struct EditProfilePageContext: Content {
    public let title: String
    public let pageType: String
    public let client: ClientProfileDTO
    public let errorMessage: String?

    public init(title: String, pageType: String, client: ClientProfileDTO, errorMessage: String?) {
        self.title = title
        self.pageType = pageType
        self.client = client
        self.errorMessage = errorMessage
    }
}

public struct ProfileUpdateFormData: Content {
    public let clientName: String
    public let nickName: String
    public let clientPhone: String
    public let clientEmail: String
    public let clientAddress: String
    public let profileImage: String?
    public let bio: String?

    public init(clientName: String, nickName: String, clientPhone: String, clientEmail: String, clientAddress: String, profileImage: String? = nil, bio : String? = nil) {
        self.clientName = clientName
        self.nickName = nickName
        self.clientPhone = clientPhone
        self.clientEmail = clientEmail
        self.clientAddress = clientAddress
        self.bio = bio
        self.profileImage = profileImage
    }

}

public struct ProfilePageContext: Content {
    public let title: String
    public let pageType: String
    public let client: ClientProfileDTO
  //  public let stats: statContext
    public let successMessage: String?
    public let errorMessage: String?
    public let initial: String?

    public init(title: String, pageType: String, client: ClientProfileDTO, successMessage: String? = nil, errorMessage: String? = nil, initial: String? = nil) {
        self.title = title
        self.pageType = pageType
        self.client = client
        self.successMessage = successMessage
        self.errorMessage = errorMessage
        self.initial = initial
    }

}
