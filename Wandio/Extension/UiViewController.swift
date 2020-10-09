//
//  UiViewController.swift
//  Wandio
//
//  Created by Guga Valashvili on 9/29/20.
//  Copyright © 2020 Guga Valashvili. All rights reserved.
//

import UIKit
extension UIViewController {
    var activityIndicatorTag: Int { return 999999 }
}

extension UIViewController {
    
    func startActivityIndicator() {
        DispatchQueue.main.async {
            let bgView = UIView(frame: self.view.bounds)
            bgView.backgroundColor = self.view.backgroundColor
            bgView.tag = self.activityIndicatorTag
            let activityIndicator = UIActivityIndicatorView(style: .medium)
            activityIndicator.tag = self.activityIndicatorTag
            activityIndicator.center = bgView.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
            bgView.addSubview(activityIndicator)
            self.view.addSubview(bgView)
        }
    }
    
    func stopActivityIndicator() {
        DispatchQueue.main.async {
            if let bgView = self.view.subviews.first(where: {$0.tag == self.activityIndicatorTag}) {
                (bgView.subviews.first(where: {$0 is UIActivityIndicatorView}) as? UIActivityIndicatorView)?.stopAnimating()
                bgView.removeFromSuperview()
            }
        }
    }
}


extension UIViewController {
    
    func insertSubController(childVC: UIViewController, inView: UIView) {
        self.addChild(childVC)
        inView.addSubview(childVC.view)
        childVC.didMove(toParent: self)
        childVC.view.translatesAutoresizingMaskIntoConstraints = false
        childVC.view.topAnchor.constraint(equalTo: inView.topAnchor).isActive = true
        childVC.view.leftAnchor.constraint(equalTo: inView.leftAnchor).isActive = true
        childVC.view.rightAnchor.constraint(equalTo: inView.rightAnchor).isActive = true
        childVC.view.bottomAnchor.constraint(equalTo: inView.bottomAnchor).isActive = true
    }
}
