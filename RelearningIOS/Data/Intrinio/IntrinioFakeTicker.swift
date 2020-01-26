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
        let company: Intrinio.CompanyType
        private var tickTimer: Timer? = nil
        
        init(company: Intrinio.CompanyType) {
            self.company = company
        }
        
        func startTicking(interval: Double = 1.0) {
            tickTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
                printDebug("Tick!")
            }
        }
        
        func stopTicking() {
            tickTimer?.invalidate()
        }
    }
}
