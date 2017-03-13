//
//  ScheduleCollectionViewDataSource.swift
//  ScheduleUIKit
//
//  Created by rb_de0 on 2017/03/13.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

import UIKit

public protocol ScheduleCollectionViewDataSource: class {
    
    func scheduleCollectionView(_ scheduleCollectionView: ScheduleCollectionView, scheduleForItemAt indexPath: IndexPath) -> Schedulable
    
    func scheduleCollectionView(_ scheduleCollectionView: ScheduleCollectionView, headerViewInSection section: Int) -> UIView
    
    func scheduleCollectionView(_ scheduleCollectionView: ScheduleCollectionView, sideViewAtHour hour: Int) -> UIView
}
