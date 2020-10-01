//
//  PlayerInfoViewController.swift
//  Wandio
//
//  Created by Guga Valashvili on 9/30/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import UIKit
import SDWebImage

class PlayerInfoViewController: UIViewController {
    var playerID: String?
    @IBOutlet weak var playerLabelName: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    private var network: FetchPlayerInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.network = FetchPlayerInfo(id: playerID ?? "")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetch()
    }
    
    private func fetch() {
        self.startActivityIndicator()
        network?.fetch { [weak self] item in
            guard let item = item else { return }
            self?.setUpUI(item)
            self?.stopActivityIndicator()
        }
    }
    
    
    func setUpUI(_ player: Player) {
        playerLabelName.text = player.displayName
        let URLString = "\(player.displayavatar!)"
        playerImage.sd_setImage(with: URL(string: "\(URLString)"), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
}
