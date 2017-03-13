//
//  ScheduleScrollViewDelegate.swift
//  ScheduleUIKit
//
//  Created by rb_de0 on 2017/03/13.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

import UIKit

public protocol ScheduleScrollViewDelegate: class {
    
    func scheduleScrollView(_ scheduleScrollView: ScheduleScrollView, didSelectItemAt indexPath: IndexPath)
}
