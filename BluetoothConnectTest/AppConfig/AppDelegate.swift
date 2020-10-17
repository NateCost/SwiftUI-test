//
//  AppDelegate.swift
//  BluetoothConnectTest
//
//  Created by Ilya Sakalou on 10/15/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    
    if let window = window {
      let splash = SplashVC()
      
      window.rootViewController = splash
      window.makeKeyAndVisible()
      window.backgroundColor = .white
    }
    
    return true
  }
}
