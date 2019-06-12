public extension TDEnum {

enum PassportElementType: TDEnumProtocol {

/// A Telegram Passport element containing the user's personal details
case personalDetails

/// A Telegram Passport element containing the user's passport
case passport

/// A Telegram Passport element containing the user's driver license
case driverLicense

/// A Telegram Passport element containing the user's identity card
case identityCard

/// A Telegram Passport element containing the user's internal passport
case internalPassport

/// A Telegram Passport element containing the user's address
case address

/// A Telegram Passport element containing the user's utility bill
case utilityBill

/// A Telegram Passport element containing the user's bank statement
case bankStatement

/// A Telegram Passport element containing the user's rental agreement
case rentalAgreement

/// A Telegram Passport element containing the registration page of the user's passport
case passportRegistration

/// A Telegram Passport element containing the user's temporary registration
case temporaryRegistration

/// A Telegram Passport element containing the user's phone number
case phoneNumber

/// A Telegram Passport element containing the user's email address
case emailAddress

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "passportElementTypePersonalDetails":
self = .personalDetails

case "passportElementTypePassport":
self = .passport

case "passportElementTypeDriverLicense":
self = .driverLicense

case "passportElementTypeIdentityCard":
self = .identityCard

case "passportElementTypeInternalPassport":
self = .internalPassport

case "passportElementTypeAddress":
self = .address

case "passportElementTypeUtilityBill":
self = .utilityBill

case "passportElementTypeBankStatement":
self = .bankStatement

case "passportElementTypeRentalAgreement":
self = .rentalAgreement

case "passportElementTypePassportRegistration":
self = .passportRegistration

case "passportElementTypeTemporaryRegistration":
self = .temporaryRegistration

case "passportElementTypePhoneNumber":
self = .phoneNumber

case "passportElementTypeEmailAddress":
self = .emailAddress

default:
throw DecodingError.typeMismatch(PassportElementType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined PassportElementType"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .emailAddress:
case .phoneNumber:
case .temporaryRegistration:
case .passportRegistration:
case .rentalAgreement:
case .bankStatement:
case .utilityBill:
case .address:
case .internalPassport:
case .identityCard:
case .driverLicense:
case .passport:
case .personalDetails:
try container.encode("passportElementTypePersonalDetails", forKey: .init(string: "@type"))

try container.encode("passportElementTypePassport", forKey: .init(string: "@type"))

try container.encode("passportElementTypeDriverLicense", forKey: .init(string: "@type"))

try container.encode("passportElementTypeIdentityCard", forKey: .init(string: "@type"))

try container.encode("passportElementTypeInternalPassport", forKey: .init(string: "@type"))

try container.encode("passportElementTypeAddress", forKey: .init(string: "@type"))

try container.encode("passportElementTypeUtilityBill", forKey: .init(string: "@type"))

try container.encode("passportElementTypeBankStatement", forKey: .init(string: "@type"))

try container.encode("passportElementTypeRentalAgreement", forKey: .init(string: "@type"))

try container.encode("passportElementTypePassportRegistration", forKey: .init(string: "@type"))

try container.encode("passportElementTypeTemporaryRegistration", forKey: .init(string: "@type"))

try container.encode("passportElementTypePhoneNumber", forKey: .init(string: "@type"))

try container.encode("passportElementTypeEmailAddress", forKey: .init(string: "@type"))

}
}

}

}