//
//  NewsViewController.swift
//  20151221
//
//  Created by SinObjectC on 15/12/22.
//  Copyright © 2015年 SinObjectC. All rights reserved.
//

import UIKit
import SnapKit

class NewsViewController: BaseViewController {
    
    /// 数据源
    private var ModelArray = [AGModel]()
    
    /// cell的重用标识符
    private let listCellIdentifier = "listCell"
    
    lazy var tv: UITableView = {
        let table = UITableView()
        // 指定数据源和代理
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    lazy var image: UIImageView = {
        let img = UIImageView(image: UIImage(named: "fight"))
        return img
    }()
    
    lazy var arrays: NSArray = {
        let path = NSBundle.mainBundle().pathForResource("dataSource", ofType: "plist")
        let array = NSArray(contentsOfFile: path!)
        return array!
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<10 {
            var dict = [String: AnyObject]()
            dict["iconName"] = "goodicon_\(i)"
            dict["title"] = "Mr.\(i + 1)洛洛"
            dict["desc"] = arrays[i] as! String
            
            // 字典转模型并将模型添加到模型数组中
            ModelArray.append(AGModel(dict: dict))
        }
        
        // 准备UI
        prepareUI()
    }
    
    func prepareUI() {
        image.frame.size.width = view.frame.size.width
        image.frame.size.height = 250
        tv.tableHeaderView = image
        tv.tableFooterView = UIView()
        view.addSubview(tv)
        
        // 注册Cell
        tv.registerClass(AGCellTableViewCell.self, forCellReuseIdentifier: listCellIdentifier)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        // 提示：这个方法是在控制器view已经显示后调用，我们可以在这个方法里面做一些子控件约束操作等
        // 约束子控件
        layoutUI()
    }
    
    /**
     约束子控件的方法:使用第三方控件Snapkit
     */
    func layoutUI() {
    
        tv.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(view.snp_edges)
        }
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
    
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrays.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let text: NSString = arrays[indexPath.row] as! NSString
        let attributes4: NSDictionary = [NSFontAttributeName: UIFont.systemFontOfSize(13), NSForegroundColorAttributeName: UIColor.orangeColor()]
        let options4: NSStringDrawingOptions = [NSStringDrawingOptions.UsesLineFragmentOrigin, NSStringDrawingOptions.UsesFontLeading]
        let rect = text.boundingRectWithSize(CGSizeMake(self.view.frame.size.width, CGFloat.max), options: options4, attributes: attributes4 as? [String : AnyObject], context: nil)
      return rect.size.height + 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(listCellIdentifier, forIndexPath: indexPath) as! AGCellTableViewCell
        
        // 取消选中效果
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        // 为cell传递数据
        cell.model = ModelArray[indexPath.row]
        
        // 返回创建好的cell
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
    }
}

