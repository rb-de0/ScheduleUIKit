//
//  ScheduleCollectionView.swift
//  ScheduleUIKit
//
//  Created by rb_de0 on 2017/03/12.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

import UIKit

public class ScheduleCollectionView: UICollectionView {
    
    public var headerHeight = CGFloat(30)
    public var rightBarWidth = CGFloat(30)
    
    private weak var headerView: UIView!
    private weak var rightBar: UIView!
    
    public weak var scheduleDataSource: ScheduleCollectionViewDataSource?
    
    public var layout: ScheduleCollectionViewLayout {
        return collectionViewLayout as! ScheduleCollectionViewLayout
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        collectionViewLayout = ScheduleCollectionViewLayout(didSetContentSize: { [weak self] contentSize in
            
            guard let scheduleDataSource = self?.scheduleDataSource else {
                return
            }

            self?.initHeaderView(scheduleDataSource: scheduleDataSource, contentSize: contentSize)
            self?.initRightView(scheduleDataSource: scheduleDataSource, contentSize: contentSize)
            self?.initMargins()
        })
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        if let headerView = headerView {
            headerView.frame = CGRect(origin: CGPoint(x: 0, y: contentOffset.y),
                                      size: headerView.frame.size)
        }
        
        if let rightBar = rightBar {
            rightBar.frame = CGRect(origin: CGPoint(x: contentOffset.x + frame.width - rightBarWidth, y: 0),
                                    size: rightBar.frame.size)
        }
    }
    
    // MARK: - Initialize
    
    private func initMargins() {
        
        contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: rightBarWidth)
        contentOffset = CGPoint(x: 0, y: -headerHeight)
    }
    
    private func initHeaderView(scheduleDataSource: ScheduleCollectionViewDataSource, contentSize: CGSize) {
        
        self.headerView?.removeFromSuperview()
        
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: contentSize.width - layout.margin, height: headerHeight)
        
        addSubview(headerView)
        
        for section in 0..<numberOfSections {
            let sectionHeaderView = scheduleDataSource.scheduleCollectionView(self, headerViewInSection: section)
            sectionHeaderView.frame = CGRect(x: layout.itemWidth * CGFloat(section), y: 0, width: layout.itemWidth, height: headerHeight)
            headerView.addSubview(sectionHeaderView)
        }
        
        self.headerView = headerView
    }
    
    private func initRightView(scheduleDataSource: ScheduleCollectionViewDataSource, contentSize: CGSize) {

        self.rightBar?.removeFromSuperview()
        
        let rightBar = UIView()
        rightBar.frame = CGRect(x: 0, y: 0, width: rightBarWidth, height: contentSize.height - layout.margin)
        
        addSubview(rightBar)
        
        for hour in 0..<24 {
            let sideView = scheduleDataSource.scheduleCollectionView(self, sideViewAtHour: hour)
            sideView.frame = CGRect(x: 0, y: layout.hourHeight * CGFloat(hour), width: rightBarWidth, height: layout.hourHeight)
            rightBar.addSubview(sideView)
        }
        
        self.rightBar = rightBar
    }
}
