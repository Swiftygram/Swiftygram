public extension TDEnum {

enum FileType: TDEnumProtocol {

/// The data is not a file
case none

/// The file is an animation
case animation

/// The file is an audio file
case audio

/// The file is a document
case document

/// The file is a photo
case photo

/// The file is a profile photo
case profilePhoto

/// The file was sent to a secret chat (the file type is not known to the server)
case secret

/// The file is a thumbnail of a file from a secret chat
case secretThumbnail

/// The file is a file from Secure storage used for storing Telegram Passport files
case secure

/// The file is a sticker
case sticker

/// The file is a thumbnail of another file
case thumbnail

/// The file type is not yet known
case unknown

/// The file is a video
case video

/// The file is a video note
case videoNote

/// The file is a voice note
case voiceNote

/// The file is a wallpaper
case wallpaper

// MARK: - Decodable
public init(from decoder: Decoder) throws {
let container = try decoder.container(keyedBy: AnyCodingKey.self)
let type = try container.decode(String.self, forKey: .init(string: "@type"))

switch type {
case "fileTypeNone":
self = .none

case "fileTypeAnimation":
self = .animation

case "fileTypeAudio":
self = .audio

case "fileTypeDocument":
self = .document

case "fileTypePhoto":
self = .photo

case "fileTypeProfilePhoto":
self = .profilePhoto

case "fileTypeSecret":
self = .secret

case "fileTypeSecretThumbnail":
self = .secretThumbnail

case "fileTypeSecure":
self = .secure

case "fileTypeSticker":
self = .sticker

case "fileTypeThumbnail":
self = .thumbnail

case "fileTypeUnknown":
self = .unknown

case "fileTypeVideo":
self = .video

case "fileTypeVideoNote":
self = .videoNote

case "fileTypeVoiceNote":
self = .voiceNote

case "fileTypeWallpaper":
self = .wallpaper

default:
throw DecodingError.typeMismatch(FileType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined FileType"))
}
}

// MARK: - Decodable
public func encode(to encoder: Encoder) throws {
var container = encoder.container(keyedBy: AnyCodingKey.self)

switch self {
case .wallpaper:
case .voiceNote:
case .videoNote:
case .video:
case .unknown:
case .thumbnail:
case .sticker:
case .secure:
case .secretThumbnail:
case .secret:
case .profilePhoto:
case .photo:
case .document:
case .audio:
case .animation:
case .none:
try container.encode("fileTypeNone", forKey: .init(string: "@type"))

try container.encode("fileTypeAnimation", forKey: .init(string: "@type"))

try container.encode("fileTypeAudio", forKey: .init(string: "@type"))

try container.encode("fileTypeDocument", forKey: .init(string: "@type"))

try container.encode("fileTypePhoto", forKey: .init(string: "@type"))

try container.encode("fileTypeProfilePhoto", forKey: .init(string: "@type"))

try container.encode("fileTypeSecret", forKey: .init(string: "@type"))

try container.encode("fileTypeSecretThumbnail", forKey: .init(string: "@type"))

try container.encode("fileTypeSecure", forKey: .init(string: "@type"))

try container.encode("fileTypeSticker", forKey: .init(string: "@type"))

try container.encode("fileTypeThumbnail", forKey: .init(string: "@type"))

try container.encode("fileTypeUnknown", forKey: .init(string: "@type"))

try container.encode("fileTypeVideo", forKey: .init(string: "@type"))

try container.encode("fileTypeVideoNote", forKey: .init(string: "@type"))

try container.encode("fileTypeVoiceNote", forKey: .init(string: "@type"))

try container.encode("fileTypeWallpaper", forKey: .init(string: "@type"))

}
}

}

}