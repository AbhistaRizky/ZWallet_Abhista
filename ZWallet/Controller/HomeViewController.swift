//
//  HomeViewController.swift
//  ZWallet
//
//  Created by laptop MCO on 15/08/23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
extension UIViewController {
    func showHomeViewController() {
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "tabbar")
        navigationController?.pushViewController(viewController, animated: true)
    }
}
