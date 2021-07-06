//
//  SceneDelegate.swift
//  UIKitHomeworks
//
//  Created by Vlad on 21.06.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        window?.windowScene = windowScene
        window?.makeKeyAndVisible()

        let viewController = TextEditorController()
        let tabBarController = UITabBarController()
        let navigationController = UINavigationController(rootViewController: viewController)

        tabBarController.viewControllers = [navigationController]
        window?.rootViewController = tabBarController
    }
}

