//
//  AuthResponse.swift
//  Spotify Clone
//
//  Created by Bogdan Sevcenco on 11.07.2022.
//

import Foundation
class AuthResponse: Codable {
  let access_token: String
  let expires_in: Int
  let refresh_token: String?
  let scope: String
  let token_type: String
}

