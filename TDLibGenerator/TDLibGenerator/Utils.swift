//
//  Utils.swift
//  TDLibGenerator
//
//  Created by Oleksandr Zhuhan on 5/30/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

extension String {
    
    var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func regExMatches(with pattern: String, options: NSRegularExpression.Options = []) -> [[String]] {
        let regEx = try! NSRegularExpression(pattern: pattern, options: options)
        let nsString = self as NSString
        
        return regEx.matches(in: self, options: [], range: NSMakeRange(0, (self as NSString).length)).lazy.map({ result -> [String] in
            return (0..<result.numberOfRanges).map({
                nsString.substring(with: result.range(at: $0))
            })
        })
    }
    
    var uppercasedFirstLetter: String {
        return String(first!).uppercased() + dropFirst()
    }
    
    var lowercasedFirstLetter: String {
        return String(first!).lowercased() + dropFirst()
    }
    
    var isUppercase: Bool {
        return uppercased() == self
    }

    func sharedPrefix(with other: String) -> String {
        return (self.isEmpty || other.isEmpty || self.first! != other.first!) ? "" :
            "\(self.first!)" + String(Array(self.dropFirst())).sharedPrefix(with: String(Array(other.dropFirst())))
    }
    
    // https://docs.swift.org/swift-book/ReferenceManual/LexicalStructure.html
    var swiftEscapedIfNeeded: String {
        let reservedWords = [
            "associatedtype",
            "class",
            "deinit",
            "enum",
            "extension",
            "fileprivate",
            "func",
            "import",
            "init",
            "inout",
            "internal",
            "let",
            "open",
            "operator",
            "private",
            "protocol",
            "public",
            "static",
            "struct",
            "subscript",
            "typealias",
            "var",
            "break",
            "case",
            "continue",
            "default",
            "defer",
            "do",
            "else",
            "fallthrough",
            "for",
            "guard",
            "if",
            "in",
            "repeat",
            "return",
            "switch",
            "where",
            "while"
        ]
        
        return reservedWords.contains(self) ? "`\(self)`" : self
    }
    
    func breakLines(with maxLength: Int) -> [String] {
        var lines = [String]()
        var line = ""
        
        for word in components(separatedBy: " ") {
            let tempLine = "\(line) \(word)"
            
            if tempLine.count > maxLength {
                if line.isEmpty {
                    lines.append(tempLine)
                    line = ""
                } else {
                    lines.append(line)
                    line = word
                }
            } else {
                line = tempLine
            }
        }
        
        if !line.isEmpty || lines.isEmpty {
            lines.append(line)
        }
        
        return lines
    }
    
}

enum Lol {
    
    /// asds
    ///
    /// - Parameters:
    ///   - value: Lol
    case kek(value: String)
    
}

enum ChatEventAction: TDEnumProtocol {
    ///  A message was edited
    ///
    ///  - oldMessage: The original message before the edit
    ///  - newMessage: The message after it was edited
    case messageEdited(oldMessage: TDObject.Message, newMessage: TDObject.Message)
    
    ///  A message was deleted
    ///
    ///  - message: Deleted message
    case messageDeleted(message: TDObject.Message)
    
    ///  A message was pinned
    ///
    ///  - message: Pinned message
    case messagePinned(message: TDObject.Message)
    
    ///  A message was unpinned
    case messageUnpinned
    
    ///  A new member joined the chat
    case memberJoined
    
    ///  A member left the chat
    case memberLeft
    
    ///  A new chat member was invited
    ///
    ///  - userId: New member user identifier
    ///  - status: New member status
    case memberInvited(userId: Int, status: TDEnum.ChatMemberStatus)
    
    ///  A chat member has gained/lost administrator status, or the list of
    /// their administrator privileges has changed
    ///
    ///  - userId: Chat member user identifier
    ///  - oldStatus: Previous status of the chat member
    ///  - newStatus: New status of the chat member
    case memberPromoted(userId: Int, oldStatus: TDEnum.ChatMemberStatus, newStatus: TDEnum.ChatMemberStatus)
    
    ///  A chat member was restricted/unrestricted or banned/unbanned, or the
    /// list of their restrictions has changed
    ///
    ///  - userId: Chat member user identifier
    ///  - oldStatus: Previous status of the chat member
    ///  - newStatus: New status of the chat member
    case memberRestricted(userId: Int, oldStatus: TDEnum.ChatMemberStatus, newStatus: TDEnum.ChatMemberStatus)
    
    ///  The chat title was changed
    ///
    ///  - oldTitle: Previous chat title
    ///  - newTitle: New chat title
    case titleChanged(oldTitle: String, newTitle: String)
    
    ///  The chat description was changed
    ///
    ///  - oldDescription: Previous chat description
    ///  - newDescription: New chat description
    case descriptionChanged(oldDescription: String, newDescription: String)
    
    ///  The chat username was changed
    ///
    ///  - oldUsername: Previous chat username
    ///  - newUsername: New chat username
    case usernameChanged(oldUsername: String, newUsername: String)
    
    ///  The chat photo was changed
    ///
    ///  - oldPhoto: Previous chat photo value; may be null
    ///  - newPhoto: New chat photo value; may be null
    case photoChanged(oldPhoto: TDObject.ChatPhoto, newPhoto: TDObject.ChatPhoto)
    
    ///  The anyone_can_invite setting of a supergroup chat was toggled
    ///
    ///  - anyoneCanInvite: New value of anyone_can_invite
    case invitesToggled(anyoneCanInvite: Bool)
    
    ///  The sign_messages setting of a channel was toggled
    ///
    ///  - signMessages: New value of sign_messages
    case signMessagesToggled(signMessages: Bool)
    
    ///  The supergroup sticker set was changed
    ///
    ///  - oldStickerSetId: Previous identifier of the chat sticker set; 0 if
    /// none
    ///  - newStickerSetId: New identifier of the chat sticker set; 0 if none
    case stickerSetChanged(oldStickerSetId: Int64, newStickerSetId: Int64)
    
    ///  The is_all_history_available setting of a supergroup was toggled
    ///
    ///  - isAllHistoryAvailable: New value of is_all_history_available
    case isAllHistoryAvailableToggled(isAllHistoryAvailable: Bool)
}
