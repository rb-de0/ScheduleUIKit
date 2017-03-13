//
//  Program.swift
//  ScheduleUIKit
//
//  Created by rb_de0 on 2017/03/12.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

import Foundation
import ScheduleUIKit

struct Program: Schedulable {
    
    let title: String
    let detail: String
    
    let start: Date
    let end: Date
    
    init(title: String, detail: String, start: String, end: String) {
        self.title = title
        self.detail = detail
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        self.start = formatter.date(from: start)!
        self.end = formatter.date(from: end)!
    }
}
