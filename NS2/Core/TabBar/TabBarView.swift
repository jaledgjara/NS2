//
//  TabBarView.swift
//  NS2
//
//  Created by Jaled Jara on 5/28/24.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selection: Int = 0
    
    private let user: User
    
    // Dependency Injection
    private let authenticationService: AuthenticationService
    private let productService: ProductService
    private let userService: UserService
    
    init(authenticationService: AuthenticationService,
         productService: ProductService,
         userService: UserService,
         user: User
    ) {
        self.authenticationService = authenticationService
        self.productService = productService
        self.userService = userService
        self.user = user
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView(
                authenticationService: authenticationService,
                userService: userService,
                productService: productService,
                user: user
            )
            .tabItem {
                Image(systemName: TabBarItem.home.image)
                Text(TabBarItem.home.title)
            }
            .tag(TabBarItem.home.rawValue)
            
            
            PaymentView()
            .tabItem {
                Image(systemName: TabBarItem.payment.image)
                Text(TabBarItem.payment.title)
            }
            .tag(TabBarItem.payment.rawValue)
            
            ProfileView(
                authenticationService: authenticationService,
                productService: productService,
                userService: userService,
                user: user
            )
            .tabItem {
                Image(systemName: TabBarItem.profile.image)
                Text(TabBarItem.profile.title)
            }
            .tag(TabBarItem.profile.rawValue)
        }
    }
}

extension TabBarView {
    enum TabBarItem: Int, CaseIterable {
        case home
        case payment
        case profile

        var title: String {
            switch self {
            case .home: return "Home"
            case .payment: return "Payment"
            case .profile: return "Profile"
            }
        }

        var image: String {
            switch self {
            case .home: return "house.fill"
            case .payment: return "creditcard.fill"
            case .profile: return "person.fill"
            }
        }
    }
}


#Preview {
    TabBarView(
        authenticationService: AuthenticationService(),
        productService: ProductService(),
        userService: UserService(),
        user: DeveloperPreview.user
    )
}
