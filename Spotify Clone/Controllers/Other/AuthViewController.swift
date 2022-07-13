//
//  AuthViewController.swift
//  Spotify Clone
//
//  Created by Bogdan Sevcenco on 10.07.2022.
//

import Foundation
import WebKit
import UIKit
class AuthViewController: UIViewController, WKNavigationDelegate {
    
    private let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
         let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }()
    
    public var completionHandler: ((Bool) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign In"
        view.backgroundColor = .systemBackground
        webView.navigationDelegate = self
        view.addSubview(webView)
      guard let url = AuthManager.shared.signInURL else { return}
      webView.load(URLRequest(url: url))

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    guard let url = webView.url else {return}
    let component = URLComponents(string: url.absoluteString)
   guard  let code = component?.queryItems?.first(where: {$0.name == "code"})?.value else {
      return
    }
    webView.isHidden = true
    print("Code: \(code)")
    AuthManager.shared.exchangeCodeForToken(code: code) { [weak self] success in
      DispatchQueue.main.async {
        self?.navigationController?.popToRootViewController(animated: true)
        self?.completionHandler?(success)
      }


    }
  }
  //Exchange the code for accesss token

}