//
//  TitleView.swift
//  20151221
//
//  Created by SinObjectC on 15/12/22.
//  Copyright © 2015年 SinObjectC. All rights reserved.
//

import UIKit

class TitleView: UIButton {
    var title: NSString!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setImage(UIImage(named: "navbar_netease")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forState: UIControlState.Normal)
        self.userInteractionEnabled = false  // 设置不可点击
        self.titleLabel!.font = UIFont.boldSystemFontOfSize(21)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.frame.size.height = self.currentImage!.size.height
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 设置标题栏
    func setViewTitle(tit: NSString) {
        self.title = tit
        self.setTitle(tit as String, forState: UIControlState.Normal)
        
        let attr: NSDictionary = [[NSFontAttributeName: self.titleLabel!.font]: [NSForegroundColorAttributeName: UIColor.whiteColor()]]

        let options4: NSStringDrawingOptions = [NSStringDrawingOptions.UsesLineFragmentOrigin, NSStringDrawingOptions.UsesFontLeading]
        
        let rect = tit.boundingRectWithSize(CGSize(width: (CGFloat)(MAXFLOAT), height: (CGFloat)(MAXFLOAT)), options: options4, attributes: attr as? [String: AnyObject], context: nil)
        self.frame.size.width = rect.width + self.titleEdgeInsets.left + (self.currentImage?.size.width)! + 25
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
