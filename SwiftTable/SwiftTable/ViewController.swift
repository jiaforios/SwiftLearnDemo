//
//  ViewController.swift
//  SwiftTable
//
//  Created by admin on 2017/11/3.
//  Copyright © 2017年 com. All rights reserved.
//
// 思路描述：并没有真正改变导航栏的透明度，而是在当前view的 （0，0，width,64） 放置了一个uiview 代理导航栏的效果

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    
    var bgImgageView:UIImageView?
    var navView:UIView?
    var stretchableView:LPStretchableHeadView?
    
    var headerHeight:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 创建图片视图 添加
        bgImgageView = UIImageView(frame:CGRect(x:0,y:0,width:SCREEN_WIDTH,height:SCREEN_WIDTH*0.75))
        
        bgImgageView?.image = UIImage(named: "123.jpg")
        view.addSubview(bgImgageView!)
        
        // 创建tableView
        
        let tableview = UITableView(frame:CGRect(x:0,y:0, width:SCREEN_WIDTH,height:SCREEN_HEIGHT))
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.dataSource = self
        tableview.delegate = self
        tableview.showsVerticalScrollIndicator = false
        tableview.backgroundColor = UIColor.clear
        view .addSubview(tableview)
        
        // 创建表头
        let headerView = UIView(frame:bgImgageView!.bounds)
        headerView.height  -= 80
        headerHeight = headerView.height
        tableview.tableHeaderView = headerView
        
        //导航栏视图
        makeNavView()
        
        
        stretchableView = LPStretchableHeadView(stretchableView:bgImgageView!)
        
        
        
    }
    
    func makeNavView() {
        
        navView = UIView(frame:CGRect(x:0,y:0,width:SCREEN_WIDTH,height:64))
        view.addSubview(navView!)
        let titleLabel = UILabel(frame:navView!.bounds)
        titleLabel.text = "标题"
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .center
        navView!.addSubview(titleLabel)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath)
        cell.textLabel?.text = "111"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yoffSet = scrollView.contentOffset.y
        // 图片高度 - 导航栏高度 与tabview 的偏移 比较
        
        if yoffSet < (headerHeight - navView!.height) {
            let alpha = yoffSet / (headerHeight - navView!.height)
            navView?.backgroundColor = UIColor.RGB_COLOR_ALPHA(5, g: 175, b: 235, a: alpha)
        }else{
            navView?.backgroundColor = UIColor.RGB_COLOR_ALPHA(5, g: 175, b: 235, a: 1)
        }
        // stretchableView 将传入的图片按 指定方式变化
        stretchableView?.scrollViewDidScroll(scrollView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



