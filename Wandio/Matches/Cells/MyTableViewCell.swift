//
//  MyTableViewCell.swift
//  Wandio
//
//  Created by Guga Valashvili on 9/27/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var MyTitleLabel: UILabel!
    func setup(text: String) {
        MyTitleLabel.text = text
    }
    
    
    
    
}
