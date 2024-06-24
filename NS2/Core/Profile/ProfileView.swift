//
//  ProfileView.swift
//  NS2
//
//  Created by Jaled Jara on 6/5/24.
//

import SwiftUI

struct ProfileView: View {

    private let user: User
    
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
        NavigationStack {
            VStack {
                VStack {
                    Image(systemName: "pill.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .foregroundStyle(.orangeP)
                        .frame(width: 80, height: 80)
                    
                    Text(user.username)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .padding()
                
                List {
                    //tools
                    Section {
                        NavigationLink {
                            //
                        } label: {
                            Text("Favorites")
                        }
                        
                        NavigationLink {
                            //
                        } label: {
                            Text("Notifications")
                        }
                        
                        NavigationLink {
                            //
                        } label: {
                            Text("Settings")
                        }
                    }
                    
                    //destructive buttons
                    Section {
                        Button(action: {
                            Task {
                                try await authenticationService.signOut()
                            }
                        }, label: {
                            Text("Sign Out")
                                .foregroundStyle(.red)
                                .fontWeight(.semibold)
                        })
                        
                        Button(action: {
                            Task {
                                try await authenticationService.delete()
                            }
                        }, label: {
                            Text("Delete account")
                                .foregroundStyle(.red)
                                .fontWeight(.semibold)
                        })
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView (
        authenticationService: AuthenticationService(),
        productService: ProductService(),
        userService: UserService(),
        user: DeveloperPreview.user
    )
}
