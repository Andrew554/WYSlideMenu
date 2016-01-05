//
//  LeftMenu.swift
//  20151221
//
//  Created by SinObjectC on 15/12/22.
//  Copyright © 2015年 SinObjectC. All rights reserved.
//

import UIKit

protocol LeftMenuDelegate {
    func leftMenuClick(index: Int, toIndex: Int)
}

class LeftMenu: UIView {
    var delegate: LeftMenuDelegate!
    var selectedBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let alpha: CGFloat = 0.2
        
        self.selectedBtn = self.btnStep("sidebar_nav_news", title: "新闻", bgcolor: UIColor(red: 202/256, green: 68/256, blue: 73/256, alpha: alpha))
        self.btnStep("sidebar_nav_reading", title: "订阅", bgcolor: UIColor(red: 190/256, green: 111/256, blue: 69/256, alpha: alpha))
        self.btnStep("sidebar_nav_photo", title: "图片", bgcolor: UIColor(red: 76/256, green: 132/256, blue: 190/256, alpha: alpha))
        self.btnStep("sidebar_nav_video", title: "视频", bgcolor: UIColor(red: 101/256, green: 170/256, blue: 78/256, alpha: alpha))
        self.btnStep("sidebar_nav_comment", title: "跟帖", bgcolor: UIColor(red: 170/256, green: 172/256, blue: 73/256, alpha: alpha))
        self.btnStep("sidebar_nav_radio", title: "电台", bgcolor: UIColor(red: 190/256, green: 62/256, blue: 119/256, alpha: alpha))
       
    }
    
    func setDelegate(delegate: LeftMenuDelegate) {
        self.delegate = delegate
        print("setDelegate")
        self.buttonClick(self.subviews.first as! UIButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func btnStep(img: String, title: String, bgcolor: UIColor) -> UIButton {
        print("btnStep")
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setImage(UIImage(named: img), forState: UIControlState.Normal)
        
        btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn.setTitle(title, forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.clearColor()
       
        btn.setBackgroundImage(UIImage.imageWithColor(bgcolor), forState: UIControlState.Selected)

        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        btn.titleLabel?.font = UIFont.systemFontOfSize(16)
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        // 设置图片选中时不高亮
        btn.adjustsImageWhenHighlighted = false
        btn.tag = self.subviews.count
        btn.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.addSubview(btn)
        return btn
    }
    
    func buttonClick(btn: UIButton) {
        // 通知代理
        if(self.delegate != nil) {
            self.delegate.leftMenuClick(self.selectedBtn.tag, toIndex: btn.tag)
        }
        
        self.selectedBtn.selected = false
        btn.selected  = true
        self.selectedBtn = btn
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let btns = self.subviews
        let btnW = self.frame.size.width
        let btnH = self.frame.size.height/(CGFloat)(btns.count)
        for(var i = 0; i < btns.count; i++) {
            let btn = self.subviews[i]
            btn.frame.size.width = btnW
            btn.frame.size.height = btnH
            btn.frame.origin.x = 0
            btn.frame.origin.y = (CGFloat)(i)*btnH
        }
        
        print("layoutSubviews")
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
