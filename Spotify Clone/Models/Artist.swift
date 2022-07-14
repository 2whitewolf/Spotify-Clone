//
//  Artist.swift
//  Spotify Clone
//
//  Created by Bogdan Sevcenco on 10.07.2022.
//

import Foundation
struct Artist: Codable {
  let id: String
  let name: String
  let type: String
  let external_urls: [String:String]
}
