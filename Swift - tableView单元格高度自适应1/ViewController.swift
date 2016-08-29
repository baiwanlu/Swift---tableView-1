import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var catalog = [[String]]()
    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化列表数据
        catalog.append(["iPhone 6的故障率达26% 稳超安卓", "http://cms-bucket.nosdn.127.net/942e01f7916a4ab7a6a25ee73fe04e8f20160828105244.png?imageView&thumbnail=550x0"])
        catalog.append(["不用导航 这款无人机能够“自制”地图飞行", "http://cms-bucket.nosdn.127.net/fa1464d2882a4421bee141b609cdd0bc20160828082327.png?imageView&thumbnail=550x0"])
        catalog.append(["无人汽车如何应对道德困境？谷歌表示不知道", "http://cms-bucket.nosdn.127.net/b79d209b86d547b2b7afb1b1d98f604120160828104227.jpeg?imageView&thumbnail=550x0"])
        
        //创建表视图
        self.tableView = UITableView(frame: self.view.frame, style: .Plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //创建一个重用的单元格
        self.tableView!.registerNib(UINib(nibName:"ImageTableViewCell", bundle:nil),
                                    forCellReuseIdentifier:"myCell")
        
        //设置estimatedRowHeight属性默认值
        self.tableView.estimatedRowHeight = 44.0;
        //rowHeight属性设置为UITableViewAutomaticDimension
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        
        self.view.addSubview(self.tableView!)
    }
    
    
    //在本例中，只有一个分区
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.catalog.count
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            //同一形式的单元格重复使用
            let cell = tableView.dequeueReusableCellWithIdentifier("myCell",
                                                                   forIndexPath: indexPath) as! ImageTableViewCell
            //获取对应的条目内容
            let entry = catalog[indexPath.row]
            //单元格标题和内容设置
            cell.titleLabel.text = entry[0]
            cell.loadImage(entry[1])
            
            return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}