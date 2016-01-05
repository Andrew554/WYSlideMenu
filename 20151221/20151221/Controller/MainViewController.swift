//
//  ViewController.swift
//  20151221
//
//  Created by SinObjectC on 15/12/21.
//  Copyright © 2015年 SinObjectC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, LeftMenuDelegate{
    var bgImage: UIImageView!
    var showNav: HMNavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  添加模糊效果
        self.bgImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        self.bgImage.image = UIImage(named: "sidebar_bg")
        self.view.insertSubview(self.bgImage, atIndex: 0)
    
        let alpha:CGFloat = 1
        
        let news = NewsViewController()
        self.setupVc(news, title: "新闻", bgcolor: UIColor(red: 202/256, green: 68/256, blue: 73/256, alpha: alpha))
        
        let dy = DyViewController()
        self.setupVc(dy, title: "订阅", bgcolor: UIColor(red: 190/256, green: 111/256, blue: 69/256, alpha: alpha))
        
        let picture = PictureViewController()
        self.setupVc(picture, title: "图片", bgcolor: UIColor(red: 76/256, green: 132/256, blue: 190/256, alpha: alpha))
        
        let video = VideoViewController()
        self.setupVc(video, title: "视频",bgcolor: UIColor(red: 101/256, green: 170/256, blue: 78/256, alpha: alpha))
        
        let gt = GTViewController()
        self.setupVc(gt, title: "跟帖", bgcolor: UIColor(red: 170/256, green: 172/256, blue: 73/256, alpha: alpha))
        
        let dt = DTViewController()
        self.setupVc(dt, title: "电台", bgcolor: UIColor(red: 190/256, green: 62/256, blue: 119/256, alpha: alpha))
        
        //  添加左菜单
        let leftMenu = LeftMenu(frame: CGRect(x: 0, y: 60, width: 250, height: 320))
        self.view.insertSubview(leftMenu, atIndex: 1)
        leftMenu.setDelegate(self)
        
        // 添加拖动手势
        let pan = UIPanGestureRecognizer(target: self, action: "drag:")
        self.view.addGestureRecognizer(pan)
    }
    
    func drag(sender: UIPanGestureRecognizer) {
        print("drag")
    }
    
    func setupVc(vc: UIViewController, title: NSString, bgcolor: UIColor) {
        let titleView = TitleView()
        titleView.setViewTitle(title)
        vc.navigationItem.titleView = titleView
        vc.view.backgroundColor = bgcolor
        
        let newNav = HMNavigationController(rootViewController: vc)
        //  添加左边展开做菜单的按钮
        let leftBar = UIBarButtonItem(image: UIImage(named: "top_navigation_menuicon")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), style: UIBarButtonItemStyle.Plain, target: self, action: "showMenu:")
        vc.navigationItem.leftBarButtonItem = leftBar
        let rightBar = UIBarButtonItem(image: UIImage(named: "top_navigation_infoicon")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), style: UIBarButtonItemStyle.Plain, target: self, action: "showRight:")
        vc.navigationItem.rightBarButtonItem = rightBar
        
        //  将nav导航控制器添加到数组中，用于保存，保证只有当本控制器消失的时候nav才会注销
        self.addChildViewController(newNav)
    }
    
    // 显示右边个人信息
    func showRight(sender: UIBarButtonItem) {
//        var picker = DoImagePickerController
        print("showRight")
    }
    
    //  显示左边菜单栏
    func showMenu(sender: UIBarButtonItem) {
        let SW = self.view.frame.size.width
        let SH = self.view.frame.size.height - 2*60
        let scale = SH/UIScreen.mainScreen().bounds.size.height
        
        let WSpace = 200 - ((SW - SW*scale)/2)
        let HSpace = UIScreen.mainScreen().bounds.size.height*(1 - scale)*0.5 - 60
        
        let conver = UIButton()
        conver.frame = self.showNav.view.bounds
        conver.addTarget(self, action: "coverClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        UIView.animateWithDuration(0.75) { () -> Void in
            let transform = CGAffineTransformMakeScale(scale, scale)
            self.showNav.view.transform = CGAffineTransformTranslate(transform, WSpace/scale, -HSpace/scale)
            self.showNav.view.addSubview(conver)
        }
    }
    
    // 点击遮盖的方法
    func coverClick(cover: UIButton) {
        UIView.animateWithDuration(0.75, animations: { () -> Void in
            self.showNav.view.transform = CGAffineTransformIdentity
            }) { (finish) -> Void in
                // 移除遮盖
                cover.removeFromSuperview()
        }
    }

    // 代理实现方法
    func leftMenuClick(index: Int, toIndex: Int) {
        print("implements leftMenuClick")
        print("index: \(index)")
        let oldNav = self.childViewControllers[index] as! HMNavigationController
        // 移除旧的控制器的view
        oldNav.view.removeFromSuperview()
        let newNav = self.childViewControllers[toIndex] as! HMNavigationController
        // 设置新控制的trnasform跟旧控制器一样
        self.showNav = newNav
        newNav.view.transform = oldNav.view.transform
        // 设置阴影
        newNav.view.layer.shadowColor = UIColor.blackColor().CGColor
        newNav.view.layer.shadowOffset = CGSize(width: -3, height: 0)
        newNav.view.layer.shadowOpacity = 0.3
        self.view.addSubview(newNav.view)
        
        // 清空trnasform
        UIView.animateWithDuration(0.75) { () -> Void in
            self.showNav.view.transform = CGAffineTransformIdentity
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

