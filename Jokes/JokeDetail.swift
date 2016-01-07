//
//  JokeDetail.swift
//  Jokes
//
//  Created by 史征宇 on 15/12/11.
//  Copyright © 2015年 SKY. All rights reserved.
//

import UIKit

class JokeDetail: UIViewController {
    
    var jokeItem: JokeItems?

    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var images: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.images.sd_setImageWithURL(NSURL(string: jokeItem!.picUrl as String), placeholderImage: UIImage(named: "icon.jpg"))
        self.content.text = jokeItem?.jokeThumb as! String
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
