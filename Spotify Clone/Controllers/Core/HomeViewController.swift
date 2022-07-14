//
//  HomeViewController.swift
//  Spotify Clone
//
//  Created by Bogdan Sevcenco on 10.07.2022.
//

import UIKit
class HomeViewController: UIViewController {
  var albums = [NewReleasesResponse]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Browse"
        view.backgroundColor = .systemBackground
      navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettings))
      fetchData()
    }

  private func fetchData() {
    APICaller.shared.getRecommendations{ result in
//      switch result {
//      case .success(let model): break
//      case .failure(let error): break
//      }
    }
  }
  private func updateModel() {
    
  }
  @objc func didTapSettings() {
    let vc = SettingsViewController()
    vc.title = "Settings"
    navigationController?.pushViewController(vc, animated: true)
  }


}

