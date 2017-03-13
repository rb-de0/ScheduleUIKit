//
//  ChannelView.swift
//  ScheduleUIKit
//
//  Created by rb_de0 on 2017/03/12.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

import UIKit

final class ChannelView: UIView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    func configure(with channel: Channel) {
        titleLabel.text = channel.title
    }
}
