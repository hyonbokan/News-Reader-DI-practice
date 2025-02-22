//
//  SceneDelegate.swift
//  NewsReader
//
//  Created by Michael Kan on 2/19/25.
//

import UIKit
import NewsKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let newsService = NewsService()
        let viewModel = NewsViewModel(newsService: newsService)
        let vc = NewsViewController(viewModel: viewModel)
        
        let navVC = UINavigationController(rootViewController: vc)
        
        window.rootViewController = navVC
        window.makeKeyAndVisible()
        self.window = window
        
    }
    
}
