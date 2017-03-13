//
//  ScheduleCollectionViewLayout.swift
//  ScheduleUIKit
//
//  Created by rb_de0 on 2017/03/12.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

import UIKit

/// provides a UI like TV schedule.
public final class ScheduleCollectionViewLayout: UICollectionViewLayout {
    
    /// cell width
    public var itemWidth = CGFloat(100)
    
    /// height per hour
    public var hourHeight = CGFloat(30)
    
    /// margin between cells
    public var margin = CGFloat(1)
    
    private var allAttributes = [[UICollectionViewLayoutAttributes]]()
    private var numberOfSections = 0
    
    private let didSetContentSize: (CGSize) -> ()
    
    init(didSetContentSize: @escaping (CGSize) -> ()) {
        self.didSetContentSize = didSetContentSize
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func prepare() {
        
        guard let collectionView = collectionView as? ScheduleCollectionView, let dataSource = collectionView.scheduleDataSource else {
            return
        }
        
        collectionView.isDirectionalLockEnabled = true
        allAttributes = []
        numberOfSections = collectionView.numberOfSections
        
        for section in 0..<numberOfSections {
            
            let numberOfItems = collectionView.numberOfItems(inSection: section)
            
            for item in 0..<numberOfItems {
                
                let indexPath = IndexPath(item: item, section: section)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: item, section: section))
                let schedulable = dataSource.scheduleCollectionView(collectionView, scheduleForItemAt: indexPath)
                
                let topMargin = item == 0 ? margin : margin / 2
                let leftMargin = section == 0 ? margin : margin / 2

                let y = hourHeight * CGFloat(schedulable.start.percentageOfToday) * 24 + topMargin
                let x = itemWidth * CGFloat(section) + leftMargin
                
                let height = hourHeight * CGFloat(schedulable.end.percentageOfToday - schedulable.start.percentageOfToday) * 24 - topMargin
                let width = itemWidth - leftMargin
                
                attributes.frame = CGRect(x: x, y: y, width: width, height: height)
                
                if item == 0 {
                    allAttributes.append([attributes])
                } else {
                    allAttributes[section].append(attributes)
                }
            }
        }
        
        didSetContentSize(collectionViewContentSize)
    }
    
    override public var collectionViewContentSize: CGSize {
        let height = hourHeight * 24 + margin
        let width = itemWidth * CGFloat(numberOfSections) + margin
        return CGSize(width: width, height: height)
    }
    
    override public func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return allAttributes[indexPath.section][indexPath.row]
    }
    
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return allAttributes.flatMap { $0 }.filter { $0.frame.intersects(rect) }
    }
}
