//
//  Global.swift
//  RelearningIOS
//
//  Created by Hans Arijanto on 2020-01-26.
//  Copyright © 2020 Hans Arijanto. All rights reserved.
//

import Foundation


func printDebug(_ msg: Any) {
    #if DEBUG
        print("DEBUG: \(msg)")
    #endif
}

extension Notification.Name {
    static let didReceiveTickData = Notification.Name("didReceiveTickData")
}
