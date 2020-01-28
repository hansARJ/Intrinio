//
//  IntrinioLogger.swift
//  RelearningIOS
//
//  Created by Hans Arijanto on 2020-01-27.
//  Copyright © 2020 Hans Arijanto. All rights reserved.
//

import Foundation

extension Intrinio {
    class Logger {
        public init() {
            self.observingNotifications();
        }
        
        private func observingNotifications() {
            NotificationCenter.default.addObserver(self, selector: #selector(Intrinio.Logger.didReceiveTickData(_:)), name: Notification.Name.didReceiveTickData, object: nil)
        }
    }
}

extension Intrinio.Logger {
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
