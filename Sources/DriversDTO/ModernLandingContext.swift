//
//  ModernLandingContext.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 26/11/2025.
//
import Vapor

public struct ModernLandingContext: Content {
    public let title: String
    public let heroTitle: String
    public let heroSubtitle: String
    public let stats: LiveStatsContext
    public let features: [FeatureContext]
    public let testimonials: [TestimonialContext]
    public let earnings: EarningsContext

    public init(title: String, heroTitle: String, heroSubtitle: String, stats: LiveStatsContext, features: [FeatureContext], testimonials: [TestimonialContext], earnings: EarningsContext) {
        self.title = title
        self.heroTitle = heroTitle
        self.heroSubtitle = heroSubtitle
        self.stats = stats
        self.features = features
        self.testimonials = testimonials
        self.earnings = earnings
    }
}

public struct LiveStatsContext: Content {
    public let totalDrivers: String
    public let avgEarnings: String
    public let cities: String
    public let satisfaction: String

    public init(totalDrivers: String, avgEarnings: String, cities: String, satisfaction: String) {
        self.totalDrivers = totalDrivers
        self.avgEarnings = avgEarnings
        self.cities = cities
        self.satisfaction = satisfaction
    }
}

public struct FeatureContext: Content {
    public let icon: String
    public let title: String
    public let description: String
    public let highlight: String

    public init(icon: String, title: String, description: String, highlight: String) {
        self.icon = icon
        self.title = title
        self.description = description
        self.highlight = highlight
    }
}

public struct TestimonialContext: Content {
    public let name: String
    public let role: String
    public let image: String
    public let rating: Int
    public let text: String
    public let earnings: String
    public let location: String

    public init(name: String, role: String, image: String, rating: Int, text: String, earnings: String, location: String) {
        self.name = name
        self.role = role
        self.image = image
        self.rating = rating
        self.text = text
        self.earnings = earnings
        self.location = location
    }
}

public struct EarningsContext: Content {
    public let hourlyRange: String
    public let weeklyPotential: String
    public let monthlyPotential: String
    public let bonusOpportunities: [String]

    public init(hourlyRange: String, weeklyPotential: String, monthlyPotential: String, bonusOpportunities: [String]) {
        self.hourlyRange = hourlyRange
        self.weeklyPotential = weeklyPotential
        self.monthlyPotential = monthlyPotential
        self.bonusOpportunities = bonusOpportunities
    }
}
