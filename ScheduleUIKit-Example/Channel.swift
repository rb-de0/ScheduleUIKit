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
            Channel(title: "top", programs: [
                Program(title: "top_title1", detail: "hogehoge", start: "2017-03-07 00:00", end: "2017-03-07 02:00"),
                Program(title: "top_title2", detail: "hogehoge", start: "2017-03-07 02:00", end: "2017-03-07 03:00"),
                Program(title: "top_title3", detail: "hogehoge", start: "2017-03-07 03:00", end: "2017-03-07 05:00"),
                Program(title: "top_title4", detail: "hogehoge", start: "2017-03-07 05:00", end: "2017-03-07 07:00"),
                Program(title: "top_title5", detail: "hogehoge", start: "2017-03-07 07:00", end: "2017-03-07 09:00"),
                Program(title: "top_title5", detail: "hogehoge", start: "2017-03-07 09:00", end: "2017-03-07 10:00"),
                Program(title: "top_title6", detail: "hogehoge", start: "2017-03-07 10:00", end: "2017-03-07 15:00"),
                Program(title: "top_title7", detail: "hogehoge", start: "2017-03-07 15:00", end: "2017-03-07 18:00"),
                Program(title: "top_title8", detail: "hogehoge", start: "2017-03-07 18:00", end: "2017-03-07 23:59")
                ]),
            Channel(title: "news1", programs: [
                Program(title: "news1_title1", detail: "hogehoge", start: "2017-03-07 00:00", end: "2017-03-07 02:00"),
                Program(title: "news1_title2", detail: "hogehoge", start: "2017-03-07 02:00", end: "2017-03-07 05:00"),
                Program(title: "news1_title3", detail: "hogehoge", start: "2017-03-07 05:00", end: "2017-03-07 10:00"),
                Program(title: "news1_title4", detail: "hogehoge", start: "2017-03-07 10:00", end: "2017-03-07 18:00"),
                Program(title: "news1_title5", detail: "hogehoge", start: "2017-03-07 18:00", end: "2017-03-07 23:59")
                ]),
            Channel(title: "news2", programs: [
                Program(title: "news2_title1", detail: "hogehoge", start: "2017-03-07 00:00", end: "2017-03-07 02:00"),
                Program(title: "news2_title2", detail: "hogehoge", start: "2017-03-07 02:00", end: "2017-03-07 05:00"),
                Program(title: "news2_title3", detail: "hogehoge", start: "2017-03-07 05:00", end: "2017-03-07 09:00"),
                Program(title: "news2_title4", detail: "hogehoge", start: "2017-03-07 09:00", end: "2017-03-07 10:00"),
                Program(title: "news2_title5", detail: "hogehoge", start: "2017-03-07 10:00", end: "2017-03-07 15:00"),
                Program(title: "news2_title6", detail: "hogehoge", start: "2017-03-07 15:00", end: "2017-03-07 18:00"),
                Program(title: "news2_title7", detail: "hogehoge", start: "2017-03-07 18:00", end: "2017-03-07 23:59")
                ]),
            Channel(title: "anime1", programs: [
                Program(title: "anime1_title1", detail: "hogehoge", start: "2017-03-07 00:00", end: "2017-03-07 02:00"),
                Program(title: "anime1_title2", detail: "hogehoge", start: "2017-03-07 02:00", end: "2017-03-07 05:00"),
                Program(title: "anime1_title3", detail: "hogehoge", start: "2017-03-07 05:00", end: "2017-03-07 09:00"),
                Program(title: "anime1_title4", detail: "hogehoge", start: "2017-03-07 09:00", end: "2017-03-07 10:00"),
                Program(title: "anime1_title5", detail: "hogehoge", start: "2017-03-07 10:00", end: "2017-03-07 15:00"),
                Program(title: "anime1_title6", detail: "hogehoge", start: "2017-03-07 15:00", end: "2017-03-07 18:00"),
                Program(title: "anime1_title7", detail: "hogehoge", start: "2017-03-07 18:00", end: "2017-03-07 23:59")
                ]),
            Channel(title: "anime2", programs: [
                Program(title: "anime2_title1", detail: "hogehoge", start: "2017-03-07 00:00", end: "2017-03-07 02:00"),
                Program(title: "anime2_title2", detail: "hogehoge", start: "2017-03-07 02:00", end: "2017-03-07 05:00"),
                Program(title: "anime2_title3", detail: "hogehoge", start: "2017-03-07 05:00", end: "2017-03-07 09:00"),
                Program(title: "anime2_title4", detail: "hogehoge", start: "2017-03-07 09:00", end: "2017-03-07 10:00"),
                Program(title: "anime2_title5", detail: "hogehoge", start: "2017-03-07 10:00", end: "2017-03-07 15:00"),
                Program(title: "anime2_title6", detail: "hogehoge", start: "2017-03-07 15:00", end: "2017-03-07 18:00"),
                Program(title: "anime2_title7", detail: "hogehoge", start: "2017-03-07 18:00", end: "2017-03-07 23:59")
                ])
        ]
    }
}

