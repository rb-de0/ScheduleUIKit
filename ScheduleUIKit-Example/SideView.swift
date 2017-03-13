//
//  SideView.swift
//  ScheduleUIKit
//
//  Created by rb_de0 on 2017/03/12.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

import UIKit

final class SideView: UIView {
    
    @IBOutlet private weak var hourLabel: UILabel!
    
    func configure(with hour: Int) {
        hourLabel.text = String(hour)
    }
}
