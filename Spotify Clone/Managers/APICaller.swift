//
//  APICaller.swift
//  Spotify Clone
//
//  Created by Bogdan Sevcenco on 10.07.2022.
//

import Foundation
final class APICaller{

  static let shared = APICaller()

  private init() {}

  struct Constants {
    static let baseApiURL = "https://api.spotify.com/v1"
  }

  enum APIError: Error {
    case failedToGetData
  }

  public func getCurrentUserProfile(completion: @escaping (Result<UserProfile,Error>) -> Void){
    createRequest(with: URL(string: Constants.baseApiURL + "/me"), type: .GET) { baseRequest in
      let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
        guard let data = data, error == nil else {
          completion(.failure(APIError.failedToGetData))
          return
        }

        do {
          let result =  try JSONDecoder().decode(UserProfile.self, from: data)
//          print(result)
          completion(.success(result))
        }
        catch {
          completion(.failure(error))
        }
      }
      task.resume()

    }
  }
  public func getRecommendations(completion: @escaping ((Result<String,Error>)) -> Void) {
    createRequest(with: URL(string: Constants.baseApiURL + "/recommendations"), type: .GET){ request in
      let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
          completion(.failure(APIError.failedToGetData))
return
        }
        do {
          let result = try JSONSerialization.jsonObject(with: data,options: .fragmentsAllowed)
          print(result)
//        completion(.success(result))
        } catch {

          completion(.failure(error))
        }
      }
      task.resume()
    }

  }

  public func getFeaturedPlaylists(completion: @escaping ((Result<FeaturedPlaylistsResponse,Error>)) -> Void) {
    createRequest(with: URL(string: Constants.baseApiURL + "/browse/featured-playlists?limit=5"), type: .GET){ request in
      let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
          completion(.failure(APIError.failedToGetData))
return
        }
        do {
          let result = try JSONDecoder().decode(FeaturedPlaylistsResponse.self, from: data)
        completion(.success(result))
        } catch {

          completion(.failure(error))
        }
      }
      task.resume()
    }
  }

  public func getNewReleases(completion: @escaping ((Result<NewReleasesResponse,Error>)) -> Void) {
    createRequest(with: URL(string: Constants.baseApiURL + "/browse/new-releases?limit=50"), type: .GET){ request in
      let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
          completion(.failure(APIError.failedToGetData))
return
        }
        do {
          let result = try JSONDecoder().decode(NewReleasesResponse.self, from: data)
        completion(.success(result))
        } catch {
          completion(.failure(error))
        }
      }
      task.resume()
    }
  }

  enum HTTPMethod: String {
    case GET
    case POST
  }
// MARK: -Private
   private func createRequest(with url: URL?,type: HTTPMethod,  completion: @escaping (URLRequest) -> Void){

    AuthManager.shared.withValidToken{ token in
      guard let apiURL = url else { return }
      var request = URLRequest(url: apiURL)
      request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
      request.httpMethod = type.rawValue
      request.timeoutInterval = 30
      completion(request)
    }


  }
}
