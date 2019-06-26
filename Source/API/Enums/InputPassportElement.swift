//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Contains information about a Telegram Passport element to be saved
     */
    enum InputPassportElement: TDEnumProtocol {
        /**
         A Telegram Passport element to be saved containing the user's personal details

         - personalDetails: Personal details of the user
         */
        case personalDetails(personalDetails: TDObject.PersonalDetails)

        /**
         A Telegram Passport element to be saved containing the user's passport

         - passport: The passport to be saved
         */
        case passport(passport: TDObject.InputIdentityDocument)

        /**
         A Telegram Passport element to be saved containing the user's driver license

         - driverLicense: The driver license to be saved
         */
        case driverLicense(driverLicense: TDObject.InputIdentityDocument)

        /**
         A Telegram Passport element to be saved containing the user's identity card

         - identityCard: The identity card to be saved
         */
        case identityCard(identityCard: TDObject.InputIdentityDocument)

        /**
         A Telegram Passport element to be saved containing the user's internal passport

         - internalPassport: The internal passport to be saved
         */
        case internalPassport(internalPassport: TDObject.InputIdentityDocument)

        /**
         A Telegram Passport element to be saved containing the user's address

         - address: The address to be saved
         */
        case address(address: TDObject.Address)

        /**
         A Telegram Passport element to be saved containing the user's utility bill

         - utilityBill: The utility bill to be saved
         */
        case utilityBill(utilityBill: TDObject.InputPersonalDocument)

        /**
         A Telegram Passport element to be saved containing the user's bank statement

         - bankStatement: The bank statement to be saved
         */
        case bankStatement(bankStatement: TDObject.InputPersonalDocument)

        /**
         A Telegram Passport element to be saved containing the user's rental agreement

         - rentalAgreement: The rental agreement to be saved
         */
        case rentalAgreement(rentalAgreement: TDObject.InputPersonalDocument)

        /**
         A Telegram Passport element to be saved containing the user's passport registration

         - passportRegistration: The passport registration page to be saved
         */
        case passportRegistration(passportRegistration: TDObject.InputPersonalDocument)

        /**
         A Telegram Passport element to be saved containing the user's temporary registration

         - temporaryRegistration: The temporary registration document to be saved
         */
        case temporaryRegistration(temporaryRegistration: TDObject.InputPersonalDocument)

        /**
         A Telegram Passport element to be saved containing the user's phone number

         - phoneNumber: The phone number to be saved
         */
        case phoneNumber(phoneNumber: String)

        /**
         A Telegram Passport element to be saved containing the user's email address

         - emailAddress: The email address to be saved
         */
        case emailAddress(emailAddress: String)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

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

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .personalDetails(personalDetails):
                try container.encode("inputPassportElementPersonalDetails", forKey: .type)

                try container.encode(personalDetails, forKey: .init(string: "personalDetails"))

            case let .passport(passport):
                try container.encode("inputPassportElementPassport", forKey: .type)

                try container.encode(passport, forKey: .init(string: "passport"))

            case let .driverLicense(driverLicense):
                try container.encode("inputPassportElementDriverLicense", forKey: .type)

                try container.encode(driverLicense, forKey: .init(string: "driverLicense"))

            case let .identityCard(identityCard):
                try container.encode("inputPassportElementIdentityCard", forKey: .type)

                try container.encode(identityCard, forKey: .init(string: "identityCard"))

            case let .internalPassport(internalPassport):
                try container.encode("inputPassportElementInternalPassport", forKey: .type)

                try container.encode(internalPassport, forKey: .init(string: "internalPassport"))

            case let .address(address):
                try container.encode("inputPassportElementAddress", forKey: .type)

                try container.encode(address, forKey: .init(string: "address"))

            case let .utilityBill(utilityBill):
                try container.encode("inputPassportElementUtilityBill", forKey: .type)

                try container.encode(utilityBill, forKey: .init(string: "utilityBill"))

            case let .bankStatement(bankStatement):
                try container.encode("inputPassportElementBankStatement", forKey: .type)

                try container.encode(bankStatement, forKey: .init(string: "bankStatement"))

            case let .rentalAgreement(rentalAgreement):
                try container.encode("inputPassportElementRentalAgreement", forKey: .type)

                try container.encode(rentalAgreement, forKey: .init(string: "rentalAgreement"))

            case let .passportRegistration(passportRegistration):
                try container.encode("inputPassportElementPassportRegistration", forKey: .type)

                try container.encode(passportRegistration, forKey: .init(string: "passportRegistration"))

            case let .temporaryRegistration(temporaryRegistration):
                try container.encode("inputPassportElementTemporaryRegistration", forKey: .type)

                try container.encode(temporaryRegistration, forKey: .init(string: "temporaryRegistration"))

            case let .phoneNumber(phoneNumber):
                try container.encode("inputPassportElementPhoneNumber", forKey: .type)

                try container.encode(phoneNumber, forKey: .init(string: "phoneNumber"))

            case let .emailAddress(emailAddress):
                try container.encode("inputPassportElementEmailAddress", forKey: .type)

                try container.encode(emailAddress, forKey: .init(string: "emailAddress"))
            }
        }
    }
}
