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
        
        override init() {
            super.init()
            
            NotificationCenter.default.addObserver(self, selector: #selector(Intrinio.Manager.didReceiveTickData(_:)), name: Notification.Name.didReceiveTickData, object: nil)
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

extension Intrinio.Manager {
    @objc func didReceiveTickData(_ notification: Notification) {
        guard let data = notification.userInfo as? [String: Any] else {
            printDebug("Error - Ticker notification no data")
            return
        }
        
        guard let company = data["company"] as? Intrinio.CompanyType, let value = data["value"] as? Double else {
            printDebug("Error - Ticker notification failed to parse")
            return
        }
        
        printDebug("Intrinio - Tick \(company.rawValue) $\(value)")
    }
}
