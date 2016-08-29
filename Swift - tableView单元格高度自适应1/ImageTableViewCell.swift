//
//  ImageTableViewCell.swift
//  Swift - tableView单元格高度自适应1
//
//  Created by 道标朱 on 16/8/29.
//  Copyright © 2016年 道标朱. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    //标题文本标签
    @IBOutlet weak var titleLabel: UILabel!
    
    //内容图片
    @IBOutlet weak var contentImageView: UIImageView!
    //内容图片的宽高比约束
    internal var aspectConstraint:NSLayoutConstraint?{
        didSet{
            if oldValue != nil {
                contentImageView.removeConstraint(oldValue!)
            }
            if aspectConstraint != nil {
                contentImageView.addConstraint(aspectConstraint!)
            }
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
    
    //加载内容图片（并设置高度约束）
    func loadImage(urlString:String){
        //定义NSURL对象
        let url = NSURL(string: urlString)
        //从网络获取数据流，再通过数据流初始化图片
        if let  data = NSData(contentsOfURL:url!), image = UIImage(data: data) {
            //计算原始图片的高度比
            let aspect = image.size.width/image.size.height
            //设置ImageView宽高比约束
            aspectConstraint = NSLayoutConstraint(item: contentImageView,attribute: .Width,relatedBy: .Equal,toItem: contentImageView,attribute: .Height,multiplier: aspect,constant: 0.0)
            //加载图片
            contentImageView.image = image;
            
        }else{
            //去除imageView里的图片和宽高比约束
            aspectConstraint = nil
            contentImageView.image = nil
        }
    }
    
}
