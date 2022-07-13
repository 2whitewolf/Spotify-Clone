//
//  HomeViewController.swift
//  Spotify Clone
//
//  Created by Bogdan Sevcenco on 10.07.2022.
//

import UIKit
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .systemBackground
      navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettings))
        // Do any additional setup after loading the view.
    }
  @objc func didTapSettings() {
    let vc = SettingsViewController()
    vc.title = "Settings"
    navigationController?.pushViewController(vc, animated: true)
  }


}
