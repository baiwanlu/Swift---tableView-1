//
//  ViewController.swift
//  Swift - tableView单元格高度自适应1
//
//  Created by 道标朱 on 16/8/24.
//  Copyright © 2016年 道标朱. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var catalog = [[String]]()
    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //初始化列表数据
        catalog.append(["第一节:Swift 环境搭建","由于swift开发环境需要在OS X系统中运行，下面就一起来学习一下swift开发环境的搭建方法。"])
        catalog.append(["第二节:swift 基本语法","本节介绍swfit中一些常用的关键字。以及引入、注释等先关操作。"])
        catalog.append(["第三节:swift 数据类型","swift 提供了非常丰富的数据类型，比如：int。uint、浮点型、布尔值、字符串、字符等等。"])
        catalog.append(["第四节：swift变量","swift每个变量都指定了特定的类型。该类型决定了变量占用内存的大小。"])
        catalog.append(["第五节：swift可选（optionals）类型","swift的可选（optional）类型，用于处理值确实情况。"])
        
        //创建表视图
        self.tableView = UITableView(frame: self.view.frame, style: .Plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //创建一个重用的单元格
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "swiftCell")
        //设置estimatedRowHeight属性的默认值
        self.tableView.estimatedRowHeight = 44.0;
        //rowHeight属性设置为UITableViewAutomaticDimension
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        
        self.view.addSubview(self.tableView)
    }

   //在本列中，只有一个分区
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.catalog.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //为了提供表格显示性能，已创建完成的单元需要重复使用
        let identify:String = "swiftCell"
        //同一形式的单元格重复使用，在声明时已经注册
        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath) as UITableViewCell
        
        //获取对应的条目内容
        let entry = catalog[indexPath.row];
        //允许标签自动增长
        cell.textLabel?.numberOfLines = 0;
//        cell.textLabel?.text = "\(entry[0]): \(entry[1]))"
        cell.textLabel?.attributedText = getAttibutedString(title: entry[0], subtitle: entry[1])
        return cell
    }

    func getAttibutedString(title title:String,subtitle:String) ->NSAttributedString{
        //标题字体样式
        let titleFont = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        let titleColor = UIColor.greenColor()
        let titleAttibutes = [NSFontAttributeName:titleFont,NSForegroundColorAttributeName:titleColor]
        //简介字体样式
        let subtitleFont = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        let subtitleAttributes = [NSFontAttributeName:subtitleFont]
    
        //拼接并获取最终文本
        let titleString = NSMutableAttributedString(string: "\(title)\n",attributes: titleAttibutes)
        let subtitleString = NSAttributedString(string: subtitle,attributes: subtitleAttributes)
        titleString.appendAttributedString(subtitleString)
        
        return titleString
        
    }
}
