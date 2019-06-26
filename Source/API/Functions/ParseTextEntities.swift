//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Parses Bold, Italic, Code, Pre, PreCode and TextUrl entities contained in the text. This is an offline method. Can be called before authorization. Can be called synchronously

     - ReturnType: `TDObject.FormattedText`
     */
    struct ParseTextEntities: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.FormattedText

        /**
         The text which should be parsed
         */
        public var text: String

        /**
         Text parse mode
         */
        public var parseMode: TDEnum.TextParseMode

        /**
         Parses Bold, Italic, Code, Pre, PreCode and TextUrl entities contained in the text. This is an offline method. Can be called before authorization. Can be called synchronously

         - Parameter text: The text which should be parsed
         - Parameter parseMode: Text parse mode
         */
        public init(text: String, parseMode: TDEnum.TextParseMode) {
            self.text = text
            self.parseMode = parseMode
        }
    }
}
