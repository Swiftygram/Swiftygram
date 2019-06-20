//
//  SetTdlibParameters.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/24/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation

public extension TGFunction {
    
    /**
     * Sets the parameters for TDLib initialization. Works only when the current authorization state is authorizationStateWaitTdlibParameters.
     */
    public class SetTdlibParameters: TGCompletableFunctionProtocol {
        
        public static var id: Int {
            return -1912557997
        }
        
        /// Parameters.
        public var parameters: TGObject.TdlibParameters
        
        /**
         * Creates a function, which sets the parameters for TDLib initialization. Works only when the current authorization state is authorizationStateWaitTdlibParameters.
         *
         * - Parameter parameters: Parameters.
         */
        public init(parameters: TGObject.TdlibParameters) {
            self.parameters = parameters
        }
        
    }
    
}
