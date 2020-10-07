//
//  HomeViewController.swift
//  Wandio
//
//  Created by Guga Valashvili on 10/7/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let viewModel: HomeViewModel = .init()

    @IBOutlet weak var gif: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.dislpay = self
        self.navigationItem.title = "Dotta"
    }
}

extension HomeViewController: HomeDisplay {
    func homeViewModelOpen(_ viewModel: HomeViewModel, match id: String) {
        let vc = MatchDetailsViewController()
        vc.viewModel.matchId = id
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelect(at: indexPath.row)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.matchIds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = viewModel.title(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Match ID"
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        "End"
    }
}
