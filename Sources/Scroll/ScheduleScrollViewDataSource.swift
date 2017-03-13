//
//  ScheduleScrollViewDataSource.swift
//  ScheduleUIKit
//
//  Created by rb_de0 on 2017/03/13.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

import UIKit

public protocol ScheduleScrollViewDataSource: class {
    
    func numberOfSections() -> Int
    
    func scheduleScrollView(_ scheduleScrollView: ScheduleScrollView, scheduleForItemAt indexPath: IndexPath) -> Schedulable
    func scheduleScrollView(_ scheduleScrollView: ScheduleScrollView, numberOfItemsInSection section: Int) -> Int
    func scheduleScrollView(_ scheduleScrollView: ScheduleScrollView, viewForAt indexPath: IndexPath) -> UIView
    func scheduleScrollView(_ scheduleScrollView: ScheduleScrollView, headerViewInSection section: Int) -> UIView
    func scheduleScrollView(_ scheduleScrollView: ScheduleScrollView, sideViewAtHour hour: Int) -> UIView
}
