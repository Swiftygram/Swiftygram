//
//  DeviceToken.swift
//  Swiftygram
//  Created by ky1vstar on 7/29/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Represents a data needed to subscribe for push notifications through registerDevice method. To use specific push notification service, you must specify the correct application platform and upload valid server authentication data at https://my.telegram.org
     */
    enum DeviceToken: TDEnumProtocol {
        /**
         A token for Firebase Cloud Messaging

         - token: Device registration token; may be empty to de-register a device
         - encrypt: True, if push notifications should be additionally encrypted
         */
        case firebaseCloudMessaging(token: String, encrypt: Bool)

        /**
         A token for Apple Push Notification service

         - deviceToken: Device token; may be empty to de-register a device
         - isAppSandbox: True, if App Sandbox is enabled
         */
        case applePush(deviceToken: String, isAppSandbox: Bool)

        /**
         A token for Apple Push Notification service VoIP notifications

         - deviceToken: Device token; may be empty to de-register a device
         - isAppSandbox: True, if App Sandbox is enabled
         - encrypt: True, if push notifications should be additionally encrypted
         */
        case applePushVoIP(deviceToken: String, isAppSandbox: Bool, encrypt: Bool)

        /**
         A token for Windows Push Notification Services

         - accessToken: The access token that will be used to send notifications; may be empty to de-register a device
         */
        case windowsPush(accessToken: String)

        /**
         A token for Microsoft Push Notification Service

         - channelUri: Push notification channel URI; may be empty to de-register a device
         */
        case microsoftPush(channelUri: String)

        /**
         A token for Microsoft Push Notification Service VoIP channel

         - channelUri: Push notification channel URI; may be empty to de-register a device
         */
        case microsoftPushVoIP(channelUri: String)

        /**
         A token for web Push API

         - endpoint: Absolute URL exposed by the push service where the application server can send push messages; may be empty to de-register a device
         - p256dhBase64Url: Base64url-encoded P-256 elliptic curve Diffie-Hellman public key
         - authBase64Url: Base64url-encoded authentication secret
         */
        case webPush(endpoint: String, p256dhBase64Url: String, authBase64Url: String)

        /**
         A token for Simple Push API for Firefox OS

         - endpoint: Absolute URL exposed by the push service where the application server can send push messages; may be empty to de-register a device
         */
        case simplePush(endpoint: String)

        /**
         A token for Ubuntu Push Client service

         - token: Token; may be empty to de-register a device
         */
        case ubuntuPush(token: String)

        /**
         A token for BlackBerry Push Service

         - token: Token; may be empty to de-register a device
         */
        case blackBerryPush(token: String)

        /**
         A token for Tizen Push Service

         - regId: Push service registration identifier; may be empty to de-register a device
         */
        case tizenPush(regId: String)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "deviceTokenFirebaseCloudMessaging":
                let token = try container.decode(String.self, forKey: .init(string: "token"))
                let encrypt = try container.decode(Bool.self, forKey: .init(string: "encrypt"))

                self = .firebaseCloudMessaging(token: token, encrypt: encrypt)

            case "deviceTokenApplePush":
                let deviceToken = try container.decode(String.self, forKey: .init(string: "deviceToken"))
                let isAppSandbox = try container.decode(Bool.self, forKey: .init(string: "isAppSandbox"))

                self = .applePush(deviceToken: deviceToken, isAppSandbox: isAppSandbox)

            case "deviceTokenApplePushVoIP":
                let deviceToken = try container.decode(String.self, forKey: .init(string: "deviceToken"))
                let isAppSandbox = try container.decode(Bool.self, forKey: .init(string: "isAppSandbox"))
                let encrypt = try container.decode(Bool.self, forKey: .init(string: "encrypt"))

                self = .applePushVoIP(deviceToken: deviceToken, isAppSandbox: isAppSandbox, encrypt: encrypt)

            case "deviceTokenWindowsPush":
                let accessToken = try container.decode(String.self, forKey: .init(string: "accessToken"))

                self = .windowsPush(accessToken: accessToken)

            case "deviceTokenMicrosoftPush":
                let channelUri = try container.decode(String.self, forKey: .init(string: "channelUri"))

                self = .microsoftPush(channelUri: channelUri)

            case "deviceTokenMicrosoftPushVoIP":
                let channelUri = try container.decode(String.self, forKey: .init(string: "channelUri"))

                self = .microsoftPushVoIP(channelUri: channelUri)

            case "deviceTokenWebPush":
                let endpoint = try container.decode(String.self, forKey: .init(string: "endpoint"))
                let p256dhBase64Url = try container.decode(String.self, forKey: .init(string: "p256dhBase64Url"))
                let authBase64Url = try container.decode(String.self, forKey: .init(string: "authBase64Url"))

                self = .webPush(endpoint: endpoint, p256dhBase64Url: p256dhBase64Url, authBase64Url: authBase64Url)

            case "deviceTokenSimplePush":
                let endpoint = try container.decode(String.self, forKey: .init(string: "endpoint"))

                self = .simplePush(endpoint: endpoint)

            case "deviceTokenUbuntuPush":
                let token = try container.decode(String.self, forKey: .init(string: "token"))

                self = .ubuntuPush(token: token)

            case "deviceTokenBlackBerryPush":
                let token = try container.decode(String.self, forKey: .init(string: "token"))

                self = .blackBerryPush(token: token)

            case "deviceTokenTizenPush":
                let regId = try container.decode(String.self, forKey: .init(string: "regId"))

                self = .tizenPush(regId: regId)

            default:
                throw DecodingError.typeMismatch(DeviceToken.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined DeviceToken"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .firebaseCloudMessaging(token, encrypt):
                try container.encode("deviceTokenFirebaseCloudMessaging", forKey: .type)

                try container.encode(token, forKey: .init(string: "token"))
                try container.encode(encrypt, forKey: .init(string: "encrypt"))

            case let .applePush(deviceToken, isAppSandbox):
                try container.encode("deviceTokenApplePush", forKey: .type)

                try container.encode(deviceToken, forKey: .init(string: "deviceToken"))
                try container.encode(isAppSandbox, forKey: .init(string: "isAppSandbox"))

            case let .applePushVoIP(deviceToken, isAppSandbox, encrypt):
                try container.encode("deviceTokenApplePushVoIP", forKey: .type)

                try container.encode(deviceToken, forKey: .init(string: "deviceToken"))
                try container.encode(isAppSandbox, forKey: .init(string: "isAppSandbox"))
                try container.encode(encrypt, forKey: .init(string: "encrypt"))

            case let .windowsPush(accessToken):
                try container.encode("deviceTokenWindowsPush", forKey: .type)

                try container.encode(accessToken, forKey: .init(string: "accessToken"))

            case let .microsoftPush(channelUri):
                try container.encode("deviceTokenMicrosoftPush", forKey: .type)

                try container.encode(channelUri, forKey: .init(string: "channelUri"))

            case let .microsoftPushVoIP(channelUri):
                try container.encode("deviceTokenMicrosoftPushVoIP", forKey: .type)

                try container.encode(channelUri, forKey: .init(string: "channelUri"))

            case let .webPush(endpoint, p256dhBase64Url, authBase64Url):
                try container.encode("deviceTokenWebPush", forKey: .type)

                try container.encode(endpoint, forKey: .init(string: "endpoint"))
                try container.encode(p256dhBase64Url, forKey: .init(string: "p256dhBase64Url"))
                try container.encode(authBase64Url, forKey: .init(string: "authBase64Url"))

            case let .simplePush(endpoint):
                try container.encode("deviceTokenSimplePush", forKey: .type)

                try container.encode(endpoint, forKey: .init(string: "endpoint"))

            case let .ubuntuPush(token):
                try container.encode("deviceTokenUbuntuPush", forKey: .type)

                try container.encode(token, forKey: .init(string: "token"))

            case let .blackBerryPush(token):
                try container.encode("deviceTokenBlackBerryPush", forKey: .type)

                try container.encode(token, forKey: .init(string: "token"))

            case let .tizenPush(regId):
                try container.encode("deviceTokenTizenPush", forKey: .type)

                try container.encode(regId, forKey: .init(string: "regId"))
            }
        }

        public var isFirebaseCloudMessaging: Bool {
            if case .firebaseCloudMessaging = self {
                return true
            } else {
                return false
            }
        }

        public var isApplePush: Bool {
            if case .applePush = self {
                return true
            } else {
                return false
            }
        }

        public var isApplePushVoIP: Bool {
            if case .applePushVoIP = self {
                return true
            } else {
                return false
            }
        }

        public var isWindowsPush: Bool {
            if case .windowsPush = self {
                return true
            } else {
                return false
            }
        }

        public var isMicrosoftPush: Bool {
            if case .microsoftPush = self {
                return true
            } else {
                return false
            }
        }

        public var isMicrosoftPushVoIP: Bool {
            if case .microsoftPushVoIP = self {
                return true
            } else {
                return false
            }
        }

        public var isWebPush: Bool {
            if case .webPush = self {
                return true
            } else {
                return false
            }
        }

        public var isSimplePush: Bool {
            if case .simplePush = self {
                return true
            } else {
                return false
            }
        }

        public var isUbuntuPush: Bool {
            if case .ubuntuPush = self {
                return true
            } else {
                return false
            }
        }

        public var isBlackBerryPush: Bool {
            if case .blackBerryPush = self {
                return true
            } else {
                return false
            }
        }

        public var isTizenPush: Bool {
            if case .tizenPush = self {
                return true
            } else {
                return false
            }
        }
    }
}
