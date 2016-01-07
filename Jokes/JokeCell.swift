//
//  JokeCell.swift
//  Jokes
//
//  Created by 史征宇 on 15/12/11.
//  Copyright © 2015年 SKY. All rights reserved.
//

import UIKit

class JokeCell: UITableViewCell {
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var nameV: UILabel!
    @IBOutlet weak var contV: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
