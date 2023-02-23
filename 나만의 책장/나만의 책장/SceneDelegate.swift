//
//  SceneDelegate.swift
//  나만의 책장
//
//  Created by 정재 on 2023/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        window?.rootViewController = MyBookcaseViewController()
        window?.makeKeyAndVisible()
    }
    

}

