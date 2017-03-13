//
//  ScheduleScrollViewDataSource.swift
//  ScheduleUIKit
//
//  Created by rb_de0 on 2017/03/13.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

import UIKit

/// ScheduleScrollViewDataSource provides data necessary for building TV schedule.
public protocol ScheduleScrollViewDataSource: class {
    
    /// Please return the number of sections to display in TV schedule.
    ///
    /// - Returns: number of sections
    func numberOfSections() -> Int
    
    /// Please specify the object with a schedule information.
    ///
    /// - Parameters:
    ///   - scheduleScrollView: ScheduleScrollView
    ///   - indexPath: IndexPath
    /// - Returns: a schedule information corresponding to indexPath
    func scheduleScrollView(_ scheduleScrollView: ScheduleScrollView, scheduleForItemAt indexPath: IndexPath) -> Schedulable
    
    /// Please return the number of items in section.
    ///
    /// - Parameters:
    ///   - scheduleScrollView: ScheduleScrollView
    ///   - section: section number
    /// - Returns:  number of items in section
    func scheduleScrollView(_ scheduleScrollView: ScheduleScrollView, numberOfItemsInSection section: Int) -> Int
    
    /// Please generate a view corresponding to indexPath and return it.
    ///
    /// - Parameters:
    ///   - scheduleScrollView: ScheduleScrollView
    ///   - indexPath: IndexPath
    /// - Returns: a view corresponding to indexPath
    func scheduleScrollView(_ scheduleScrollView: ScheduleScrollView, viewForAt indexPath: IndexPath) -> UIView
    
    /// Please generate header and set data. return it.
    ///
    /// - Parameters:
    ///   - scheduleScrollView: ScheduleScrollView
    ///   - section: section number
    /// - Returns:  a headerView corresponding to section
    func scheduleScrollView(_ scheduleScrollView: ScheduleScrollView, headerViewInSection section: Int) -> UIView
    
    /// Please generate sideView and set data. return it.
    ///
    /// - Parameters:
    ///   - scheduleScrollView: ScheduleScrollView
    ///   - hour: hour information (0..<24)
    /// - Returns: a sideView corresponding to hour
    func scheduleScrollView(_ scheduleScrollView: ScheduleScrollView, sideViewAtHour hour: Int) -> UIView
}
