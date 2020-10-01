//
//  MatchesViewController.swift
//  Wandio
//
//  Created by Guga Valashvili on 9/27/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import UIKit
import SDWebImage

class MatchesViewController: UIViewController {
    
    @IBOutlet weak var gif: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    let matchIds = ["5635403622","5635427390","5635390089","5635403069","5635381216"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        gif.loadGif(name: "GIF")
    }
    func goDedailsPage(id: String) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.matchId = id
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MatchesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goDedailsPage(id: matchIds[indexPath.row])
    }
}
extension MatchesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        matchIds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? MyTableViewCell)?.setup(text: matchIds[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Match ID"
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        "End"
    }
}


