//
//  PageBlock.swift
//  Swiftygram
//  Created by ky1vstar on 6/26/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDEnum {
    /**
     Describes a block of an instant view web page
     */
    indirect enum PageBlock: TDEnumProtocol {
        /**
         The title of a page

         - title: Title
         */
        case title(title: TDEnum.RichText)

        /**
         The subtitle of a page

         - subtitle: Subtitle
         */
        case subtitle(subtitle: TDEnum.RichText)

        /**
         The author and publishing date of a page

         - author: Author
         - publishDate: Point in time (Unix timestamp) when the article was published; 0 if unknown
         */
        case authorDate(author: TDEnum.RichText, publishDate: Foundation.Date?)

        /**
         A header

         - header: Header
         */
        case header(header: TDEnum.RichText)

        /**
         A subheader

         - subheader: Subheader
         */
        case subheader(subheader: TDEnum.RichText)

        /**
         A kicker

         - kicker: Kicker
         */
        case kicker(kicker: TDEnum.RichText)

        /**
         A text paragraph

         - text: Paragraph text
         */
        case paragraph(text: TDEnum.RichText)

        /**
         A preformatted text paragraph

         - text: Paragraph text
         - language: Programming language for which the text should be formatted
         */
        case preformatted(text: TDEnum.RichText, language: String)

        /**
         The footer of a page

         - footer: Footer
         */
        case footer(footer: TDEnum.RichText)

        /**
         An empty block separating a page
         */
        case divider

        /**
         An invisible anchor on a page, which can be used in a URL to open the page from the specified anchor

         - name: Name of the anchor
         */
        case anchor(name: String)

        /**
         A list of data blocks

         - items: The items of the list
         */
        case list(items: [TDObject.PageBlockListItem])

        /**
         A block quote

         - text: Quote text
         - credit: Quote credit
         */
        case blockQuote(text: TDEnum.RichText, credit: TDEnum.RichText)

        /**
         A pull quote

         - text: Quote text
         - credit: Quote credit
         */
        case pullQuote(text: TDEnum.RichText, credit: TDEnum.RichText)

        /**
         An animation

         - animation: Animation file; may be null
         - caption: Animation caption
         - needAutoplay: True, if the animation should be played automatically
         */
        case animation(animation: TDObject.Animation, caption: TDObject.PageBlockCaption, needAutoplay: Bool)

        /**
         An audio file

         - audio: Audio file; may be null
         - caption: Audio file caption
         */
        case audio(audio: TDObject.Audio, caption: TDObject.PageBlockCaption)

        /**
         A photo

         - photo: Photo file; may be null
         - caption: Photo caption
         - url: URL that needs to be opened when the photo is clicked
         */
        case photo(photo: TDObject.Photo, caption: TDObject.PageBlockCaption, url: URL)

        /**
         A video

         - video: Video file; may be null
         - caption: Video caption
         - needAutoplay: True, if the video should be played automatically
         - isLooped: True, if the video should be looped
         */
        case video(video: TDObject.Video, caption: TDObject.PageBlockCaption, needAutoplay: Bool, isLooped: Bool)

        /**
         A page cover

         - cover: Cover
         */
        case cover(cover: TDEnum.PageBlock)

        /**
         An embedded web page

         - url: Web page URL, if available
         - html: HTML-markup of the embedded page
         - posterPhoto: Poster photo, if available; may be null
         - width: Block width, 0 if unknown
         - height: Block height, 0 if unknown
         - caption: Block caption
         - isFullWidth: True, if the block should be full width
         - allowScrolling: True, if scrolling should be allowed
         */
        case embedded(url: URL?, html: String, posterPhoto: TDObject.Photo?, width: Int, height: Int, caption: TDObject.PageBlockCaption, isFullWidth: Bool, allowScrolling: Bool)

        /**
         An embedded post

         - url: Web page URL
         - author: Post author
         - authorPhoto: Post author photo
         - date: Point in time (Unix timestamp) when the post was created; 0 if unknown
         - pageBlocks: Post content
         - caption: Post caption
         */
        case embeddedPost(url: URL, author: String, authorPhoto: TDObject.Photo, date: Foundation.Date?, pageBlocks: [TDEnum.PageBlock], caption: TDObject.PageBlockCaption)

        /**
         A collage

         - pageBlocks: Collage item contents
         - caption: Block caption
         */
        case collage(pageBlocks: [TDEnum.PageBlock], caption: TDObject.PageBlockCaption)

        /**
         A slideshow

         - pageBlocks: Slideshow item contents
         - caption: Block caption
         */
        case slideshow(pageBlocks: [TDEnum.PageBlock], caption: TDObject.PageBlockCaption)

        /**
         A link to a chat

         - title: Chat title
         - photo: Chat photo; may be null
         - username: Chat username, by which all other information about the chat should be resolved
         */
        case chatLink(title: String, photo: TDObject.ChatPhoto, username: String)

        /**
         A table

         - caption: Table caption
         - cells: Table cells
         - isBordered: True, if the table is bordered
         - isStriped: True, if the table is striped
         */
        case table(caption: TDEnum.RichText, cells: [[TDObject.PageBlockTableCell]], isBordered: Bool, isStriped: Bool)

        /**
         A collapsible block

         - header: Always visible heading for the block
         - pageBlocks: Block contents
         - isOpen: True, if the block is open by default
         */
        case details(header: TDEnum.RichText, pageBlocks: [TDEnum.PageBlock], isOpen: Bool)

        /**
         Related articles

         - header: Block header
         - articles: List of related articles
         */
        case relatedArticles(header: TDEnum.RichText, articles: [TDObject.PageBlockRelatedArticle])

        /**
         A map

         - location: Location of the map center
         - zoom: Map zoom level
         - width: Map width
         - height: Map height
         - caption: Block caption
         */
        case map(location: TDObject.Location, zoom: Int, width: Int, height: Int, caption: TDObject.PageBlockCaption)

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            let type = try container.decode(String.self, forKey: .type)

            switch type {
            case "pageBlockTitle":
                let title = try container.decode(TDEnum.RichText.self, forKey: .init(string: "title"))

                self = .title(title: title)

            case "pageBlockSubtitle":
                let subtitle = try container.decode(TDEnum.RichText.self, forKey: .init(string: "subtitle"))

                self = .subtitle(subtitle: subtitle)

            case "pageBlockAuthorDate":
                let author = try container.decode(TDEnum.RichText.self, forKey: .init(string: "author"))
                let publishDate = try container.decodeDateIfPresent(forKey: .init(string: "publishDate"))

                self = .authorDate(author: author, publishDate: publishDate)

            case "pageBlockHeader":
                let header = try container.decode(TDEnum.RichText.self, forKey: .init(string: "header"))

                self = .header(header: header)

            case "pageBlockSubheader":
                let subheader = try container.decode(TDEnum.RichText.self, forKey: .init(string: "subheader"))

                self = .subheader(subheader: subheader)

            case "pageBlockKicker":
                let kicker = try container.decode(TDEnum.RichText.self, forKey: .init(string: "kicker"))

                self = .kicker(kicker: kicker)

            case "pageBlockParagraph":
                let text = try container.decode(TDEnum.RichText.self, forKey: .init(string: "text"))

                self = .paragraph(text: text)

            case "pageBlockPreformatted":
                let text = try container.decode(TDEnum.RichText.self, forKey: .init(string: "text"))
                let language = try container.decode(String.self, forKey: .init(string: "language"))

                self = .preformatted(text: text, language: language)

            case "pageBlockFooter":
                let footer = try container.decode(TDEnum.RichText.self, forKey: .init(string: "footer"))

                self = .footer(footer: footer)

            case "pageBlockDivider":
                self = .divider

            case "pageBlockAnchor":
                let name = try container.decode(String.self, forKey: .init(string: "name"))

                self = .anchor(name: name)

            case "pageBlockList":
                let items = try container.decode([TDObject.PageBlockListItem].self, forKey: .init(string: "items"))

                self = .list(items: items)

            case "pageBlockBlockQuote":
                let text = try container.decode(TDEnum.RichText.self, forKey: .init(string: "text"))
                let credit = try container.decode(TDEnum.RichText.self, forKey: .init(string: "credit"))

                self = .blockQuote(text: text, credit: credit)

            case "pageBlockPullQuote":
                let text = try container.decode(TDEnum.RichText.self, forKey: .init(string: "text"))
                let credit = try container.decode(TDEnum.RichText.self, forKey: .init(string: "credit"))

                self = .pullQuote(text: text, credit: credit)

            case "pageBlockAnimation":
                let animation = try container.decode(TDObject.Animation.self, forKey: .init(string: "animation"))
                let caption = try container.decode(TDObject.PageBlockCaption.self, forKey: .init(string: "caption"))
                let needAutoplay = try container.decode(Bool.self, forKey: .init(string: "needAutoplay"))

                self = .animation(animation: animation, caption: caption, needAutoplay: needAutoplay)

            case "pageBlockAudio":
                let audio = try container.decode(TDObject.Audio.self, forKey: .init(string: "audio"))
                let caption = try container.decode(TDObject.PageBlockCaption.self, forKey: .init(string: "caption"))

                self = .audio(audio: audio, caption: caption)

            case "pageBlockPhoto":
                let photo = try container.decode(TDObject.Photo.self, forKey: .init(string: "photo"))
                let caption = try container.decode(TDObject.PageBlockCaption.self, forKey: .init(string: "caption"))
                let url = try container.decode(URL.self, forKey: .init(string: "url"))

                self = .photo(photo: photo, caption: caption, url: url)

            case "pageBlockVideo":
                let video = try container.decode(TDObject.Video.self, forKey: .init(string: "video"))
                let caption = try container.decode(TDObject.PageBlockCaption.self, forKey: .init(string: "caption"))
                let needAutoplay = try container.decode(Bool.self, forKey: .init(string: "needAutoplay"))
                let isLooped = try container.decode(Bool.self, forKey: .init(string: "isLooped"))

                self = .video(video: video, caption: caption, needAutoplay: needAutoplay, isLooped: isLooped)

            case "pageBlockCover":
                let cover = try container.decode(TDEnum.PageBlock.self, forKey: .init(string: "cover"))

                self = .cover(cover: cover)

            case "pageBlockEmbedded":
                let url = try container.decodeIfPresent(URL.self, forKey: .init(string: "url"))
                let html = try container.decode(String.self, forKey: .init(string: "html"))
                let posterPhoto = try container.decodeIfPresent(TDObject.Photo.self, forKey: .init(string: "posterPhoto"))
                let width = try container.decode(Int.self, forKey: .init(string: "width"))
                let height = try container.decode(Int.self, forKey: .init(string: "height"))
                let caption = try container.decode(TDObject.PageBlockCaption.self, forKey: .init(string: "caption"))
                let isFullWidth = try container.decode(Bool.self, forKey: .init(string: "isFullWidth"))
                let allowScrolling = try container.decode(Bool.self, forKey: .init(string: "allowScrolling"))

                self = .embedded(url: url, html: html, posterPhoto: posterPhoto, width: width, height: height, caption: caption, isFullWidth: isFullWidth, allowScrolling: allowScrolling)

            case "pageBlockEmbeddedPost":
                let url = try container.decode(URL.self, forKey: .init(string: "url"))
                let author = try container.decode(String.self, forKey: .init(string: "author"))
                let authorPhoto = try container.decode(TDObject.Photo.self, forKey: .init(string: "authorPhoto"))
                let date = try container.decodeDateIfPresent(forKey: .init(string: "date"))
                let pageBlocks = try container.decode([TDEnum.PageBlock].self, forKey: .init(string: "pageBlocks"))
                let caption = try container.decode(TDObject.PageBlockCaption.self, forKey: .init(string: "caption"))

                self = .embeddedPost(url: url, author: author, authorPhoto: authorPhoto, date: date, pageBlocks: pageBlocks, caption: caption)

            case "pageBlockCollage":
                let pageBlocks = try container.decode([TDEnum.PageBlock].self, forKey: .init(string: "pageBlocks"))
                let caption = try container.decode(TDObject.PageBlockCaption.self, forKey: .init(string: "caption"))

                self = .collage(pageBlocks: pageBlocks, caption: caption)

            case "pageBlockSlideshow":
                let pageBlocks = try container.decode([TDEnum.PageBlock].self, forKey: .init(string: "pageBlocks"))
                let caption = try container.decode(TDObject.PageBlockCaption.self, forKey: .init(string: "caption"))

                self = .slideshow(pageBlocks: pageBlocks, caption: caption)

            case "pageBlockChatLink":
                let title = try container.decode(String.self, forKey: .init(string: "title"))
                let photo = try container.decode(TDObject.ChatPhoto.self, forKey: .init(string: "photo"))
                let username = try container.decode(String.self, forKey: .init(string: "username"))

                self = .chatLink(title: title, photo: photo, username: username)

            case "pageBlockTable":
                let caption = try container.decode(TDEnum.RichText.self, forKey: .init(string: "caption"))
                let cells = try container.decode([[TDObject.PageBlockTableCell]].self, forKey: .init(string: "cells"))
                let isBordered = try container.decode(Bool.self, forKey: .init(string: "isBordered"))
                let isStriped = try container.decode(Bool.self, forKey: .init(string: "isStriped"))

                self = .table(caption: caption, cells: cells, isBordered: isBordered, isStriped: isStriped)

            case "pageBlockDetails":
                let header = try container.decode(TDEnum.RichText.self, forKey: .init(string: "header"))
                let pageBlocks = try container.decode([TDEnum.PageBlock].self, forKey: .init(string: "pageBlocks"))
                let isOpen = try container.decode(Bool.self, forKey: .init(string: "isOpen"))

                self = .details(header: header, pageBlocks: pageBlocks, isOpen: isOpen)

            case "pageBlockRelatedArticles":
                let header = try container.decode(TDEnum.RichText.self, forKey: .init(string: "header"))
                let articles = try container.decode([TDObject.PageBlockRelatedArticle].self, forKey: .init(string: "articles"))

                self = .relatedArticles(header: header, articles: articles)

            case "pageBlockMap":
                let location = try container.decode(TDObject.Location.self, forKey: .init(string: "location"))
                let zoom = try container.decode(Int.self, forKey: .init(string: "zoom"))
                let width = try container.decode(Int.self, forKey: .init(string: "width"))
                let height = try container.decode(Int.self, forKey: .init(string: "height"))
                let caption = try container.decode(TDObject.PageBlockCaption.self, forKey: .init(string: "caption"))

                self = .map(location: location, zoom: zoom, width: width, height: height, caption: caption)

            default:
                throw DecodingError.typeMismatch(PageBlock.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Undefined PageBlock"))
            }
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            switch self {
            case let .title(title):
                try container.encode("pageBlockTitle", forKey: .type)

                try container.encode(title, forKey: .init(string: "title"))

            case let .subtitle(subtitle):
                try container.encode("pageBlockSubtitle", forKey: .type)

                try container.encode(subtitle, forKey: .init(string: "subtitle"))

            case let .authorDate(author, publishDate):
                try container.encode("pageBlockAuthorDate", forKey: .type)

                try container.encode(author, forKey: .init(string: "author"))
                try container.encodeDateIfPresent(publishDate, forKey: .init(string: "publishDate"))

            case let .header(header):
                try container.encode("pageBlockHeader", forKey: .type)

                try container.encode(header, forKey: .init(string: "header"))

            case let .subheader(subheader):
                try container.encode("pageBlockSubheader", forKey: .type)

                try container.encode(subheader, forKey: .init(string: "subheader"))

            case let .kicker(kicker):
                try container.encode("pageBlockKicker", forKey: .type)

                try container.encode(kicker, forKey: .init(string: "kicker"))

            case let .paragraph(text):
                try container.encode("pageBlockParagraph", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))

            case let .preformatted(text, language):
                try container.encode("pageBlockPreformatted", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))
                try container.encode(language, forKey: .init(string: "language"))

            case let .footer(footer):
                try container.encode("pageBlockFooter", forKey: .type)

                try container.encode(footer, forKey: .init(string: "footer"))

            case .divider:
                try container.encode("pageBlockDivider", forKey: .type)

            case let .anchor(name):
                try container.encode("pageBlockAnchor", forKey: .type)

                try container.encode(name, forKey: .init(string: "name"))

            case let .list(items):
                try container.encode("pageBlockList", forKey: .type)

                try container.encode(items, forKey: .init(string: "items"))

            case let .blockQuote(text, credit):
                try container.encode("pageBlockBlockQuote", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))
                try container.encode(credit, forKey: .init(string: "credit"))

            case let .pullQuote(text, credit):
                try container.encode("pageBlockPullQuote", forKey: .type)

                try container.encode(text, forKey: .init(string: "text"))
                try container.encode(credit, forKey: .init(string: "credit"))

            case let .animation(animation, caption, needAutoplay):
                try container.encode("pageBlockAnimation", forKey: .type)

                try container.encode(animation, forKey: .init(string: "animation"))
                try container.encode(caption, forKey: .init(string: "caption"))
                try container.encode(needAutoplay, forKey: .init(string: "needAutoplay"))

            case let .audio(audio, caption):
                try container.encode("pageBlockAudio", forKey: .type)

                try container.encode(audio, forKey: .init(string: "audio"))
                try container.encode(caption, forKey: .init(string: "caption"))

            case let .photo(photo, caption, url):
                try container.encode("pageBlockPhoto", forKey: .type)

                try container.encode(photo, forKey: .init(string: "photo"))
                try container.encode(caption, forKey: .init(string: "caption"))
                try container.encode(url, forKey: .init(string: "url"))

            case let .video(video, caption, needAutoplay, isLooped):
                try container.encode("pageBlockVideo", forKey: .type)

                try container.encode(video, forKey: .init(string: "video"))
                try container.encode(caption, forKey: .init(string: "caption"))
                try container.encode(needAutoplay, forKey: .init(string: "needAutoplay"))
                try container.encode(isLooped, forKey: .init(string: "isLooped"))

            case let .cover(cover):
                try container.encode("pageBlockCover", forKey: .type)

                try container.encode(cover, forKey: .init(string: "cover"))

            case let .embedded(url, html, posterPhoto, width, height, caption, isFullWidth, allowScrolling):
                try container.encode("pageBlockEmbedded", forKey: .type)

                try container.encodeIfPresent(url, forKey: .init(string: "url"))
                try container.encode(html, forKey: .init(string: "html"))
                try container.encodeIfPresent(posterPhoto, forKey: .init(string: "posterPhoto"))
                try container.encode(width, forKey: .init(string: "width"))
                try container.encode(height, forKey: .init(string: "height"))
                try container.encode(caption, forKey: .init(string: "caption"))
                try container.encode(isFullWidth, forKey: .init(string: "isFullWidth"))
                try container.encode(allowScrolling, forKey: .init(string: "allowScrolling"))

            case let .embeddedPost(url, author, authorPhoto, date, pageBlocks, caption):
                try container.encode("pageBlockEmbeddedPost", forKey: .type)

                try container.encode(url, forKey: .init(string: "url"))
                try container.encode(author, forKey: .init(string: "author"))
                try container.encode(authorPhoto, forKey: .init(string: "authorPhoto"))
                try container.encodeDateIfPresent(date, forKey: .init(string: "date"))
                try container.encode(pageBlocks, forKey: .init(string: "pageBlocks"))
                try container.encode(caption, forKey: .init(string: "caption"))

            case let .collage(pageBlocks, caption):
                try container.encode("pageBlockCollage", forKey: .type)

                try container.encode(pageBlocks, forKey: .init(string: "pageBlocks"))
                try container.encode(caption, forKey: .init(string: "caption"))

            case let .slideshow(pageBlocks, caption):
                try container.encode("pageBlockSlideshow", forKey: .type)

                try container.encode(pageBlocks, forKey: .init(string: "pageBlocks"))
                try container.encode(caption, forKey: .init(string: "caption"))

            case let .chatLink(title, photo, username):
                try container.encode("pageBlockChatLink", forKey: .type)

                try container.encode(title, forKey: .init(string: "title"))
                try container.encode(photo, forKey: .init(string: "photo"))
                try container.encode(username, forKey: .init(string: "username"))

            case let .table(caption, cells, isBordered, isStriped):
                try container.encode("pageBlockTable", forKey: .type)

                try container.encode(caption, forKey: .init(string: "caption"))
                try container.encode(cells, forKey: .init(string: "cells"))
                try container.encode(isBordered, forKey: .init(string: "isBordered"))
                try container.encode(isStriped, forKey: .init(string: "isStriped"))

            case let .details(header, pageBlocks, isOpen):
                try container.encode("pageBlockDetails", forKey: .type)

                try container.encode(header, forKey: .init(string: "header"))
                try container.encode(pageBlocks, forKey: .init(string: "pageBlocks"))
                try container.encode(isOpen, forKey: .init(string: "isOpen"))

            case let .relatedArticles(header, articles):
                try container.encode("pageBlockRelatedArticles", forKey: .type)

                try container.encode(header, forKey: .init(string: "header"))
                try container.encode(articles, forKey: .init(string: "articles"))

            case let .map(location, zoom, width, height, caption):
                try container.encode("pageBlockMap", forKey: .type)

                try container.encode(location, forKey: .init(string: "location"))
                try container.encode(zoom, forKey: .init(string: "zoom"))
                try container.encode(width, forKey: .init(string: "width"))
                try container.encode(height, forKey: .init(string: "height"))
                try container.encode(caption, forKey: .init(string: "caption"))
            }
        }
    }
}
