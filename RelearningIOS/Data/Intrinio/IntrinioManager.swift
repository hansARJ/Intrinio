//
//  Manager.swift
//  RelearningIOS
//
//  Created by Hans Arijanto on 2020-01-26.
//  Copyright © 2020 Hans Arijanto. All rights reserved.
//

import PromiseKit

extension Intrinio {
    class Manager: RequestManager {
        
        private static let BASE_URL = "https://api-v2.intrinio.com/companies/"
        private static let API_KEY = "OmM1MDhkZTIwZjYzM2ZlZDQ1ZWExMmQ0Nzg3NjJkNzQy"
        
        private var ticker: FakeTicker? = nil
        private let logger: Intrinio.Logger = Intrinio.Logger()
        
        override init() {
            super.init()
        }
        
        func startTicking(company: Intrinio.CompanyType) {
            ticker?.stopTicking()
            
            let ticker = FakeTicker(company: company)
            ticker.startTicking()
            
            self.ticker = ticker
        }
        
        func stopTicking() {
            ticker?.stopTicking()
        }
        
        
        func get(company: Intrinio.CompanyType) -> Promise<Intrinio.Company> {
            let url = "\(Self.BASE_URL)\(company.rawValue)"
            let query = "api_key=\(Self.API_KEY)"
            
            return getJSONCodable(url: url, query: query, keyDecodingStrategy: .convertFromSnakeCase, dateFormat: "yyyy-MM-dd")
        }
    }
}
