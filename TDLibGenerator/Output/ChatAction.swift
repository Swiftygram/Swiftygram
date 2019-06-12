public extension TDEnum {

enum ChatAction: TDEnumProtocol {

/// The user is typing a message
case typing

/// The user is recording a video
case recordingVideo

/// The user is uploading a video
/// 
/// - progress: Upload progress, as a percentage
case uploadingVideo(progress: Int)

/// The user is recording a voice note
case recordingVoiceNote

/// The user is uploading a voice note
/// 
/// - progress: Upload progress, as a percentage
case uploadingVoiceNote(progress: Int)

/// The user is uploading a photo
/// 
/// - progress: Upload progress, as a percentage
case uploadingPhoto(progress: Int)

/// The user is uploading a document
/// 
/// - progress: Upload progress, as a percentage
case uploadingDocument(progress: Int)

/// The user is picking a location or venue to send
case choosingLocation

/// The user is picking a contact to send
case choosingContact

/// The user has started to play a game
case startPlayingGame

/// The user is recording a video note
case recordingVideoNote

/// The user is uploading a video note
/// 
/// - progress: Upload progress, as a percentage
case uploadingVideoNote(progress: Int)

/// The user has cancelled the previous action
case cancel

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

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

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .cancel:
case .uploadingVideoNote(let progress):
case .recordingVideoNote:
case .startPlayingGame:
case .choosingContact:
case .choosingLocation:
case .uploadingDocument(let progress):
case .uploadingPhoto(let progress):
case .uploadingVoiceNote(let progress):
case .recordingVoiceNote:
case .uploadingVideo(let progress):
case .recordingVideo:
case .typing:
try container.encode("chatActionTyping", forKey: .init(string: "@type"))

try container.encode("chatActionRecordingVideo", forKey: .init(string: "@type"))

try container.encode("chatActionUploadingVideo", forKey: .init(string: "@type"))

try container.encode(progress, forKey: .init(string: "progress"))

try container.encode("chatActionRecordingVoiceNote", forKey: .init(string: "@type"))

try container.encode("chatActionUploadingVoiceNote", forKey: .init(string: "@type"))

try container.encode(progress, forKey: .init(string: "progress"))

try container.encode("chatActionUploadingPhoto", forKey: .init(string: "@type"))

try container.encode(progress, forKey: .init(string: "progress"))

try container.encode("chatActionUploadingDocument", forKey: .init(string: "@type"))

try container.encode(progress, forKey: .init(string: "progress"))

try container.encode("chatActionChoosingLocation", forKey: .init(string: "@type"))

try container.encode("chatActionChoosingContact", forKey: .init(string: "@type"))

try container.encode("chatActionStartPlayingGame", forKey: .init(string: "@type"))

try container.encode("chatActionRecordingVideoNote", forKey: .init(string: "@type"))

try container.encode("chatActionUploadingVideoNote", forKey: .init(string: "@type"))

try container.encode(progress, forKey: .init(string: "progress"))

try container.encode("chatActionCancel", forKey: .init(string: "@type"))

}
}

}

}