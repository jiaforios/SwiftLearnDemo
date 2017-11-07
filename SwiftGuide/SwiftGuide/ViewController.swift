//
//  ViewController.swift
//  SwiftGuide
//
//  Created by admin on 2017/11/6.
//  Copyright © 2017年 com. All rights reserved.
// 引导页

import UIKit

class ViewController: UIViewController {

    var imgelist = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.        
        imgelist.append("image1")
        imgelist.append("image2")
        imgelist.append("image3")
        imgelist.append("image4")
        imgelist.append("image5")
    


     GuidePage.showPageGuideView(imageList: imgelist, indexBlock: { (index) in

            print("页码\(index)")
        }) {

            print("点击体验")
        }
        
        let label = UILabel(frame:CGRect(x:100,y:100,width:100,height:100))
        label.backgroundColor = UIColor.red
        view.addSubview(label)
    }
    
    
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

