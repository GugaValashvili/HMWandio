//
//  PlayersInfoViewController.swift
//  Wandio
//
//  Created by Guga Valashvili on 10/8/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import SDWebImage
import UIKit

class PlayersInfoViewController: UIViewController {
    var viewModel: PlayerInfoViewModel = .init()
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerPhoto: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.dislpay = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.willAppear()
    }
    
    func setUpUI(_ player: Player) {
        playerName.text = player.displayName
        let URLString = "\(player.displayavatar!)"
        playerPhoto.sd_setImage(with: URL(string: "\(URLString)"), placeholderImage: UIImage(named: "placeholder.png"))
    }
}

extension PlayersInfoViewController: PlayerInfoDisplay {
    func playerInfoViewModel(_ viewModel: PlayerInfoViewModel, didFail error: Error) {
        self.view.backgroundColor = .red
        self.playerName.text = error.localizedDescription
    }
    
    func playerInfoViewModel(_ viewModel: PlayerInfoViewModel, stratLoader: Bool) {
        stratLoader ? startActivityIndicator() : stopActivityIndicator()
    }
    
    func playerInfoViewModel(_ viewModel: PlayerInfoViewModel, didFetch player: Player) {
        setUpUI(player)
    }
}
