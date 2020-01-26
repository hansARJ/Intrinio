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
        
        override init() {
        }
        
        func fetchData(company: Intrinio.CompanySymbol) -> Promise<Any> {
            let url = "\(Self.BASE_URL)\(company.rawValue)"
            let query = "api_key=\(Self.API_KEY)"
            
            return getJSON(url: url, query: query)
        }
    }
}
