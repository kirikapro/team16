//
//  SceneDelegate.swift
//  FeedTheFridge
//
//  Created by Akiho Ando on 2026/03/03.
//


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)

        // ✅ テスト用：真っ赤な画面を表示
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        window.rootViewController = vc

        self.window = window
        window.makeKeyAndVisible()
    }
}
