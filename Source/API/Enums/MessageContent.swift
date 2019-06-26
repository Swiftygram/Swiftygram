//
//  MessageContent.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Contains the content of a message
     */
    enum MessageContent: TDEnumProtocol {
        /**
         A text message

         - text: Text of the message
         - webPage: A preview of the web page that's mentioned in the text; may be null
         */
        case text(text: TDObject.FormattedText, webPage: TDObject.WebPage)

        /**
         An animation message (GIF-style).

         - animation: Message content
         - caption: Animation caption
         - isSecret: True, if the animation thumbnail must be blurred and the animation must be shown only while tapped
         */
        case animation(animation: TDObject.Animation, caption: TDObject.FormattedText, isSecret: Bool)

        /**
         An audio message

         - audio: Message content
         - caption: Audio caption
         */
        case audio(audio: TDObject.Audio, caption: TDObject.FormattedText)

        /**
         A document message (general file)

         - document: Message content
         - caption: Document caption
         */
        case document(document: TDObject.Document, caption: TDObject.FormattedText)

        /**
         A photo message

         - photo: Message content
         - caption: Photo caption
         - isSecret: True, if the photo must be blurred and must be shown only while tapped
         */
        case photo(photo: TDObject.Photo, caption: TDObject.FormattedText, isSecret: Bool)

        /**
         An expired photo message (self-destructed after TTL has elapsed)
         */
        case expiredPhoto

        /**
         A sticker message

         - sticker: Message content
         */
        case sticker(sticker: TDObject.Sticker)

        /**
         A video message

         - video: Message content
         - caption: Video caption
         - isSecret: True, if the video thumbnail must be blurred and the video must be shown only while tapped
         */
        case video(video: TDObject.Video, caption: TDObject.FormattedText, isSecret: Bool)

        /**
         An expired video message (self-destructed after TTL has elapsed)
         */
        case expiredVideo

        /**
         A video note message

         - videoNote: Message content
         - isViewed: True, if at least one of the recipients has viewed the video note
         - isSecret: True, if the video note thumbnail must be blurred and the video note must be shown only while tapped
         */
        case videoNote(videoNote: TDObject.VideoNote, isViewed: Bool, isSecret: Bool)

        /**
         A voice note message

         - voiceNote: Message content
         - caption: Voice note caption
         - isListened: True, if at least one of the recipients has listened to the voice note
         */
        case voiceNote(voiceNote: TDObject.VoiceNote, caption: TDObject.FormattedText, isListened: Bool)

        /**
         A message with a location

         - location: Message content
         - livePeriod: Time relative to the message sent date until which the location can be updated, in seconds
         - expiresIn: Left time for which the location can be updated, in seconds. updateMessageContent is not sent when this field changes
         */
        case location(location: TDObject.Location, livePeriod: Int, expiresIn: Int)

        /**
         A message with information about a venue

         - venue: Message content
         */
        case venue(venue: TDObject.Venue)

        /**
         A message with a user contact

         - contact: Message content
         */
        case act(contact: TDObject.Contact)

        /**
         A message with a game

         - game: Game
         */
        case game(game: TDObject.Game)

        /**
         A message with a poll

         - poll: Poll
         */
        case poll(poll: TDObject.Poll)

        /**
         A message with an invoice from a bot

         - title: Product title
         - description: Product description
         - photo: Product photo; may be null
         - currency: Currency for the product price
         - totalAmount: Product total price in the minimal quantity of the currency
         - startParameter: Unique invoice bot start_parameter. To share an invoice use the URL https://t.me/{bot_username}?start={start_parameter}
         - isTest: True, if the invoice is a test invoice
         - needShippingAddress: True, if the shipping address should be specified
         - receiptMessageId: The identifier of the message with the receipt, after the product has been purchased
         */
        case invoice(title: String, description: String, photo: TDObject.Photo, currency: String, totalAmount: Int64, startParameter: String, isTest: Bool, needShippingAddress: Bool, receiptMessageId: Int64)

        /**
         A message with information about an ended call

         - discardReason: Reason why the call was discarded
         - duration: Call duration, in seconds
         */
        case all(discardReason: TDEnum.CallDiscardReason, duration: Int)

        /**
         A newly created basic group

         - title: Title of the basic group
         - memberUserIds: User identifiers of members in the basic group
         */
        case basicGroupChatCreate(title: String, memberUserIds: [Int])

        /**
         A newly created supergroup or channel

         - title: Title of the supergroup or channel
         */
        case supergroupChatCreate(title: String)

        /**
         An updated chat title

         - title: New chat title
         */
        case hatChangeTitle(title: String)

        /**
         An updated chat photo

         - photo: New chat photo
         */
        case hatChangePhoto(photo: TDObject.Photo)

        /**
         A deleted chat photo
         */
        case hatDeletePhoto

        /**
         New chat members were added

         - memberUserIds: User identifiers of the new members
         */
        case hatAddMembers(memberUserIds: [Int])

        /**
         A new member joined the chat by invite link
         */
        case hatJoinByLink

        /**
         A chat member was deleted

         - userId: User identifier of the deleted chat member
         */
        case hatDeleteMember(userId: Int)

        /**
         A basic group was upgraded to a supergroup and was deactivated as the result

         - supergroupId: Identifier of the supergroup to which the basic group was upgraded
         */
        case hatUpgradeTo(supergroupId: Int)

        /**
         A supergroup has been created from a basic group

         - title: Title of the newly created supergroup
         - basicGroupId: The identifier of the original basic group
         */
        case hatUpgradeFrom(title: String, basicGroupId: Int)

        /**
         A message has been pinned

         - messageId: Identifier of the pinned message, can be an identifier of a deleted message or 0
         */
        case pinMessage(messageId: Int64)

        /**
         A screenshot of a message in the chat has been taken
         */
        case screenshotTaken

        /**
         The TTL (Time To Live) setting messages in a secret chat has been changed

         - ttl: New TTL
         */
        case hatSetTtl(ttl: Int)

        /**
         A non-standard action has happened in the chat

         - text: Message text to be shown in the chat
         */
        case ustomServiceAction(text: String)

        /**
         A new high score was achieved in a game

         - gameMessageId: Identifier of the message with the game, can be an identifier of a deleted message
         - gameId: Identifier of the game; may be different from the games presented in the message with the game
         - score: New score
         */
        case gameScore(gameMessageId: Int64, gameId: Int64, score: Int)

        /**
         A payment has been completed

         - invoiceMessageId: Identifier of the message with the corresponding invoice; can be an identifier of a deleted message
         - currency: Currency for the price of the product
         - totalAmount: Total price for the product, in the minimal quantity of the currency
         */
        case paymentSuccessful(invoiceMessageId: Int64, currency: String, totalAmount: Int64)

        /**
         A payment has been completed; for bots only

         - invoiceMessageId: Identifier of the message with the corresponding invoice; can be an identifier of a deleted message
         - currency: Currency for price of the product
         - totalAmount: Total price for the product, in the minimal quantity of the currency
         - invoicePayload: Invoice payload
         - shippingOptionId: Identifier of the shipping option chosen by the user; may be empty if not applicable
         - orderInfo: Information about the order; may be null
         - telegramPaymentChargeId: Telegram payment identifier
         - providerPaymentChargeId: Provider payment identifier
         */
        case paymentSuccessfulBot(invoiceMessageId: Int64, currency: String, totalAmount: Int64, invoicePayload: String, shippingOptionId: String, orderInfo: TDObject.OrderInfo, telegramPaymentChargeId: String, providerPaymentChargeId: String)

        /**
         A contact has registered with Telegram
         */
        case actRegistered

        /**
         The current user has connected a website by logging in using Telegram Login Widget on it

         - domainName: Domain name of the connected website
         */
        case websiteConnected(domainName: String)

        /**
         Telegram Passport data has been sent

         - types: List of Telegram Passport element types sent
         */
        case passportDataSent(types: [TDEnum.PassportElementType])

        /**
         Telegram Passport data has been received; for bots only

         - elements: List of received Telegram Passport elements
         - credentials: Encrypted data credentials
         */
        case passportDataReceived(elements: [TDObject.EncryptedPassportElement], credentials: TDObject.EncryptedCredentials)

        /**
         Message content that is not supported by the client
         */
        case unsupported

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "messageText":
                let text = try container.decode(TDObject.FormattedText.self, forKey: .init(string: "text"))
                let webPage = try container.decode(TDObject.WebPage.self, forKey: .init(string: "webPage"))

                self = .text(text: text, webPage: webPage)

            case "messageAnimation":
                let animation = try container.decode(TDObject.Animation.self, forKey: .init(string: "animation"))
                let caption = try container.decode(TDObject.FormattedText.self, forKey: .init(string: "caption"))
                let isSecret = try container.decode(Bool.self, forKey: .init(string: "isSecret"))

                self = .animation(animation: animation, caption: caption, isSecret: isSecret)

            case "messageAudio":
                let audio = try container.decode(TDObject.Audio.self, forKey: .init(string: "audio"))
                let caption = try container.decode(TDObject.FormattedText.self, forKey: .init(string: "caption"))

                self = .audio(audio: audio, caption: caption)

            case "messageDocument":
                let document = try container.decode(TDObject.Document.self, forKey: .init(string: "document"))
                let caption = try container.decode(TDObject.FormattedText.self, forKey: .init(string: "caption"))

                self = .document(document: document, caption: caption)

            case "messagePhoto":
                let photo = try container.decode(TDObject.Photo.self, forKey: .init(string: "photo"))
                let caption = try container.decode(TDObject.FormattedText.self, forKey: .init(string: "caption"))
                let isSecret = try container.decode(Bool.self, forKey: .init(string: "isSecret"))

                self = .photo(photo: photo, caption: caption, isSecret: isSecret)

            case "messageExpiredPhoto":
                self = .expiredPhoto

            case "messageSticker":
                let sticker = try container.decode(TDObject.Sticker.self, forKey: .init(string: "sticker"))

                self = .sticker(sticker: sticker)

            case "messageVideo":
                let video = try container.decode(TDObject.Video.self, forKey: .init(string: "video"))
                let caption = try container.decode(TDObject.FormattedText.self, forKey: .init(string: "caption"))
                let isSecret = try container.decode(Bool.self, forKey: .init(string: "isSecret"))

                self = .video(video: video, caption: caption, isSecret: isSecret)

            case "messageExpiredVideo":
                self = .expiredVideo

            case "messageVideoNote":
                let videoNote = try container.decode(TDObject.VideoNote.self, forKey: .init(string: "videoNote"))
                let isViewed = try container.decode(Bool.self, forKey: .init(string: "isViewed"))
                let isSecret = try container.decode(Bool.self, forKey: .init(string: "isSecret"))

                self = .videoNote(videoNote: videoNote, isViewed: isViewed, isSecret: isSecret)

            case "messageVoiceNote":
                let voiceNote = try container.decode(TDObject.VoiceNote.self, forKey: .init(string: "voiceNote"))
                let caption = try container.decode(TDObject.FormattedText.self, forKey: .init(string: "caption"))
                let isListened = try container.decode(Bool.self, forKey: .init(string: "isListened"))

                self = .voiceNote(voiceNote: voiceNote, caption: caption, isListened: isListened)

            case "messageLocation":
                let location = try container.decode(TDObject.Location.self, forKey: .init(string: "location"))
                let livePeriod = try container.decode(Int.self, forKey: .init(string: "livePeriod"))
                let expiresIn = try container.decode(Int.self, forKey: .init(string: "expiresIn"))

                self = .location(location: location, livePeriod: livePeriod, expiresIn: expiresIn)

            case "messageVenue":
                let venue = try container.decode(TDObject.Venue.self, forKey: .init(string: "venue"))

                self = .venue(venue: venue)

            case "messageContact":
                let contact = try container.decode(TDObject.Contact.self, forKey: .init(string: "contact"))

                self = .act(contact: contact)

            case "messageGame":
                let game = try container.decode(TDObject.Game.self, forKey: .init(string: "game"))

                self = .game(game: game)

            case "messagePoll":
                let poll = try container.decode(TDObject.Poll.self, forKey: .init(string: "poll"))

                self = .poll(poll: poll)

            case "messageInvoice":
                let title = try container.decode(String.self, forKey: .init(string: "title"))
                let description = try container.decode(String.self, forKey: .init(string: "description"))
                let photo = try container.decode(TDObject.Photo.self, forKey: .init(string: "photo"))
                let currency = try container.decode(String.self, forKey: .init(string: "currency"))
                let totalAmount = try container.decodeInt64(forKey: .init(string: "totalAmount"))
                let startParameter = try container.decode(String.self, forKey: .init(string: "startParameter"))
                let isTest = try container.decode(Bool.self, forKey: .init(string: "isTest"))
                let needShippingAddress = try container.decode(Bool.self, forKey: .init(string: "needShippingAddress"))
                let receiptMessageId = try container.decodeInt64(forKey: .init(string: "receiptMessageId"))

                self = .invoice(title: title, description: description, photo: photo, currency: currency, totalAmount: totalAmount, startParameter: startParameter, isTest: isTest, needShippingAddress: needShippingAddress, receiptMessageId: receiptMessageId)

            case "messageCall":
                let discardReason = try container.decode(TDEnum.CallDiscardReason.self, forKey: .init(string: "discardReason"))
                let duration = try container.decode(Int.self, forKey: .init(string: "duration"))

                self = .all(discardReason: discardReason, duration: duration)

            case "messageBasicGroupChatCreate":
                let title = try container.decode(String.self, forKey: .init(string: "title"))
                let memberUserIds = try container.decode([Int].self, forKey: .init(string: "memberUserIds"))

                self = .basicGroupChatCreate(title: title, memberUserIds: memberUserIds)

            case "messageSupergroupChatCreate":
                let title = try container.decode(String.self, forKey: .init(string: "title"))

                self = .supergroupChatCreate(title: title)

            case "messageChatChangeTitle":
                let title = try container.decode(String.self, forKey: .init(string: "title"))

                self = .hatChangeTitle(title: title)

            case "messageChatChangePhoto":
                let photo = try container.decode(TDObject.Photo.self, forKey: .init(string: "photo"))

                self = .hatChangePhoto(photo: photo)

            case "messageChatDeletePhoto":
                self = .hatDeletePhoto

            case "messageChatAddMembers":
                let memberUserIds = try container.decode([Int].self, forKey: .init(string: "memberUserIds"))

                self = .hatAddMembers(memberUserIds: memberUserIds)

            case "messageChatJoinByLink":
                self = .hatJoinByLink

            case "messageChatDeleteMember":
                let userId = try container.decode(Int.self, forKey: .init(string: "userId"))

                self = .hatDeleteMember(userId: userId)

            case "messageChatUpgradeTo":
                let supergroupId = try container.decode(Int.self, forKey: .init(string: "supergroupId"))

                self = .hatUpgradeTo(supergroupId: supergroupId)

            case "messageChatUpgradeFrom":
                let title = try container.decode(String.self, forKey: .init(string: "title"))
                let basicGroupId = try container.decode(Int.self, forKey: .init(string: "basicGroupId"))

                self = .hatUpgradeFrom(title: title, basicGroupId: basicGroupId)

            case "messagePinMessage":
                let messageId = try container.decodeInt64(forKey: .init(string: "messageId"))

                self = .pinMessage(messageId: messageId)

            case "messageScreenshotTaken":
                self = .screenshotTaken

            case "messageChatSetTtl":
                let ttl = try container.decode(Int.self, forKey: .init(string: "ttl"))

                self = .hatSetTtl(ttl: ttl)

            case "messageCustomServiceAction":
                let text = try container.decode(String.self, forKey: .init(string: "text"))

                self = .ustomServiceAction(text: text)

            case "messageGameScore":
                let gameMessageId = try container.decodeInt64(forKey: .init(string: "gameMessageId"))
                let gameId = try container.decodeInt64(forKey: .init(string: "gameId"))
                let score = try container.decode(Int.self, forKey: .init(string: "score"))

                self = .gameScore(gameMessageId: gameMessageId, gameId: gameId, score: score)

            case "messagePaymentSuccessful":
                let invoiceMessageId = try container.decodeInt64(forKey: .init(string: "invoiceMessageId"))
                let currency = try container.decode(String.self, forKey: .init(string: "currency"))
                let totalAmount = try container.decodeInt64(forKey: .init(string: "totalAmount"))

                self = .paymentSuccessful(invoiceMessageId: invoiceMessageId, currency: currency, totalAmount: totalAmount)

            case "messagePaymentSuccessfulBot":
                let invoiceMessageId = try container.decodeInt64(forKey: .init(string: "invoiceMessageId"))
                let currency = try container.decode(String.self, forKey: .init(string: "currency"))
                let totalAmount = try container.decodeInt64(forKey: .init(string: "totalAmount"))
                let invoicePayload = try container.decode(String.self, forKey: .init(string: "invoicePayload"))
                let shippingOptionId = try container.decode(String.self, forKey: .init(string: "shippingOptionId"))
                let orderInfo = try container.decode(TDObject.OrderInfo.self, forKey: .init(string: "orderInfo"))
                let telegramPaymentChargeId = try container.decode(String.self, forKey: .init(string: "telegramPaymentChargeId"))
                let providerPaymentChargeId = try container.decode(String.self, forKey: .init(string: "providerPaymentChargeId"))

                self = .paymentSuccessfulBot(invoiceMessageId: invoiceMessageId, currency: currency, totalAmount: totalAmount, invoicePayload: invoicePayload, shippingOptionId: shippingOptionId, orderInfo: orderInfo, telegramPaymentChargeId: telegramPaymentChargeId, providerPaymentChargeId: providerPaymentChargeId)

            case "messageContactRegistered":
                self = .actRegistered

            case "messageWebsiteConnected":
                let domainName = try container.decode(String.self, forKey: .init(string: "domainName"))

                self = .websiteConnected(domainName: domainName)

            case "messagePassportDataSent":
                let types = try container.decode([TDEnum.PassportElementType].self, forKey: .init(string: "types"))

                self = .passportDataSent(types: types)

            case "messagePassportDataReceived":
                let elements = try container.decode([TDObject.EncryptedPassportElement].self, forKey: .init(string: "elements"))
                let credentials = try container.decode(TDObject.EncryptedCredentials.self, forKey: .init(string: "credentials"))

                self = .passportDataReceived(elements: elements, credentials: credentials)

            case "messageUnsupported":
                self = .unsupported

            default:
                throw DecodingError.typeMismatch(MessageContent.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined MessageContent"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .text(text, webPage):
                try container.encode("messageText", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))
                try container.encode(webPage, forKey: .init(string: "webPage"))

            case let .animation(animation, caption, isSecret):
                try container.encode("messageAnimation", forKey: .type)

                try container.encode(animation, forKey: .init(string: "animation"))
                try container.encode(caption, forKey: .init(string: "caption"))
                try container.encode(isSecret, forKey: .init(string: "isSecret"))

            case let .audio(audio, caption):
                try container.encode("messageAudio", forKey: .type)

                try container.encode(audio, forKey: .init(string: "audio"))
                try container.encode(caption, forKey: .init(string: "caption"))

            case let .document(document, caption):
                try container.encode("messageDocument", forKey: .type)

                try container.encode(document, forKey: .init(string: "document"))
                try container.encode(caption, forKey: .init(string: "caption"))

            case let .photo(photo, caption, isSecret):
                try container.encode("messagePhoto", forKey: .type)

                try container.encode(photo, forKey: .init(string: "photo"))
                try container.encode(caption, forKey: .init(string: "caption"))
                try container.encode(isSecret, forKey: .init(string: "isSecret"))

            case .expiredPhoto:
                try container.encode("messageExpiredPhoto", forKey: .type)

            case let .sticker(sticker):
                try container.encode("messageSticker", forKey: .type)

                try container.encode(sticker, forKey: .init(string: "sticker"))

            case let .video(video, caption, isSecret):
                try container.encode("messageVideo", forKey: .type)

                try container.encode(video, forKey: .init(string: "video"))
                try container.encode(caption, forKey: .init(string: "caption"))
                try container.encode(isSecret, forKey: .init(string: "isSecret"))

            case .expiredVideo:
                try container.encode("messageExpiredVideo", forKey: .type)

            case let .videoNote(videoNote, isViewed, isSecret):
                try container.encode("messageVideoNote", forKey: .type)

                try container.encode(videoNote, forKey: .init(string: "videoNote"))
                try container.encode(isViewed, forKey: .init(string: "isViewed"))
                try container.encode(isSecret, forKey: .init(string: "isSecret"))

            case let .voiceNote(voiceNote, caption, isListened):
                try container.encode("messageVoiceNote", forKey: .type)

                try container.encode(voiceNote, forKey: .init(string: "voiceNote"))
                try container.encode(caption, forKey: .init(string: "caption"))
                try container.encode(isListened, forKey: .init(string: "isListened"))

            case let .location(location, livePeriod, expiresIn):
                try container.encode("messageLocation", forKey: .type)

                try container.encode(location, forKey: .init(string: "location"))
                try container.encode(livePeriod, forKey: .init(string: "livePeriod"))
                try container.encode(expiresIn, forKey: .init(string: "expiresIn"))

            case let .venue(venue):
                try container.encode("messageVenue", forKey: .type)

                try container.encode(venue, forKey: .init(string: "venue"))

            case let .act(contact):
                try container.encode("messageContact", forKey: .type)

                try container.encode(contact, forKey: .init(string: "contact"))

            case let .game(game):
                try container.encode("messageGame", forKey: .type)

                try container.encode(game, forKey: .init(string: "game"))

            case let .poll(poll):
                try container.encode("messagePoll", forKey: .type)

                try container.encode(poll, forKey: .init(string: "poll"))

            case let .invoice(title, description, photo, currency, totalAmount, startParameter, isTest, needShippingAddress, receiptMessageId):
                try container.encode("messageInvoice", forKey: .type)

                try container.encode(title, forKey: .init(string: "title"))
                try container.encode(description, forKey: .init(string: "description"))
                try container.encode(photo, forKey: .init(string: "photo"))
                try container.encode(currency, forKey: .init(string: "currency"))
                try container.encodeInt64(totalAmount, forKey: .init(string: "totalAmount"))
                try container.encode(startParameter, forKey: .init(string: "startParameter"))
                try container.encode(isTest, forKey: .init(string: "isTest"))
                try container.encode(needShippingAddress, forKey: .init(string: "needShippingAddress"))
                try container.encodeInt64(receiptMessageId, forKey: .init(string: "receiptMessageId"))

            case let .all(discardReason, duration):
                try container.encode("messageCall", forKey: .type)

                try container.encode(discardReason, forKey: .init(string: "discardReason"))
                try container.encode(duration, forKey: .init(string: "duration"))

            case let .basicGroupChatCreate(title, memberUserIds):
                try container.encode("messageBasicGroupChatCreate", forKey: .type)

                try container.encode(title, forKey: .init(string: "title"))
                try container.encode(memberUserIds, forKey: .init(string: "memberUserIds"))

            case let .supergroupChatCreate(title):
                try container.encode("messageSupergroupChatCreate", forKey: .type)

                try container.encode(title, forKey: .init(string: "title"))

            case let .hatChangeTitle(title):
                try container.encode("messageChatChangeTitle", forKey: .type)

                try container.encode(title, forKey: .init(string: "title"))

            case let .hatChangePhoto(photo):
                try container.encode("messageChatChangePhoto", forKey: .type)

                try container.encode(photo, forKey: .init(string: "photo"))

            case .hatDeletePhoto:
                try container.encode("messageChatDeletePhoto", forKey: .type)

            case let .hatAddMembers(memberUserIds):
                try container.encode("messageChatAddMembers", forKey: .type)

                try container.encode(memberUserIds, forKey: .init(string: "memberUserIds"))

            case .hatJoinByLink:
                try container.encode("messageChatJoinByLink", forKey: .type)

            case let .hatDeleteMember(userId):
                try container.encode("messageChatDeleteMember", forKey: .type)

                try container.encode(userId, forKey: .init(string: "userId"))

            case let .hatUpgradeTo(supergroupId):
                try container.encode("messageChatUpgradeTo", forKey: .type)

                try container.encode(supergroupId, forKey: .init(string: "supergroupId"))

            case let .hatUpgradeFrom(title, basicGroupId):
                try container.encode("messageChatUpgradeFrom", forKey: .type)

                try container.encode(title, forKey: .init(string: "title"))
                try container.encode(basicGroupId, forKey: .init(string: "basicGroupId"))

            case let .pinMessage(messageId):
                try container.encode("messagePinMessage", forKey: .type)

                try container.encodeInt64(messageId, forKey: .init(string: "messageId"))

            case .screenshotTaken:
                try container.encode("messageScreenshotTaken", forKey: .type)

            case let .hatSetTtl(ttl):
                try container.encode("messageChatSetTtl", forKey: .type)

                try container.encode(ttl, forKey: .init(string: "ttl"))

            case let .ustomServiceAction(text):
                try container.encode("messageCustomServiceAction", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))

            case let .gameScore(gameMessageId, gameId, score):
                try container.encode("messageGameScore", forKey: .type)

                try container.encodeInt64(gameMessageId, forKey: .init(string: "gameMessageId"))
                try container.encodeInt64(gameId, forKey: .init(string: "gameId"))
                try container.encode(score, forKey: .init(string: "score"))

            case let .paymentSuccessful(invoiceMessageId, currency, totalAmount):
                try container.encode("messagePaymentSuccessful", forKey: .type)

                try container.encodeInt64(invoiceMessageId, forKey: .init(string: "invoiceMessageId"))
                try container.encode(currency, forKey: .init(string: "currency"))
                try container.encodeInt64(totalAmount, forKey: .init(string: "totalAmount"))

            case let .paymentSuccessfulBot(invoiceMessageId, currency, totalAmount, invoicePayload, shippingOptionId, orderInfo, telegramPaymentChargeId, providerPaymentChargeId):
                try container.encode("messagePaymentSuccessfulBot", forKey: .type)

                try container.encodeInt64(invoiceMessageId, forKey: .init(string: "invoiceMessageId"))
                try container.encode(currency, forKey: .init(string: "currency"))
                try container.encodeInt64(totalAmount, forKey: .init(string: "totalAmount"))
                try container.encode(invoicePayload, forKey: .init(string: "invoicePayload"))
                try container.encode(shippingOptionId, forKey: .init(string: "shippingOptionId"))
                try container.encode(orderInfo, forKey: .init(string: "orderInfo"))
                try container.encode(telegramPaymentChargeId, forKey: .init(string: "telegramPaymentChargeId"))
                try container.encode(providerPaymentChargeId, forKey: .init(string: "providerPaymentChargeId"))

            case .actRegistered:
                try container.encode("messageContactRegistered", forKey: .type)

            case let .websiteConnected(domainName):
                try container.encode("messageWebsiteConnected", forKey: .type)

                try container.encode(domainName, forKey: .init(string: "domainName"))

            case let .passportDataSent(types):
                try container.encode("messagePassportDataSent", forKey: .type)

                try container.encode(types, forKey: .init(string: "types"))

            case let .passportDataReceived(elements, credentials):
                try container.encode("messagePassportDataReceived", forKey: .type)

                try container.encode(elements, forKey: .init(string: "elements"))
                try container.encode(credentials, forKey: .init(string: "credentials"))

            case .unsupported:
                try container.encode("messageUnsupported", forKey: .type)
            }
        }
    }
}
