//
//  ScheduleScrollViewDelegate.swift
//  ScheduleUIKit
//
//  Created by rb_de0 on 2017/03/13.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

import UIKit

/// ScheduleScrollViewDelegate handles view event. (like UICollectionViewDelegate)
public protocol ScheduleScrollViewDelegate: class {
    
    /// Called when the view located at indexPath is tapped.
    ///
    /// - Parameters:
    ///   - scheduleScrollView: ScheduleScrollView
    ///   - indexPath: IndexPath of tapped view
    func scheduleScrollView(_ scheduleScrollView: ScheduleScrollView, didSelectItemAt indexPath: IndexPath)
}
