//
//  ChatAction.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Describes the different types of activity in a chat
     */
    enum ChatAction: TDEnumProtocol {
        /**
         The user is typing a message
         */
        case typing

        /**
         The user is recording a video
         */
        case recordingVideo

        /**
         The user is uploading a video

         - progress: Upload progress, as a percentage
         */
        case uploadingVideo(progress: Int)

        /**
         The user is recording a voice note
         */
        case recordingVoiceNote

        /**
         The user is uploading a voice note

         - progress: Upload progress, as a percentage
         */
        case uploadingVoiceNote(progress: Int)

        /**
         The user is uploading a photo

         - progress: Upload progress, as a percentage
         */
        case uploadingPhoto(progress: Int)

        /**
         The user is uploading a document

         - progress: Upload progress, as a percentage
         */
        case uploadingDocument(progress: Int)

        /**
         The user is picking a location or venue to send
         */
        case choosingLocation

        /**
         The user is picking a contact to send
         */
        case choosingContact

        /**
         The user has started to play a game
         */
        case startPlayingGame

        /**
         The user is recording a video note
         */
        case recordingVideoNote

        /**
         The user is uploading a video note

         - progress: Upload progress, as a percentage
         */
        case uploadingVideoNote(progress: Int)

        /**
         The user has cancelled the previous action
         */
        case cancel

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "chatActionTyping":
                self = .typing

            case "chatActionRecordingVideo":
                self = .recordingVideo

            case "chatActionUploadingVideo":
                let progress = try container.decode(Int.self, forKey: .init(string: "progress"))

                self = .uploadingVideo(progress: progress)

            case "chatActionRecordingVoiceNote":
                self = .recordingVoiceNote

            case "chatActionUploadingVoiceNote":
                let progress = try container.decode(Int.self, forKey: .init(string: "progress"))

                self = .uploadingVoiceNote(progress: progress)

            case "chatActionUploadingPhoto":
                let progress = try container.decode(Int.self, forKey: .init(string: "progress"))

                self = .uploadingPhoto(progress: progress)

            case "chatActionUploadingDocument":
                let progress = try container.decode(Int.self, forKey: .init(string: "progress"))

                self = .uploadingDocument(progress: progress)

            case "chatActionChoosingLocation":
                self = .choosingLocation

            case "chatActionChoosingContact":
                self = .choosingContact

            case "chatActionStartPlayingGame":
                self = .startPlayingGame

            case "chatActionRecordingVideoNote":
                self = .recordingVideoNote

            case "chatActionUploadingVideoNote":
                let progress = try container.decode(Int.self, forKey: .init(string: "progress"))

                self = .uploadingVideoNote(progress: progress)

            case "chatActionCancel":
                self = .cancel

            default:
                throw DecodingError.typeMismatch(ChatAction.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined ChatAction"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case .typing:
                try container.encode("chatActionTyping", forKey: .type)

            case .recordingVideo:
                try container.encode("chatActionRecordingVideo", forKey: .type)

            case let .uploadingVideo(progress):
                try container.encode("chatActionUploadingVideo", forKey: .type)

                try container.encode(progress, forKey: .init(string: "progress"))

            case .recordingVoiceNote:
                try container.encode("chatActionRecordingVoiceNote", forKey: .type)

            case let .uploadingVoiceNote(progress):
                try container.encode("chatActionUploadingVoiceNote", forKey: .type)

                try container.encode(progress, forKey: .init(string: "progress"))

            case let .uploadingPhoto(progress):
                try container.encode("chatActionUploadingPhoto", forKey: .type)

                try container.encode(progress, forKey: .init(string: "progress"))

            case let .uploadingDocument(progress):
                try container.encode("chatActionUploadingDocument", forKey: .type)

                try container.encode(progress, forKey: .init(string: "progress"))

            case .choosingLocation:
                try container.encode("chatActionChoosingLocation", forKey: .type)

            case .choosingContact:
                try container.encode("chatActionChoosingContact", forKey: .type)

            case .startPlayingGame:
                try container.encode("chatActionStartPlayingGame", forKey: .type)

            case .recordingVideoNote:
                try container.encode("chatActionRecordingVideoNote", forKey: .type)

            case let .uploadingVideoNote(progress):
                try container.encode("chatActionUploadingVideoNote", forKey: .type)

                try container.encode(progress, forKey: .init(string: "progress"))

            case .cancel:
                try container.encode("chatActionCancel", forKey: .type)
            }
        }
    }
}
