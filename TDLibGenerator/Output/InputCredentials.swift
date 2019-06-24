//
//  InputCredentials.swift
//  Swiftygram
//  Created by ky1vstar on 6/24/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    enum InputCredentials: TDEnumProtocol {
        ///  Applies if a user chooses some previously saved payment credentials.
        /// To use their previously saved credentials, the user must have a valid
        /// temporary password
        ///
        ///  - savedCredentialsId: Identifier of the saved credentials
        case saved(savedCredentialsId: String)

        ///  Applies if a user enters new credentials on a payment provider
        /// website
        ///
        ///  - data: Contains JSON-encoded data with a credential identifier from
        /// the payment provider
        ///  - allowSave: True, if the credential identifier can be saved on the
        /// server side
        case new(data: String, allowSave: Bool)

        ///  Applies if a user enters new credentials using Android Pay
        ///
        ///  - data: JSON-encoded data with the credential identifier
        case androidPay(data: String)

        ///  Applies if a user enters new credentials using Apple Pay
        ///
        ///  - data: JSON-encoded data with the credential identifier
        case applePay(data: String)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "inputCredentialsSaved":
                let savedCredentialsId = try container.decode(String.self, forKey: .init(string: "savedCredentialsId"))

                self = .saved(savedCredentialsId: savedCredentialsId)

            case "inputCredentialsNew":
                let data = try container.decode(String.self, forKey: .init(string: "data"))
                let allowSave = try container.decode(Bool.self, forKey: .init(string: "allowSave"))

                self = .new(data: data, allowSave: allowSave)

            case "inputCredentialsAndroidPay":
                let data = try container.decode(String.self, forKey: .init(string: "data"))

                self = .androidPay(data: data)

            case "inputCredentialsApplePay":
                let data = try container.decode(String.self, forKey: .init(string: "data"))

                self = .applePay(data: data)

            default:
                throw DecodingError.typeMismatch(InputCredentials.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined InputCredentials"))
            }
        }

        // MARK: - Decodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .saved(savedCredentialsId):
                try container.encode("inputCredentialsSaved", forKey: .type)

                try container.encode(savedCredentialsId, forKey: .init(string: "savedCredentialsId"))

            case let .new(data, allowSave):
                try container.encode("inputCredentialsNew", forKey: .type)

                try container.encode(data, forKey: .init(string: "data"))
                try container.encode(allowSave, forKey: .init(string: "allowSave"))

            case let .androidPay(data):
                try container.encode("inputCredentialsAndroidPay", forKey: .type)

                try container.encode(data, forKey: .init(string: "data"))

            case let .applePay(data):
                try container.encode("inputCredentialsApplePay", forKey: .type)

                try container.encode(data, forKey: .init(string: "data"))
            }
        }
    }
}
