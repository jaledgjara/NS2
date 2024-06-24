//
//  CategoriesView.swift
//  NS2
//
//  Created by Jaled Jara on 6/12/24.
//

import SwiftUI

struct CategoriesView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: ExploreProductsViewModel
    
    private let productService: ProductService
    let categories: Categories
    
    init(
        productService: ProductService,
        categories: Categories
    ) {
        self.productService = productService
        self.categories = categories
        self._viewModel = StateObject(
            wrappedValue: ExploreProductsViewModel(
                productService: productService
            ))
    }
    
    var body: some View {
        ScrollView {
            
            VStack(spacing: 30) {
                
                //toolbar
                HStack(spacing: 20) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .imageScale(.large)
                            .foregroundStyle(.black)
                    })
                    
                    Text(categories.rawValue)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
                
                //search bar
                VStack {
                    HStack(spacing: 10) {
                        Image(systemName: "magnifyingglass")
                        TextField(
                            "Search...",
                            text: $viewModel.textSearch
                        )
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 50,
                           height: 50
                    )
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.orangeP, lineWidth: 1.0)
                    }
                }
                
                // Conditional content
                if viewModel.isSearching {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.filteredProducts) { product in
                            NavigationLink {
                                ProductDetailsView(
                                    product: product
                                )
                                .navigationBarBackButtonHidden()
                            } label: {
                                ProductRowView(
                                    productService: productService,
                                    product: product
                                )
                            }
                            .foregroundColor(.black)
                        }
                    }
                } else {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.productCategory(for: categories)) { product in
                            NavigationLink {
                                ProductDetailsView(
                                    product: product
                                )
                                .navigationBarBackButtonHidden()
                            } label: {
                                ProductRowView(
                                    productService: productService,
                                    product: product
                                )
                            }
                            .foregroundColor(.black)
                        }
                    }
                }
            }
        }
        .padding()
    }
}


extension CategoriesView {
    var columns: [GridItem] {
        return [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    }
}

#Preview {
    CategoriesView(
        productService: ProductService(),
        categories: .firstAid
    )
}
