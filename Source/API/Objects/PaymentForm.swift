//
//  API
//  Swiftygram
//  Created by ky1vstar on 26.06.2019.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about an invoice payment form
     */
    struct PaymentForm: TDObjectProtocol {
        /**
         Full information of the invoice
         */
        public var invoice: TDObject.Invoice

        /**
         Payment form URL
         */
        public var url: URL

        /**
         Contains information about the payment provider, if available, to support it natively without the need for opening the URL; may be null
         */
        public var paymentsProvider: TDObject.PaymentsProviderStripe?

        /**
         Saved server-side order information; may be null
         */
        public var savedOrderInfo: TDObject.OrderInfo?

        /**
         Contains information about saved card credentials; may be null
         */
        public var savedCredentials: TDObject.SavedCredentials?

        /**
         True, if the user can choose to save credentials
         */
        public var canSaveCredentials: Bool

        /**
         True, if the user will be able to save credentials protected by a password they set up
         */
        public var needPassword: Bool

        /**
         Contains information about an invoice payment form

         - Parameter invoice: Full information of the invoice
         - Parameter url: Payment form URL
         - Parameter paymentsProvider: Contains information about the payment provider, if available, to support it natively without the need for opening the URL; may be null
         - Parameter savedOrderInfo: Saved server-side order information; may be null
         - Parameter savedCredentials: Contains information about saved card credentials; may be null
         - Parameter canSaveCredentials: True, if the user can choose to save credentials
         - Parameter needPassword: True, if the user will be able to save credentials protected by a password they set up
         */
        public init(invoice: TDObject.Invoice, url: URL, paymentsProvider: TDObject.PaymentsProviderStripe?, savedOrderInfo: TDObject.OrderInfo?, savedCredentials: TDObject.SavedCredentials?, canSaveCredentials: Bool, needPassword: Bool) {
            self.invoice = invoice
            self.url = url
            self.paymentsProvider = paymentsProvider
            self.savedOrderInfo = savedOrderInfo
            self.savedCredentials = savedCredentials
            self.canSaveCredentials = canSaveCredentials
            self.needPassword = needPassword
        }
    }
}
