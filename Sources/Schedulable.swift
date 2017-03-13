//
//  Schedulable.swift
//  SchduleUIKit
//
//  Created by rb_de0 on 2017/03/13.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

/// To set the TV schedule, you need the start time and end time of the program.
public protocol Schedulable {
    var start: Date { get }
    var end: Date { get }
}
