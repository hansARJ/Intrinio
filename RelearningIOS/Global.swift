//
//  Global.swift
//  RelearningIOS
//
//  Created by Hans Arijanto on 2020-01-26.
//  Copyright © 2020 Hans Arijanto. All rights reserved.
//

import Foundation

enum printLevel: Int {
    case important = 3
    case detailed = 2
    case common = 1
    case spam = 0
}

let GLOBAL_PRINT_LEVEL: printLevel = .common

func printDebug(_ msg: Any, level: printLevel = .common) {
    #if DEBUG
        if level.rawValue >= GLOBAL_PRINT_LEVEL.rawValue {
            print("DEBUG: \(msg)")
        }
    #endif
}

extension Notification.Name {
    static let didReceiveTickData = Notification.Name("didReceiveTickData")
}
