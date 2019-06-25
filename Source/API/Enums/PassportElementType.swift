//
//  PassportElementType.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Contains the type of a Telegram Passport element
     */
    enum PassportElementType: TDEnumProtocol {
        /**
         A Telegram Passport element containing the user's personal details
         */
        case personalDetails

        /**
         A Telegram Passport element containing the user's passport
         */
        case passport

        /**
         A Telegram Passport element containing the user's driver license
         */
        case driverLicense

        /**
         A Telegram Passport element containing the user's identity card
         */
        case identityCard

        /**
         A Telegram Passport element containing the user's internal passport
         */
        case internalPassport

        /**
         A Telegram Passport element containing the user's address
         */
        case address

        /**
         A Telegram Passport element containing the user's utility bill
         */
        case utilityBill

        /**
         A Telegram Passport element containing the user's bank statement
         */
        case bankStatement

        /**
         A Telegram Passport element containing the user's rental agreement
         */
        case rentalAgreement

        /**
         A Telegram Passport element containing the registration page of the user's passport
         */
        case passportRegistration

        /**
         A Telegram Passport element containing the user's temporary registration
         */
        case temporaryRegistration

        /**
         A Telegram Passport element containing the user's phone number
         */
        case phoneNumber

        /**
         A Telegram Passport element containing the user's email address
         */
        case emailAddress

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

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

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .personalDetails:
                try container.encode("passportElementTypePersonalDetails", forKey: .type)

            case .passport:
                try container.encode("passportElementTypePassport", forKey: .type)

            case .driverLicense:
                try container.encode("passportElementTypeDriverLicense", forKey: .type)

            case .identityCard:
                try container.encode("passportElementTypeIdentityCard", forKey: .type)

            case .internalPassport:
                try container.encode("passportElementTypeInternalPassport", forKey: .type)

            case .address:
                try container.encode("passportElementTypeAddress", forKey: .type)

            case .utilityBill:
                try container.encode("passportElementTypeUtilityBill", forKey: .type)

            case .bankStatement:
                try container.encode("passportElementTypeBankStatement", forKey: .type)

            case .rentalAgreement:
                try container.encode("passportElementTypeRentalAgreement", forKey: .type)

            case .passportRegistration:
                try container.encode("passportElementTypePassportRegistration", forKey: .type)

            case .temporaryRegistration:
                try container.encode("passportElementTypeTemporaryRegistration", forKey: .type)

            case .phoneNumber:
                try container.encode("passportElementTypePhoneNumber", forKey: .type)

            case .emailAddress:
                try container.encode("passportElementTypeEmailAddress", forKey: .type)
            }
        }
    }
}
