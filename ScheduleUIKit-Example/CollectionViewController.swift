//
//  CollectionViewController.swift
//  ScheduleUIKit
//
//  Created by rb_de0 on 2017/03/12.
//  Copyright © 2017年 rb_de0. All rights reserved.
//

import UIKit
import ScheduleUIKit

final class CollectionViewController: UIViewController {

    @IBOutlet private weak var collectionView: ScheduleCollectionView!
    
    fileprivate var channelList = [Channel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        channelList = Channel.mock()
        
        collectionView.scheduleDataSource = self
        collectionView.dataSource = self
        
        // set view params
        collectionView.headerHeight = 30
        collectionView.rightBarWidth = 50
        
        // set layout params
        collectionView.layout.itemWidth = 80
        collectionView.layout.hourHeight = 50
        collectionView.layout.margin = 2
    }
}

// MARK: - ScheduleCollectionViewDataSource
extension CollectionViewController: ScheduleCollectionViewDataSource {
    
    func scheduleCollectionView(_ scheduleCollectionView: ScheduleCollectionView, sideViewAtHour hour: Int) -> UIView {
        let view = UINib(nibName: "SideView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! SideView
        view.configure(with: hour)
        return view
    }
    
    func scheduleCollectionView(_ scheduleCollectionView: ScheduleCollectionView, headerViewInSection section: Int) -> UIView {
        let view = UINib(nibName: "ChannelView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! ChannelView
        view.configure(with: channelList[section])
        return view
    }
    
    func scheduleCollectionView(_ scheduleCollectionView: ScheduleCollectionView, scheduleForItemAt indexPath: IndexPath) -> Schedulable {
        return channelList[indexPath.section].programs[indexPath.row]
    }

}

// MARK: - UICollectionViewDataSource
extension CollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return channelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return channelList[section].programs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScheduleCell", for: indexPath) as! ScheduleCell
        cell.configure(with: channelList[indexPath.section].programs[indexPath.row])
        return cell
    }
    
}


