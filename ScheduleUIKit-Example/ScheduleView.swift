//
//  ScheduleView.swift
//  ScheduleUIKit
//
//  Created by rb_de0 on 2017/03/12.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

import UIKit

final class ScheduleView: UIView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    
    func configure(with program: Program) {
        titleLabel.text = program.title
        detailLabel.text = program.detail
    }
}
