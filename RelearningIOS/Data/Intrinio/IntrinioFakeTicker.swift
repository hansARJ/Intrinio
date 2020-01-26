//
//  IntrinioFakeTicker.swift
//  RelearningIOS
//
//  Created by Hans Arijanto on 2020-01-26.
//  Copyright © 2020 Hans Arijanto. All rights reserved.
//

import Foundation

extension Intrinio {
    class FakeTicker {
        static let BASE_TICKER_VALUE = 90.0
        static let TICKER_VALUE_OFFSET = 20.0
        
        let company: Intrinio.CompanyType
        private var tickTimer: Timer? = nil
        
        init(company: Intrinio.CompanyType) {
            self.company = company
        }
        
        func startTicking(interval: Double = 1.0) {
            tickTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
                let tickValue = Intrinio.FakeTicker.BASE_TICKER_VALUE + drand48() * Intrinio.FakeTicker.TICKER_VALUE_OFFSET
                printDebug("Intrinio - Tick \(self.company.rawValue) $\(tickValue)")
            }
        }
        
        func stopTicking() {
            tickTimer?.invalidate()
        }
    }
}
