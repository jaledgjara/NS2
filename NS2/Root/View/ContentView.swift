//
//  ContentView.swift
//  NS2
//
//  Created by Jaled Jara on 5/28/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: ContentViewViewModel
    
    // Dependency Injection
    private let authenticationService: AuthenticationService
    private let productService: ProductService
    private let userService: UserService
    
    init(authenticationService: AuthenticationService,
         productService: ProductService,
         userService: UserService
    ) {
        self.authenticationService = authenticationService
        self.productService = productService
        self.userService = userService
        
        // Initialize StateObject
        self._viewModel = StateObject(wrappedValue: ContentViewViewModel (
            authenticationService: authenticationService,
            userService: userService,
            productService: productService
        ))
    }
    
    var body: some View {
        
        Group {
            if viewModel.userSession != nil {
                if let user = viewModel.currentUser {
                    TabBarView(
                        authenticationService: authenticationService,
                        productService: productService,
                        userService: userService,
                        user: user
                    )
                }
            } else {
                SignInView(
                    authenticationService: authenticationService,
                    userService: userService
                )
            }
        }
    }
}

#Preview {
    ContentView(
        authenticationService: AuthenticationService(),
        productService: ProductService(),
        userService: UserService()
    )
}


