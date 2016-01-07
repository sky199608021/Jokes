//
//  ViewController.swift
//  Jokes
//
//  Created by 史征宇 on 15/11/28.
//  Copyright © 2015年 SKY. All rights reserved.
//

import UIKit


var currentJokesDataSource: [JokeItems] = []

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = AFHTTPRequestOperationManager()
        let url = "http://api.1-blog.com/biz/bizserver/xiaohua/list.do"
        SVProgressHUD.showWithStatus("正在加载数据...")
        
        manager.GET(url, parameters: nil,
            success: {
                (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                //            print("JSON:" + responseObject.description!)
//                let json = JSON(responseObject)
//                
                SVProgressHUD.dismiss()
                self.processData(responseObject as! NSDictionary)
            },
            
            failure: { (operation:
                AFHTTPRequestOperation?,
                error: NSError) in
                SVProgressHUD.dismiss()
                SVProgressHUD.showErrorWithStatus("获取失败")
                print("Error: " + error.localizedDescription)
                
        })
        
        
        
    }
    
    
    func processData (jsonResult:NSDictionary) {
        let jokeDataSource = jsonResult["detail"] as! NSArray
        
        for currentJokes : AnyObject in jokeDataSource {
            let jokeItem = JokeItems()
            jokeItem.jokeTitle = currentJokes["author"] as! NSString
            jokeItem.jokeID = currentJokes["id"] as! NSInteger
            jokeItem.jokeThumb = currentJokes["content"] as! NSString
            jokeItem.picUrl = currentJokes["picUrl"] as! NSString
            currentJokesDataSource.append(jokeItem)
            print(jokeItem.jokeTitle)
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentJokesDataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! JokeCell
        let jokeItem: JokeItems = currentJokesDataSource[indexPath.row]
        let title = cell.nameV
        let content = cell.contV
        let image = cell.imageV
        title.text = jokeItem.jokeTitle as String
        content.text = jokeItem.jokeThumb as String
        image.sd_setImageWithURL(NSURL(string: jokeItem.picUrl as String), placeholderImage: UIImage(named: "icon.png"))
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 95
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segue" {
            let vc = segue.destinationViewController as! JokeDetail
            let indexPath = tableView.indexPathForSelectedRow
            
            if let index = indexPath {
                vc.jokeItem = currentJokesDataSource[index.row]
            }
        }
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let NavC = self.view.window?.rootViewController?.navigationController
//        let sb = UIStoryboard(name: "", bundle: NSBundle.mainBundle())
//        let VC = sb.instantiateViewControllerWithIdentifier()
//        NavC?.pushViewController(, animated: )
//    }
}



