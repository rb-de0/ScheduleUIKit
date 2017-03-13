//
//  ScheduleScrollView.swift
//  ScheduleUIKit
//
//  Created by rb_de0 on 2017/03/12.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

import UIKit

public class ScheduleScrollView: UIScrollView {
    
    public var itemWidth = CGFloat(160)
    public var hourHeight = CGFloat(40)
    public var margin = CGFloat(1)
    public var headerHeight = CGFloat(30)
    public var rightBarWidth = CGFloat(40)
    
    private weak var headerView: UIView!
    private weak var rightBar: UIView!
    
    private var numberOfSections = 0
    
    public weak var dataSource: ScheduleScrollViewDataSource? {
        didSet {
            layoutViews()
        }
    }
    
    public weak var scheduleDelegate: ScheduleScrollViewDelegate?
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        isDirectionalLockEnabled = true
        autoresizesSubviews = false
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        
        if let headerView = headerView {
            headerView.frame = CGRect(origin: CGPoint(x: 0, y: contentOffset.y), size: headerView.frame.size)
        }
        
        if let rightBar = rightBar {
            rightBar.frame = CGRect(origin: CGPoint(x: contentOffset.x + frame.width - rightBarWidth, y: 0),
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
        
        let contentWidth = itemWidth * CGFloat(numberOfSections) + margin
        let contentHeight = hourHeight * 24 + margin
        
        do {
            
            let headerView = UIView()
            headerView.frame = CGRect(x: 0, y: 0, width: contentWidth - margin, height: headerHeight)
            
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
            rightBar.frame = CGRect(x: 0, y: 0, width: rightBarWidth, height: contentHeight)
            
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
                
                let topMargin = item == 0 ? margin : margin / 2
                let leftMargin = section == 0 ? margin : margin / 2
                
                let y = hourHeight * CGFloat(schedulable.start.percentageOfToday) * 24 + topMargin
                let x = itemWidth * CGFloat(section) + leftMargin
                
                let height = hourHeight * CGFloat(schedulable.end.percentageOfToday - schedulable.start.percentageOfToday) * 24 - topMargin
                let width = itemWidth - leftMargin
                
                let view = dataSource.scheduleScrollView(self, viewForAt: indexPath)
                let size = CGSize(width: width, height: height)
                let origin = CGPoint(x: x, y: y)
                view.frame = CGRect(origin: origin, size: size)
                
                view.isUserInteractionEnabled = true
                view.addGestureRecognizer(ScheduleTapGestureRecognizer(target: self, action: #selector(didSelect), indexPath: indexPath))
                
                addSubview(view)
            }
        }
        
        contentSize = CGSize(width: contentWidth, height: contentHeight)
        contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: rightBarWidth)
        contentOffset = CGPoint(x: 0, y: -headerHeight)
        
        bringSubview(toFront: headerView)
        bringSubview(toFront: rightBar)
    }
}
