//
//  PopularLocation.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 23/11/2025.
//

import Vapor

/// Popular locations in Victoria Falls for quick selection
public struct PopularLocation: Content, Codable {
    public let id: String
    public  let name: String
    public  let category: String
    public  let address: String
    public let latitude: Double
    public let longitude: Double
    public let city: String
    public  let icon: String
    public var usageCount: Int

    public  init(id: String, name: String, category: String, address: String, latitude: Double, longitude: Double, city: String, icon: String, usageCount: Int = 0) {
        self.id = id
        self.name = name
        self.category = category
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
        self.city = city
        self.icon = icon
        self.usageCount = usageCount
    }
}

/// Victoria Falls popular locations seed data
public struct VictoriaFallsLocations {
   public static let all: [PopularLocation] = [
        // Airports
        PopularLocation(
            id: "vfa-airport",
            name: "Victoria Falls International Airport",
            category: "airport",
            address: "Victoria Falls Airport Road, Victoria Falls",
            latitude: -18.0958,
            longitude: 25.8390,
            city: "Victoria Falls",
            icon: "✈️"
        ),
        
        // Major Attractions
        PopularLocation(
            id: "vfa-falls-main",
            name: "Victoria Falls (Main Entrance)",
            category: "attraction",
            address: "Park Way, Victoria Falls National Park",
            latitude: -17.9243,
            longitude: 25.8572,
            city: "Victoria Falls",
            icon: "🌊"
        ),
        PopularLocation(
            id: "vfa-devils-pool",
            name: "Devil's Pool",
            category: "attraction",
            address: "Livingstone Island, Victoria Falls",
            latitude: -17.9256,
            longitude: 25.8561,
            city: "Victoria Falls",
            icon: "🏊"
        ),
        PopularLocation(
            id: "vfa-knife-edge",
            name: "Knife Edge Bridge",
            category: "attraction",
            address: "Victoria Falls National Park",
            latitude: -17.9251,
            longitude: 25.8580,
            city: "Victoria Falls",
            icon: "🌉"
        ),
        
        // Hotels & Resorts
        PopularLocation(
            id: "vfa-elephant-hills",
            name: "Elephant Hills Resort",
            category: "hotel",
            address: "Squire Cummings Road, Victoria Falls",
            latitude: -17.9328,
            longitude: 25.8225,
            city: "Victoria Falls",
            icon: "🏨"
        ),
        PopularLocation(
            id: "vfa-victoria-falls-hotel",
            name: "Victoria Falls Hotel",
            category: "hotel",
            address: "1 Mallett Drive, Victoria Falls",
            latitude: -17.9312,
            longitude: 25.8274,
            city: "Victoria Falls",
            icon: "🏨"
        ),
        PopularLocation(
            id: "vfa-kingdom-hotel",
            name: "Kingdom at Victoria Falls",
            category: "hotel",
            address: "1 Mallett Drive, Victoria Falls",
            latitude: -17.9297,
            longitude: 25.8253,
            city: "Victoria Falls",
            icon: "🏨"
        ),
        PopularLocation(
            id: "vfa-ilala-lodge",
            name: "Ilala Lodge Hotel",
            category: "hotel",
            address: "411 Livingstone Way, Victoria Falls",
            latitude: -17.9305,
            longitude: 25.8289,
            city: "Victoria Falls",
            icon: "🏨"
        ),
        
        // Town & Shopping
        PopularLocation(
            id: "vfa-town-center",
            name: "Victoria Falls Town Center",
            category: "town",
            address: "Livingstone Way, Victoria Falls",
            latitude: -17.9313,
            longitude: 25.8206,
            city: "Victoria Falls",
            icon: "🏙️"
        ),
        PopularLocation(
            id: "vfa-craft-market",
            name: "Victoria Falls Craft Village",
            category: "shopping",
            address: "Adam Stander Drive, Victoria Falls",
            latitude: -17.9281,
            longitude: 25.8183,
            city: "Victoria Falls",
            icon: "🛍️"
        ),
        
        // Restaurants & Entertainment
        PopularLocation(
            id: "vfa-boma",
            name: "The Boma - Dinner & Drum Show",
            category: "restaurant",
            address: "Victoria Falls Safari Lodge, Victoria Falls",
            latitude: -17.9142,
            longitude: 25.7875,
            city: "Victoria Falls",
            icon: "🍽️"
        ),
        PopularLocation(
            id: "vfa-lookout-cafe",
            name: "Lookout Cafe",
            category: "restaurant",
            address: "Batoka Gorge, Victoria Falls",
            latitude: -17.9175,
            longitude: 25.8542,
            city: "Victoria Falls",
            icon: "☕"
        ),
        
        // Activities
        PopularLocation(
            id: "vfa-victoria-falls-bridge",
            name: "Victoria Falls Bridge (Bungee Jumping)",
            category: "activity",
            address: "Victoria Falls Bridge",
            latitude: -17.9311,
            longitude: 25.8572,
            city: "Victoria Falls",
            icon: "🪂"
        ),
        PopularLocation(
            id: "vfa-gorge-swing",
            name: "Gorge Swing",
            category: "activity",
            address: "Victoria Falls Bridge",
            latitude: -17.9305,
            longitude: 25.8568,
            city: "Victoria Falls",
            icon: "🎢"
        ),
        PopularLocation(
            id: "vfa-white-water-rafting",
            name: "White Water Rafting Start Point",
            category: "activity",
            address: "Batoka Gorge, Victoria Falls",
            latitude: -17.9389,
            longitude: 25.8628,
            city: "Victoria Falls",
            icon: "🚣"
        ),
        
        // Border & Travel
        PopularLocation(
            id: "vfa-border-post",
            name: "Victoria Falls Border Post (Zimbabwe)",
            category: "border",
            address: "Border Road, Victoria Falls",
            latitude: -17.9356,
            longitude: 25.8653,
            city: "Victoria Falls",
            icon: "🛂"
        ),
        
        // Additional Hotels
        PopularLocation(
            id: "vfa-safari-lodge",
            name: "Victoria Falls Safari Lodge",
            category: "hotel",
            address: "Squire Cummings Road, Victoria Falls",
            latitude: -17.9142,
            longitude: 25.7875,
            city: "Victoria Falls",
            icon: "🏨"
        ),
        PopularLocation(
            id: "vfa-azambezi",
            name: "A'Zambezi River Lodge",
            category: "hotel",
            address: "Zambezi Drive, Victoria Falls",
            latitude: -17.8856,
            longitude: 25.8333,
            city: "Victoria Falls",
            icon: "🏨"
        ),
        
        // Wildlife
        PopularLocation(
            id: "vfa-elephant-sanctuary",
            name: "Victoria Falls Elephant Sanctuary",
            category: "attraction",
            address: "Victoria Falls",
            latitude: -17.8928,
            longitude: 25.8247,
            city: "Victoria Falls",
            icon: "🐘"
        ),
        PopularLocation(
            id: "vfa-wildlife-trust",
            name: "Victoria Falls Wildlife Trust",
            category: "attraction",
            address: "Parkway Drive, Victoria Falls",
            latitude: -17.9089,
            longitude: 25.8139,
            city: "Victoria Falls",
            icon: "🦁"
        )
    ]
    
    /// Get locations by category
   public static func byCategory(_ category: String) -> [PopularLocation] {
        return all.filter { $0.category == category }
    }
    
    /// Search locations by name or address
   public static func search(_ query: String) -> [PopularLocation] {
        let lowercaseQuery = query.lowercased()
        return all.filter { location in
            location.name.lowercased().contains(lowercaseQuery) ||
            location.address.lowercased().contains(lowercaseQuery)
        }
    }
    
    /// Get most popular locations
  public  static func popular(limit: Int = 10) -> [PopularLocation] {
        return Array(all.sorted { $0.usageCount > $1.usageCount }.prefix(limit))
    }
}
