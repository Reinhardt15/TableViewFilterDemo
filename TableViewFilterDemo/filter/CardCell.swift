//
//  CardCell.swift
//  TableViewFilterDemo
//
//  Created by Rienhardt on 2019/04/17.
//  Copyright © 2019 ReinhardEnero. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var accradLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var favorite = false {
        willSet {
            if newValue {
                favBtn.setImage(#imageLiteral(resourceName: "fav"), for: .normal)
                
            }
            else {
                favBtn.setImage(#imageLiteral(resourceName: "unfav"), for: .normal)
            }
        }
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
