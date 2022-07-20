//
//  AudioTrack.swift
//  Spotify Clone
//
//  Created by Bogdan Sevcenco on 10.07.2022.
//

import Foundation
struct AudioTrack: Codable {
  let album: Album
  let artists: [Artist]
  let available_markets: [String]
  let disc_number: Int
  let duration_ms: Int
  let explicit: Bool
  let external_urls: [String: String]
  let id: String
  let name: String
  let popularity: Int
}
