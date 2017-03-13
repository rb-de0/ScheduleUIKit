//
//  ScheduleTapGestureRecognizer.swift
//  ScheduleUIKit
//
//  Created by rb_de0 on 2017/03/13.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

class ScheduleTapGestureRecognizer: UITapGestureRecognizer {
    
    let indexPath: IndexPath
    
    init(target: Any?, action: Selector?, indexPath: IndexPath) {
        
        self.indexPath = indexPath
        
        super.init(target: target, action: action)
    }
}
