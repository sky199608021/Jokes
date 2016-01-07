//
//  MenuVC.swift
//  Jokes
//
//  Created by 史征宇 on 15/11/28.
//  Copyright © 2015年 SKY. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {
    
    @IBAction func backTapped (sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
