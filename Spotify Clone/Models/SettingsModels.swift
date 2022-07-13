//
//  SettingsModels.swift
//  Spotify Clone
//
//  Created by Bogdan Sevcenco on 12.07.2022.
//

import Foundation
struct Section {
  let title: String
  let options: [Option]
}
struct Option {
  let title: String
  let handler: () -> Void
}
