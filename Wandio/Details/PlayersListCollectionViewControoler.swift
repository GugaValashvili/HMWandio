//
//  PlayersListCollectionViewControoler.swift
//  Wandio
//
//  Created by Guga Valashvili on 9/29/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import UIKit



class PlayersListCollectionViewControoler: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var players: [Players] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    
    private var cellIdentifier: String = "PlayerItemCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "PlayerItemCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        
    }
    func goToPlayersInfo(id: String) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PlayerInfoViewController") as! PlayerInfoViewController
        vc.playerID = id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        players.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as? PlayerItemCell)?.setup(player: players[indexPath.row])
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let id = players[indexPath.row].account_id else {return}
        goToPlayersInfo(id: "\(id)")
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = players[indexPath.row]
        let width = item.displayName.width(withConstrainedHeight: 150, font: UIFont.systemFont(ofSize: 18))
        return CGSize(width: width + 30, height: 150)
    }
    
}

