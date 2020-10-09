//
//  PlayersListCollectionViewControoler.swift
//  Wandio
//
//  Created by Guga Valashvili on 9/29/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import UIKit

class PlayersListCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var viewModel: PlayersListCollectionViewModel = .init()
    
    private var cellIdentifier: String = "PlayerItemCell"
    
    private var layout: UICollectionViewFlowLayout? {
        collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.display = self
        setupCollection()
    }

    func setupCollection() {
        layout?.scrollDirection = .horizontal
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib(nibName: "PlayerItemCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        self.collectionView?.backgroundColor = .white
    }

    func goToPlayersInfo(id: String) {
        let vc = PlayersInfoViewController()
        vc.viewModel.playerID = id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.count()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let players = viewModel.player(at: indexPath.row) else { return }
        (cell as? PlayerItemCell)?.setup(player: players)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelect(at: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = viewModel.player(at: indexPath.row)
        let width = item?.displayName.width(withConstrainedHeight: 150, font: UIFont.systemFont(ofSize: 18)) ?? 0
        return CGSize(width: width + 30, height: 150)
    }
    
}

extension PlayersListCollectionViewController: PlayersListCollectionDisplay {
    func playersListCollectionViewModelReloadData(_ viewModel: PlayersListCollectionViewModel) {
        self.collectionView.reloadData()
    }
    
    func playersListCollectionViewModel(_ viewModel: PlayersListCollectionViewModel, open player: Int) {
        goToPlayersInfo(id: "\(player)")
    }
}
