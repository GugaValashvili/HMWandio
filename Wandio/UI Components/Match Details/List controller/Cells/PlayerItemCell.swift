//
//  PlayerItemCell.swift
//  Wandio
//
//  Created by Guga Valashvili on 9/29/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import UIKit

class PlayerItemCell: UICollectionViewCell {
    
    @IBOutlet weak var MyTitleLabel: UILabel!

    func setup(player: Players) {
        MyTitleLabel.text = player.displayName
        MyTitleLabel.alpha = player.accountId == nil ? 0.6 : 1.0
    }
}
