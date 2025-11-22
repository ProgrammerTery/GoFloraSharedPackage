//
//  TransportService.swift
//  GoFloraSharedPackage
//
//  Created by Terence Changadeya on 23/11/2025.
//
import Vapor

public struct TransportService: Content {
    public  let id: UUID?
    public let name: String
    public  let imageUrl : String
    public  let description: String
    public let capacity : Int
    public  let basePrice : Double
    public let rating : Double

    public init(id: UUID?, name: String, imageUrl: String, description: String, capacity: Int, basePrice: Double, rating: Double) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.description = description
        self.capacity = capacity
        self.basePrice = basePrice
        self.rating = rating
    }
}
public struct TransportServiceContext: Encodable {
    public let title : String
    public  let services : [TransportService]

    public init(title: String, services: [TransportService]) {
        self.title = title
        self.services = services
    }
}

//TODO: populate into a database sometime:
let services: [TransportService] = [
    TransportService(id: UUID(), name: "Bike", imageUrl: "bike_image_url", description: "A fast and efficient bike for small deliveries.", capacity: 1, basePrice: 5.0, rating: 4.5),
    TransportService(id: UUID(), name: "Car", imageUrl: "car_image_url", description: "A comfortable car for medium-sized deliveries.", capacity: 4, basePrice: 10.0, rating: 4.7),
    TransportService(id: UUID(), name: "Van", imageUrl: "van_image_url", description: "A spacious van for large deliveries.", capacity: 10, basePrice: 20.0, rating: 4.6),
    TransportService(id: UUID(), name: "Truck", imageUrl: "truck_image_url", description: "A heavy-duty truck for bulk deliveries.", capacity: 20, basePrice: 50.0, rating: 4.4)
]
