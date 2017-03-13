//
//  ScheduleScrollView.swift
//  ScheduleUIKit
//
//  Created by rb_de0 on 2017/03/12.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

import UIKit

/// ScrollView that provides a UI like TV schedule.
/// If you want to implement complex Cells, it's better to use ScheduleScrollView.
public class ScheduleScrollView: UIScrollView {
    
    /// view width
    public var itemWidth = CGFloat(160)
    
    /// height per hour
    public var hourHeight = CGFloat(40)
    
    /// margin between views
    public var margin = CGFloat(1)
    
    /// height of the header that displays data like channels.
    public var headerHeight = CGFloat(30)
    
    /// /// width of the rightBar that displays time information.
    public var rightBarWidth = CGFloat(40)
    
    private weak var headerView: UIView!
    private weak var rightBar: UIView!
    
    private var numberOfSections = 0
    
    /// dataSource provides data necessary for building TV schedule.
    public weak var dataSource: ScheduleScrollViewDataSource? {
        didSet {
            layoutViews()
        }
    }
    
    /// scheduleDelegate handles events of View
    public weak var scheduleDelegate: ScheduleScrollViewDelegate?
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        isDirectionalLockEnabled = true
        autoresizesSubviews = false
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        
        // The position is adjusted to fix the position of the header and rightBar.
        
        if let headerView = headerView {
            headerView.frame = CGRect(origin: CGPoint(x: headerView.frame.origin.x, y: contentOffset.y),
                                      size: headerView.frame.size)
        }
        
        if let rightBar = rightBar {
            rightBar.frame = CGRect(origin: CGPoint(x: contentOffset.x + frame.width - rightBarWidth, y: rightBar.frame.origin.y),
                                    size: rightBar.frame.size)
        }
    }
    
    func didSelect(gesture: ScheduleTapGestureRecognizer) {
        scheduleDelegate?.scheduleScrollView(self, didSelectItemAt: gesture.indexPath)
    }
    
    // MARK: - Private
    
    private func layoutViews() {
        
        guard let dataSource = dataSource else {
            return
        }
        
        subviews.forEach { $0.removeFromSuperview() }
        numberOfSections = dataSource.numberOfSections()
        
        let contentWidth = itemWidth * CGFloat(numberOfSections)
        let contentHeight = hourHeight * 24
        
        do {
            
            let headerView = UIView()
            headerView.clipsToBounds = true
            headerView.frame = CGRect(x: margin, y: 0, width: contentWidth - margin, height: headerHeight)
            
            addSubview(headerView)
            
            for section in 0..<numberOfSections {
                let sectionHeaderView = dataSource.scheduleScrollView(self, headerViewInSection: section)
                sectionHeaderView.frame = CGRect(x: itemWidth * CGFloat(section), y: 0, width: itemWidth, height: headerHeight)
                headerView.addSubview(sectionHeaderView)
            }
            
            self.headerView = headerView
        }
        
        do {
            
            let rightBar = UIView()
            rightBar.clipsToBounds = true
            rightBar.frame = CGRect(x: 0, y: margin, width: rightBarWidth, height: contentHeight - margin)
            
            addSubview(rightBar)
            
            for hour in 0..<24 {
                let sideView = dataSource.scheduleScrollView(self, sideViewAtHour: hour)
                sideView.frame = CGRect(x: 0, y: hourHeight * CGFloat(hour), width: rightBarWidth, height: hourHeight)
                rightBar.addSubview(sideView)
            }
            
            self.rightBar = rightBar
        }
        
        for section in 0..<numberOfSections {
            
            let numberOfItems = dataSource.scheduleScrollView(self, numberOfItemsInSection: section)
            
            for item in 0..<numberOfItems {
                
                let indexPath = IndexPath(item: item, section: section)
                let schedulable = dataSource.scheduleScrollView(self, scheduleForItemAt: indexPath)
                
                let verticalMargin = item == 0 ? margin : margin / 2
                let horizontalMargin = section == 0 ? margin : margin / 2
                
                let y = hourHeight * CGFloat(schedulable.start.percentageOfToday) * 24 + verticalMargin
                let x = itemWidth * CGFloat(section) + horizontalMargin
                
                let height = hourHeight * CGFloat(schedulable.end.percentageOfToday - schedulable.start.percentageOfToday) * 24 - verticalMargin
                let width = itemWidth - horizontalMargin
                
                let view = dataSource.scheduleScrollView(self, viewForAt: indexPath)
                let size = CGSize(width: width, height: height)
                let origin = CGPoint(x: x, y: y)
                
                view.frame = CGRect(origin: origin, size: size)
                view.isUserInteractionEnabled = true
                view.addGestureRecognizer(ScheduleTapGestureRecognizer(target: self, action: #selector(didSelect), indexPath: indexPath))
                
                addSubview(view)
            }
        }
        
        contentSize = CGSize(width: contentWidth + margin, height: contentHeight + margin)
        contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: rightBarWidth)
        contentOffset = CGPoint(x: 0, y: -headerHeight)
        
        bringSubview(toFront: headerView)
        bringSubview(toFront: rightBar)
    }
}
