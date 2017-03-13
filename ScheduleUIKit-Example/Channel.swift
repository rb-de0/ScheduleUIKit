//
//  Channel.swift
//  ScheduleUIKit
//
//  Created by rb_de0 on 2017/03/13.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

struct Channel {
    
    let title: String
    let programs: [Program]
    
    static func mock() -> [Channel] {
        return [
            Channel(title: "anime", programs: [
                Program(title: "title", detail: "hogehogehogehogehogehogehogehoge", start: "2017-03-07 00:00", end: "2017-03-07 02:00"),
                Program(title: "title", detail: "hogehoge", start: "2017-03-07 02:00", end: "2017-03-07 03:00"),
                Program(title: "title", detail: "hogehoge", start: "2017-03-07 03:00", end: "2017-03-07 05:00"),
                Program(title: "title", detail: "hogehoge", start: "2017-03-07 05:00", end: "2017-03-07 07:00"),
                Program(title: "title", detail: "hogehoge", start: "2017-03-07 07:00", end: "2017-03-07 09:00"),
                Program(title: "title", detail: "hogehogehogehogehogehogehogehoge", start: "2017-03-07 09:00", end: "2017-03-07 10:00"),
                Program(title: "title", detail: "hogehoge", start: "2017-03-07 10:00", end: "2017-03-07 15:00"),
                Program(title: "title", detail: "hogehoge", start: "2017-03-07 15:00", end: "2017-03-07 18:00"),
                Program(title: "title", detail: "hogehoge", start: "2017-03-07 18:00", end: "2017-03-07 23:59")
                ]),
            Channel(title: "news", programs: [
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 00:00", end: "2017-03-07 02:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 02:00", end: "2017-03-07 05:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 05:00", end: "2017-03-07 10:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 10:00", end: "2017-03-07 18:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 18:00", end: "2017-03-07 23:59")
                ]),
            Channel(title: "drama", programs: [
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 00:00", end: "2017-03-07 02:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 02:00", end: "2017-03-07 05:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 05:00", end: "2017-03-07 09:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 09:00", end: "2017-03-07 10:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 10:00", end: "2017-03-07 15:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 15:00", end: "2017-03-07 18:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 18:00", end: "2017-03-07 23:59")
                ]),
            Channel(title: "anime2", programs: [
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 00:00", end: "2017-03-07 02:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 02:00", end: "2017-03-07 05:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 05:00", end: "2017-03-07 09:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 09:00", end: "2017-03-07 10:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 10:00", end: "2017-03-07 15:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 15:00", end: "2017-03-07 18:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 18:00", end: "2017-03-07 23:59")
                ]),
            Channel(title: "anime3", programs: [
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 00:00", end: "2017-03-07 02:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 02:00", end: "2017-03-07 05:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 05:00", end: "2017-03-07 09:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 09:00", end: "2017-03-07 10:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 10:00", end: "2017-03-07 15:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 15:00", end: "2017-03-07 18:00"),
                Program(title: "1", detail: "hogehoge", start: "2017-03-07 18:00", end: "2017-03-07 23:59")
                ])
        ]
    }
}

