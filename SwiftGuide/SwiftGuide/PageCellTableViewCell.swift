//
//  PageCellTableViewCell.swift
//  SwiftGuide
//
//  Created by admin on 2017/11/6.
//  Copyright © 2017年 com. All rights reserved.
//

import UIKit

class PageCellTableViewCell: UICollectionViewCell {

    
    var  imageView: UIImageView?
    
  override init(frame: CGRect) {
        super.init(frame: frame);
    
         imageView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        self.addSubview(imageView!);
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   

}
