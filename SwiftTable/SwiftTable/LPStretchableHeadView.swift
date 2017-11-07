//
//  LPStretchableHeadView.swift
//  SwiftTable
//
//  Created by admin on 2017/11/3.
//  Copyright © 2017年 com. All rights reserved.
//
// 滑动变化，改变视图
import UIKit

class LPStretchableHeadView: NSObject {

    private var stretchView = UIView()
    private var imageRatio:CGFloat    // 视图高宽比
    private var originFrame = CGRect()
    
    public init(stretchableView:UIView){
        
        stretchView = stretchableView
        originFrame = stretchableView.frame
        imageRatio = stretchableView.bounds.height / stretchableView.bounds.width
    }
    
    public func scrollViewDidScroll(_ scrollView:UIScrollView){
        // 获取到 y偏移
        let yoffSet = scrollView.contentOffset.y
        if yoffSet > 0{
            // 向上移动
            var frame = originFrame
            // 视图跟随向上移动
            frame.origin.y = originFrame.origin.y - yoffSet
            stretchView.frame = frame
        }else{
             // 向下移动，整体比例放大
            var frame = originFrame
            frame.size.height = originFrame.size.height - yoffSet
            // 等比例放大
            frame.size.width = frame.size.height / imageRatio
            // 变形后的宽度 - 变形前的宽度 = 宽度改变量
            // 宽度改变量 *0.5 分配到两边 = dis
            // 原x 坐标 - dis = 应该向左偏移量
            frame.origin.x = originFrame.origin.x - (frame.size.width - originFrame.size.width)*0.5
            stretchView.frame = frame;
        }
    }
}
