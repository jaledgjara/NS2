//
//  HomeView.swift
//  NS2
//
//  Created by Jaled Jara on 6/5/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: ExploreProductsViewModel
    
    private let authenticationService: AuthenticationService
    private let userService: UserService
    private let productService: ProductService
    private let user: User
    
    init(authenticationService: AuthenticationService,
         userService: UserService,
         productService: ProductService,
         user: User) {
        self.authenticationService = authenticationService
        self.userService = userService
        self.productService = productService
        self.user = user
        
        self._viewModel = StateObject(wrappedValue: ExploreProductsViewModel(
            productService: productService
        ))
    }
    
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 30) {
                    
                    //Toolbar
                    HStack {
                        HStack(spacing: 17) {
                            Image(systemName: "pill.fill")
                                .resizable()
                                .scaledToFill()
                                .frame (
                                    width: 30,
                                    height: 30,
                                    alignment: .center
                                )
                                .foregroundStyle(.black)
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Welcome,")
                                    .font(.headline)
                                    .fontWeight(.light)
                                Text(user.username)
                                    .font(.headline)
                                    .fontWeight(.bold)
                            }
                        }
                        
                        Spacer()
                        
                        VStack {
                            NavigationLink {
                                PaymentView()
                            } label: {
                                PaymentImageView()
                                    .foregroundStyle(.black)
                            }

                        }
                    }
                    
                    //search bar
                    VStack {
                        NavigationLink {
                            SearchableResultView(
                                productService: productService
                            )
                                .navigationBarBackButtonHidden()
                        } label: {
                            HStack(spacing: 10) {
                                Image(systemName: "magnifyingglass")
                                Text("Search...")
                                Spacer()
                            }
                            .foregroundStyle(.black)
                            .padding()
                            .frame(width: UIScreen.main.bounds.width - 50,
                                   height: 50
                            )
                            .frame(alignment: .leading)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.orangeP, lineWidth: 1.0)
                            }
                        }
                    }
                    
                    
                    //Category
                    ScrollView(.horizontal, showsIndicators: false) {
            
                        VStack(alignment: .leading) {
                            Text("All categories")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .underline()
                            
                            HStack {
                                ForEach(Categories.allCases, id: \.self) { category in
                                    NavigationLink {
                                        CategoriesView(
                                            productService: productService,
                                            categories: category
                                        )
                                            .navigationBarBackButtonHidden()
                                    } label: {
                                        CategoryRowView(
                                            image: category.image,
                                            title: category.rawValue
                                        )
                                        .padding()
                                    }
                                    
                                }
                            }
                        }
                    }
                    
                    //Adds
                    VStack {
                        AdvertisementsView()
                            .frame(
                                width: UIScreen.main.bounds.width - 50,
                                height: 200
                            )
                    }
                    
                    //Products discounts
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading) {
                            Text("Our best products")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .underline()
                            LazyVGrid(columns: columns) {
                                ForEach(viewModel.products) { product in
                                    NavigationLink {
                                        ProductDetailsView(product: product)
                                            .navigationBarBackButtonHidden()
                                    } label: {
                                        ProductRowView(
                                            productService: productService,
                                            product: product
                                        )
                                    }
                                }
                            }
                        }
                    }
                    
                }
            }
            .padding()
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}


extension HomeView {
    var columns: [GridItem] {
        return [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    }
}



#Preview {
    HomeView(
        authenticationService: AuthenticationService(),
        userService: UserService(),
        productService: ProductService(),
        user: DeveloperPreview.user
    )
}


