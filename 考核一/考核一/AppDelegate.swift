//
//  AppDelegate.swift
//  考核一
//
//  Created by GC on 2021/7/16.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool { // 程序被加载到内存
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//
//        self.window!.backgroundColor = UIColor.white
//
//        let nav = UINavigationController(rootViewController: ViewController())
//
//        self.window!.rootViewController = nav
//
//        self.window!.makeKeyAndVisible()
        print("AnydidFinishLaunchingWithOptions")
        // Override point for customization after application launch.
//        当你的应用程序刚刚启动，func application(_ :didFinishLaunchingWithOptions:) -> Bool 被调用。此方法用于执行应用程序设置。在ios12或更早的版本中，你可能已经使用这个方法来创建和配置一个UIWindow对象，并将一个UIViewController实例分配给window以使它出现。
//
//        如果你的应用程序正在使用scene，你的AppDelegate将不再负责这一操作。由于应用程序现在可以有多个窗口，或者uiscenes处于active状态，因此在AppDelegate中管理单个window对象没有多大意义。
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        //当你的app被期望提供一个新的scene或window供iOS显示时，就会调用func application(_ :configurationForConnecting:options:) -> UISceneConfiguration。注意，当你的应用程序启动时，这个方法不会被调用，它只会被调和创建用来获取新的场景。 目前还没有进行过多窗口的开发，后续再深入研究...
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        print("configurationForConnecting")
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        每当用户丢弃一个scene时，就会调用此方法，例如在多任务窗口中将该场景滑走
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        print("didDiscardSceneSessions")
    }


}

