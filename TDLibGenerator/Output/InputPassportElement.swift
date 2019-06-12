public extension TDEnum {

enum InputPassportElement: TDEnumProtocol {

/// A Telegram Passport element to be saved containing the user's personal details
/// 
/// - personalDetails: Personal details of the user
case personalDetails(personalDetails: TDObject.PersonalDetails)

/// A Telegram Passport element to be saved containing the user's passport
/// 
/// - passport: The passport to be saved
case passport(passport: TDObject.InputIdentityDocument)

/// A Telegram Passport element to be saved containing the user's driver license
/// 
/// - driverLicense: The driver license to be saved
case driverLicense(driverLicense: TDObject.InputIdentityDocument)

/// A Telegram Passport element to be saved containing the user's identity card
/// 
/// - identityCard: The identity card to be saved
case identityCard(identityCard: TDObject.InputIdentityDocument)

/// A Telegram Passport element to be saved containing the user's internal passport
/// 
/// - internalPassport: The internal passport to be saved
case internalPassport(internalPassport: TDObject.InputIdentityDocument)

/// A Telegram Passport element to be saved containing the user's address
/// 
/// - address: The address to be saved
case address(address: TDObject.Address)

/// A Telegram Passport element to be saved containing the user's utility bill
/// 
/// - utilityBill: The utility bill to be saved
case utilityBill(utilityBill: TDObject.InputPersonalDocument)

/// A Telegram Passport element to be saved containing the user's bank statement
/// 
/// - bankStatement: The bank statement to be saved
case bankStatement(bankStatement: TDObject.InputPersonalDocument)

/// A Telegram Passport element to be saved containing the user's rental agreement
/// 
/// - rentalAgreement: The rental agreement to be saved
case rentalAgreement(rentalAgreement: TDObject.InputPersonalDocument)

/// A Telegram Passport element to be saved containing the user's passport registration
/// 
/// - passportRegistration: The passport registration page to be saved
case passportRegistration(passportRegistration: TDObject.InputPersonalDocument)

/// A Telegram Passport element to be saved containing the user's temporary registration
/// 
/// - temporaryRegistration: The temporary registration document to be saved
case temporaryRegistration(temporaryRegistration: TDObject.InputPersonalDocument)

/// A Telegram Passport element to be saved containing the user's phone number
/// 
/// - phoneNumber: The phone number to be saved
case phoneNumber(phoneNumber: String)

/// A Telegram Passport element to be saved containing the user's email address
/// 
/// - emailAddress: The email address to be saved
case emailAddress(emailAddress: String)

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "inputPassportElementPersonalDetails":
let personalDetails = try container.decode(TDObject.PersonalDetails.self, forKey: .init(string: "personalDetails"))

self = .personalDetails(personalDetails: personalDetails)

case "inputPassportElementPassport":
let passport = try container.decode(TDObject.InputIdentityDocument.self, forKey: .init(string: "passport"))

self = .passport(passport: passport)

case "inputPassportElementDriverLicense":
let driverLicense = try container.decode(TDObject.InputIdentityDocument.self, forKey: .init(string: "driverLicense"))

self = .driverLicense(driverLicense: driverLicense)

case "inputPassportElementIdentityCard":
let identityCard = try container.decode(TDObject.InputIdentityDocument.self, forKey: .init(string: "identityCard"))

self = .identityCard(identityCard: identityCard)

case "inputPassportElementInternalPassport":
let internalPassport = try container.decode(TDObject.InputIdentityDocument.self, forKey: .init(string: "internalPassport"))

self = .internalPassport(internalPassport: internalPassport)

case "inputPassportElementAddress":
let address = try container.decode(TDObject.Address.self, forKey: .init(string: "address"))

self = .address(address: address)

case "inputPassportElementUtilityBill":
let utilityBill = try container.decode(TDObject.InputPersonalDocument.self, forKey: .init(string: "utilityBill"))

self = .utilityBill(utilityBill: utilityBill)

case "inputPassportElementBankStatement":
let bankStatement = try container.decode(TDObject.InputPersonalDocument.self, forKey: .init(string: "bankStatement"))

self = .bankStatement(bankStatement: bankStatement)

case "inputPassportElementRentalAgreement":
let rentalAgreement = try container.decode(TDObject.InputPersonalDocument.self, forKey: .init(string: "rentalAgreement"))

self = .rentalAgreement(rentalAgreement: rentalAgreement)

case "inputPassportElementPassportRegistration":
let passportRegistration = try container.decode(TDObject.InputPersonalDocument.self, forKey: .init(string: "passportRegistration"))

self = .passportRegistration(passportRegistration: passportRegistration)

case "inputPassportElementTemporaryRegistration":
let temporaryRegistration = try container.decode(TDObject.InputPersonalDocument.self, forKey: .init(string: "temporaryRegistration"))

self = .temporaryRegistration(temporaryRegistration: temporaryRegistration)

case "inputPassportElementPhoneNumber":
let phoneNumber = try container.decode(String.self, forKey: .init(string: "phoneNumber"))

self = .phoneNumber(phoneNumber: phoneNumber)

case "inputPassportElementEmailAddress":
let emailAddress = try container.decode(String.self, forKey: .init(string: "emailAddress"))

self = .emailAddress(emailAddress: emailAddress)

default:
throw DecodingError.typeMismatch(InputPassportElement.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined InputPassportElement"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .emailAddress(let emailAddress):
case .phoneNumber(let phoneNumber):
case .temporaryRegistration(let temporaryRegistration):
case .passportRegistration(let passportRegistration):
case .rentalAgreement(let rentalAgreement):
case .bankStatement(let bankStatement):
case .utilityBill(let utilityBill):
case .address(let address):
case .internalPassport(let internalPassport):
case .identityCard(let identityCard):
case .driverLicense(let driverLicense):
case .passport(let passport):
case .personalDetails(let personalDetails):
try container.encode("inputPassportElementPersonalDetails", forKey: .init(string: "@type"))

try container.encode(personalDetails, forKey: .init(string: "personalDetails"))

try container.encode("inputPassportElementPassport", forKey: .init(string: "@type"))

try container.encode(passport, forKey: .init(string: "passport"))

try container.encode("inputPassportElementDriverLicense", forKey: .init(string: "@type"))

try container.encode(driverLicense, forKey: .init(string: "driverLicense"))

try container.encode("inputPassportElementIdentityCard", forKey: .init(string: "@type"))

try container.encode(identityCard, forKey: .init(string: "identityCard"))

try container.encode("inputPassportElementInternalPassport", forKey: .init(string: "@type"))

try container.encode(internalPassport, forKey: .init(string: "internalPassport"))

try container.encode("inputPassportElementAddress", forKey: .init(string: "@type"))

try container.encode(address, forKey: .init(string: "address"))

try container.encode("inputPassportElementUtilityBill", forKey: .init(string: "@type"))

try container.encode(utilityBill, forKey: .init(string: "utilityBill"))

try container.encode("inputPassportElementBankStatement", forKey: .init(string: "@type"))

try container.encode(bankStatement, forKey: .init(string: "bankStatement"))

try container.encode("inputPassportElementRentalAgreement", forKey: .init(string: "@type"))

try container.encode(rentalAgreement, forKey: .init(string: "rentalAgreement"))

try container.encode("inputPassportElementPassportRegistration", forKey: .init(string: "@type"))

try container.encode(passportRegistration, forKey: .init(string: "passportRegistration"))

try container.encode("inputPassportElementTemporaryRegistration", forKey: .init(string: "@type"))

try container.encode(temporaryRegistration, forKey: .init(string: "temporaryRegistration"))

try container.encode("inputPassportElementPhoneNumber", forKey: .init(string: "@type"))

try container.encode(phoneNumber, forKey: .init(string: "phoneNumber"))

try container.encode("inputPassportElementEmailAddress", forKey: .init(string: "@type"))

try container.encode(emailAddress, forKey: .init(string: "emailAddress"))

}
}

}

}