//
//  NewsViewController.swift
//  20151221
//
//  Created by SinObjectC on 15/12/22.
//  Copyright © 2015年 SinObjectC. All rights reserved.
//

import UIKit

class NewsViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    var tv: UITableView!
    var data: NSArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("dataSource", ofType: "plist")
        self.data = NSArray(contentsOfFile: path!)!
        
        self.tv = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.size.height-topHeight), style: UITableViewStyle.Plain)
        self.tv.registerClass(UITableViewCell.self, forCellReuseIdentifier: "sdfs")
        self.tv.delegate = self
        self.tv.dataSource = self
        self.view.addSubview(self.tv)
        let image = UIImageView(image: UIImage(named: "fight"))
        image.frame.size = CGSize(width: self.view.frame.width, height: 200)
        self.tv.tableHeaderView = image
        self.tv.tableFooterView = UIView()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
       let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
       let text = cell.textLabel?.text!
        let attributes4: NSDictionary = [NSFontAttributeName : (cell.textLabel?.font)!]
        let options4: NSStringDrawingOptions = [NSStringDrawingOptions.UsesLineFragmentOrigin, NSStringDrawingOptions.UsesFontLeading]
       let rect = text!.boundingRectWithSize(CGSizeMake(self.view.frame.size.width, CGFloat.max), options: options4, attributes: attributes4 as? [String : AnyObject], context: nil)
      return rect.size.height
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "sdfs"
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: identifier)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.systemFontOfSize(13)
        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        cell.textLabel?.text = self.data[indexPath.row] as? String
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
     NSLog("newsViewController")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
