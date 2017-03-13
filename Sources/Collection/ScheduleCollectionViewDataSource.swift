//
//  ScheduleCollectionViewDataSource.swift
//  ScheduleUIKit
//
//  Created by rb_de0 on 2017/03/13.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

import UIKit

/// ScheduleCollectionViewDataSource provides data necessary for building TV schedule.
public protocol ScheduleCollectionViewDataSource: class {
    
    /// Please specify the object with a schedule information.
    ///
    /// - Parameters:
    ///   - scheduleCollectionView: ScheduleCollectionView
    ///   - indexPath: IndexPath
    /// - Returns: a schedule information corresponding to indexPath
    func scheduleCollectionView(_ scheduleCollectionView: ScheduleCollectionView, scheduleForItemAt indexPath: IndexPath) -> Schedulable
    
    /// Please generate header and set data. return it.
    ///
    /// - Parameters:
    ///   - scheduleCollectionView: ScheduleCollectionView
    ///   - section: section number
    /// - Returns: a headerView corresponding to section
    func scheduleCollectionView(_ scheduleCollectionView: ScheduleCollectionView, headerViewInSection section: Int) -> UIView
    
    /// Please generate sideView and set data. return it.
    ///
    /// - Parameters:
    ///   - scheduleCollectionView: ScheduleCollectionView
    ///   - hour: hour information (0..<24)
    /// - Returns: a sideView corresponding to hour
    func scheduleCollectionView(_ scheduleCollectionView: ScheduleCollectionView, sideViewAtHour hour: Int) -> UIView
}
