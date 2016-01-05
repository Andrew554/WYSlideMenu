//
//  Extension+UIView.swift
//  20151221
//
//  Created by SinObjectC on 16/1/2.
//  Copyright © 2016年 SinObjectC. All rights reserved.
//

import Foundation

extension UIView {
    
    public func x() -> CGFloat {
        return self.frame.origin.x
    }
    
    public func x(x: CGFloat) -> Void {
        self.frame.origin.x = x
    }
    
    public func y() -> CGFloat {
        return self.frame.origin.y
    }
    
    public func y(y: CGFloat) -> Void {
        self.frame.origin.y = y
    }

    public func width() -> CGFloat {
        return self.frame.size.width
    }
    
    public func width(width: CGFloat) -> Void {
        self.frame.size.width = width
    }
    
    public func height() -> CGFloat {
        return self.frame.size.height
    }
    
    public func height(height: CGFloat) -> Void {
        self.frame.size.height = height
    }
    
    public func centerX() -> CGFloat {
        return self.center.x
    }
    
    public func centerX(x: CGFloat) -> Void {
        self.center.x = x
    }
    
    public func centerY() -> CGFloat {
        return self.center.y
    }
    
    public func centerY(y: CGFloat) -> Void {
        self.center.y = y
    }
    
    public func size() -> CGSize {
        return self.frame.size
    }

    public func size(size: CGSize) -> Void {
        self.frame.size = size
    }
}
