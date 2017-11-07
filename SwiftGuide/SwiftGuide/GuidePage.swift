//
//  GuidePage.swift
//  SwiftGuide
//
//  Created by admin on 2017/11/6.
//  Copyright © 2017年 com. All rights reserved.
//

import UIKit

let screen_width = UIScreen.main.bounds.size.width
let screen_height = UIScreen.main.bounds.size.height



class GuidePage: UIView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

   
    // 创建一个collectionview 加载引导页
    
    var collectionview : UICollectionView?
    var imgeList:Array<String>? // 引导页图片数组
    typealias indBlock = (Int)->Void // 图片位置数组
    typealias enBlock = ()->() //  点击立即体验回调
    var iblock:indBlock?
    var eblock:enBlock?
    
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    }
    
    // 类方法 提供接口
    
    class func showPageGuideView(imageList:Array<String>,indexBlock: indBlock?,endBlock: enBlock?){
        
        // 创建本视图
        
        let pageGuideView = GuidePage.init(frame: CGRect(x:0,y:0,width:screen_width,height:screen_height))
        
        pageGuideView.backgroundColor = UIColor.red
        UIApplication.shared.keyWindow?.addSubview(pageGuideView)
 

        pageGuideView.imgeList = imageList
        pageGuideView.iblock = indexBlock
        pageGuideView.eblock = endBlock
        
        // 创建UI
        pageGuideView.setupUI()
        
    }
    
    func setupUI() {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal // 设置水平滚动        
        collectionview = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height),collectionViewLayout:flowLayout)
        collectionview?.backgroundColor = UIColor.red
        collectionview?.bounces = true
        collectionview?.isPagingEnabled = true
        collectionview?.delegate = self
        collectionview?.dataSource = self
        collectionview?.showsVerticalScrollIndicator = true

        collectionview?.register(PageCellTableViewCell.self, forCellWithReuseIdentifier: "cell")
        self.addSubview(collectionview!)
    }
    
    
    //MARK collection 代理方法
    //最小 item 间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    
    //最小行间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    
    //item 的尺寸
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    //每个分区的内边距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgeList!.count
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!PageCellTableViewCell
        cell.imageView?.image = UIImage(named:imgeList![indexPath.row])
        return cell;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
