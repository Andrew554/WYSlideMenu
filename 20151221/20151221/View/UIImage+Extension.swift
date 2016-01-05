//
//  UIImage+Extension.swift
//  20151221
//
//  Created by SinObjectC on 15/12/25.
//  Copyright © 2015年 SinObjectC. All rights reserved.
//

import UIKit

extension UIImage {
    /**
      *   根据颜色参数创建一个对应颜色的图片
      */
    class func imageWithColor(color: UIColor) -> UIImage {
        let imageW = 100;
        let imageH = 100;

        // 1.开启基于位图的图形上下文
        UIGraphicsBeginImageContextWithOptions(CGSize(width: imageW, height: imageH), false, 0.0)
        // 2.画一个color颜色的矩形
        color.set()
        UIRectFill(CGRect(x: 0, y: 0, width: imageW, height: imageH))
        // 3.拿到图形
        let image = UIGraphicsGetImageFromCurrentImageContext()
    
        // 4.关闭上下文
        UIGraphicsEndImageContext()
        
        return image
    }
}
