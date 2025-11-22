import XCTest
@testable import ClientDTO
@testable import DriversDTO
@testable import PaymentDTO
@testable import TripDTO
@testable import SharedModels

final class GoFloraSharedPackageTests: XCTestCase {
    func testClientDTOCreation() {
        let dto = ClientTokenDTO(
            id: UUID(),
            tokenValue: "test-token",
            expiresAt: Date(),
            clientID: UUID()
        )
        XCTAssertNotNil(dto)
    }
    
    func testPaymentDTOCreation() {
        let dto = InitiatePaymentRequest(
            tripId: UUID(),
            paymentMethodId: UUID(),
            paymentMethodType: "ecocash",
            currency: "USD",
            clientEmail: "test@example.com",
            clientPhone: "+263771234567"
        )
        XCTAssertEqual(dto.currency, "USD")
    }
}
