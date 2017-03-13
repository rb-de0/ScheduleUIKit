//
//  ScrollViewController.swift
//  ScheduleUIKit
//
//  Created by rb_de0 on 2017/03/12.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

import UIKit
import ScheduleUIKit

final class ScrollViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: ScheduleScrollView!
    
    fileprivate var channelList = [Channel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        channelList = Channel.mock()
        
        // set view params before setiing dataSource
        scrollView.headerHeight = 30
        scrollView.rightBarWidth = 50
        scrollView.itemWidth = 80
        scrollView.hourHeight = 50
        scrollView.margin = 2

        scrollView.dataSource = self
        scrollView.scheduleDelegate = self
    }
}

// MARK: - ScheduleScrollViewDelegate
extension ScrollViewController: ScheduleScrollViewDelegate {
    
    func scheduleScrollView(_ scheduleScrollView: ScheduleScrollView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

// MARK: - ScheduleScrollViewDataSource
extension ScrollViewController: ScheduleScrollViewDataSource {
    
    func numberOfSections() -> Int {
        return channelList.count
    }
    
    func scheduleScrollView(_ scheduleScrollView: ScheduleScrollView, numberOfItemsInSection section: Int) -> Int {
        return channelList[section].programs.count
    }

    func scheduleScrollView(_ scheduleScrollView: ScheduleScrollView, viewForAt indexPath: IndexPath) -> UIView {
        let view = UINib(nibName: "ScheduleView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! ScheduleView
        view.configure(with: channelList[indexPath.section].programs[indexPath.row])
        return view
    }
    
    func scheduleScrollView(_ scheduleScrollView: ScheduleScrollView, scheduleForItemAt indexPath: IndexPath) -> Schedulable {
         return channelList[indexPath.section].programs[indexPath.row]
    }
    
    func scheduleScrollView(_ scheduleScrollView: ScheduleScrollView, headerViewInSection section: Int) -> UIView {
        let view = UINib(nibName: "ChannelView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! ChannelView
        view.configure(with: channelList[section])
        return view
    }
    
    func scheduleScrollView(_ scheduleScrollView: ScheduleScrollView, sideViewAtHour hour: Int) -> UIView {
        let view = UINib(nibName: "SideView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! SideView
        view.configure(with: hour)
        return view
    }
}
