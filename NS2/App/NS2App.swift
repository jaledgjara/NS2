//
//  NS2App.swift
//  NS2
//
//  Created by Jaled Jara on 5/28/24.
//

import SwiftUI
import FirebaseCore

@main
struct NS2App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    private let authenticationService = AuthenticationService()
    private let productService = ProductService()
    private let userService = UserService()
    
    var body: some Scene {
        WindowGroup {
            ContentView (
                authenticationService: authenticationService,
                productService: productService,
                userService: userService
            )
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

