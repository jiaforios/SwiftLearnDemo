//
//  Extension.swift
//  SwiftTable
//
//  Created by admin on 2017/11/3.
//  Copyright © 2017年 com. All rights reserved.
//

import UIKit

let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let SCREEN_WIDTH = UIScreen.main.bounds.size.width


extension UIView {
    
    public var height:CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
}
extension UIColor {
    class func RGB_COLOR_ALPHA(_ r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) ->UIColor{
        
        return UIColor(red:r/255.0, green:g/255.0, blue:b/255.0, alpha:a)
    }
    
}


