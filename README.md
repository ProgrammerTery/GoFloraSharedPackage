# GoFloraSharedPackage

Shared Data Transfer Objects (DTOs) for GoFlora Transport Services ecosystem.

## 📦 Overview

This package provides reusable DTOs across all GoFlora microservices, ensuring consistent data structures and type safety.

## 🏗️ Structure

```
GoFloraSharedPackage/
├── Sources/
│   ├── ClientDTO/          # Client-related DTOs
│   ├── DriversDTO/         # Driver-related DTOs
│   ├── PaymentDTO/         # Payment & billing DTOs
│   ├── TripDTO/            # Trip request DTOs
│   └── SharedModels/       # Common models
└── Package.swift
```

## 📥 Installation

### Swift Package Manager

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/ProgrammerTery/GoFloraSharedPackage.git", from: "1.0.0")
]

targets: [
    .target(
        name: "YourTarget",
        dependencies: [
            .product(name: "GoFloraSharedPackage", package: "GoFloraSharedPackage")
        ]
    )
]
```

## 🚀 Usage

### Import All DTOs
```swift
import GoFloraSharedPackage
```

### Import Specific Modules
```swift
import ClientDTO
import DriversDTO
import PaymentDTO
import TripDTO
import SharedModels
```

### Example Usage
```swift
import ClientDTO

let client = ClientDTOResponseModel(
    name: "John Doe",
    email: "john@example.com",
    token: "abc123"
)
```

## 📚 Available DTOs

### ClientDTO
- `ClientTokenDTO`
- `ClientDTOResponseModel`
- `ClientTokenResponse`

### DriversDTO
- `DriverDTO`
- `DriverTripRequestPivotDTO`

### PaymentDTO
- `InitiatePaymentRequest`
- `PaymentMethodsResponse`
- `PayNowPaymentSuccessResponse`
- `PaymentStatusResponse`
- `DriverPayoutResponse`
- `PayNowWebhookPayload`

### TripDTO
- `TripRequestDTO`
- `TripRequestCreateDTO`
- `TripCancellationDTO`
- `PendingReviewTripDTO`

### SharedModels
- `TransportServiceDTO`
- `StatusCount`
- `DashboardStats`
- `TripStats`
- `PaginationContext`
- `Notification`

## 🔄 Versioning

This package follows [Semantic Versioning](https://semver.org/):
- **Major**: Breaking changes
- **Minor**: New features (backward-compatible)
- **Patch**: Bug fixes

## 📄 License

MIT License - see LICENSE file for details

## 👥 Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request
