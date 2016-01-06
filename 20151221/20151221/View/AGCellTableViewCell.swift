//
//  AGCellTableViewCell.swift
//  20151221
//
//  Created by SinObjectC on 16/1/6.
//  Copyright © 2016年 SinObjectC. All rights reserved.
//

import UIKit

class AGCellTableViewCell: UITableViewCell {
    var model: AGModel? {
        didSet {
            if let iconName = model?.iconName {
                iconView.image = UIImage(named: iconName)
            }
            
            if let title = model?.title {
                titleLabel.text = title
            }
            
            if let desc = model?.desc {
                descLabel.text = desc
            }
            
            // 重新布局，会更新frame
            setNeedsLayout()
        }
    }
    
    // MARK: - 懒加载
    /// 商品图片
    private lazy var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.layer.cornerRadius = 30
        iconView.layer.masksToBounds = true
        return iconView
    }()
    
    /// 商品标题
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.orangeColor()
        titleLabel.font = UIFont.systemFontOfSize(15)
        return titleLabel
    }()
    
    /// 商品描述
    private lazy var descLabel: UILabel = {
        let descLabel = UILabel()
        descLabel.numberOfLines = 0
        descLabel.textColor = UIColor.blackColor()
        descLabel.font = UIFont.systemFontOfSize(13)
        descLabel.textColor = UIColor.grayColor()
        return descLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 准备UI
        prepareUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     准备UI
     */
    func prepareUI() {
        // 添加子控件
        contentView.addSubview(iconView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descLabel)
        
        // 约束子控件
        iconView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(10)
            make.left.equalTo(12)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        
        titleLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(30)
            make.left.equalTo(iconView.snp_right).offset(25)
        }
        
        descLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(iconView.snp_left)
            make.top.equalTo(iconView.snp_bottom).offset(10)
            make.right.equalTo(contentView.snp_right).offset(-10)
            make.bottom.equalTo(contentView.snp_bottom).offset(10)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
