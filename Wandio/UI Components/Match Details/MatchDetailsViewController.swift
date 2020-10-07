//
//  MatchDetailsViewController.swift
//  Wandio
//
//  Created by Guga Valashvili on 10/7/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import UIKit

class MatchDetailsViewController: UIViewController {

    var viewModel: MatchDetailsViewModel = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
}
