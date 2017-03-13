//
//  DateExtension.swift
//  SchduleUIKit
//
//  Created by rb_de0 on 2017/03/13.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

import Foundation

public extension Date {
    
    /// It is the ratio of how long it has passed since 0 o'clock.
    var percentageOfToday: Double {
        let currentMinutes = Calendar.current.component(.minute, from: self)
        let minutesSum = Calendar.current.component(.hour, from: self) * 60
        return Double(minutesSum + currentMinutes) / (24 * 60)
    }
}
