//
//  Company.swift
//  RelearningIOS
//
//  Created by Hans Arijanto on 2020-01-26.
//  Copyright © 2020 Hans Arijanto. All rights reserved.
//

import Foundation

extension Intrinio {
    struct Company: Codable {
        let businessAddress: String?
        let businessPhoneNo: String?
        let ceo: String?
        let cik: String?
        let companyUrl: String?
        let employees: Int?
        let entityLegalForm: String?
        let entityStatus: String?
        let firstFundamentalDate: Date?
        let firstStockPriceData: Date?
        let hqAddress1: String?
        let hqAddress2: String?
        let hqAddressCity: String?
        let hqAddressPostalCode: String?
        let hqAddressCountry: String?
        let hqAddressState: String?
        let id: String?
        let incCountry: String?
        let incState: String?
        let industryCategory: String?
        let industryGroup: String?
        let lastFundamentalDate: Date?
        let lastStockPriceDate: Date?
        let latestFilingDate: Date?
        let legalName: String?
        let lei: String?
        let longDescription: String?
        let mailingAddress: String?
        let name: String?
        let sector: String?
        let shortDescription: String?
        let sic: Int?
        let standardizedActive: Bool?
        let stockExchange: String?
        let template: String?
        let ticker: String?
    }
}
