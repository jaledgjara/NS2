//
//  SearchableResultView.swift
//  NS2
//
//  Created by Jaled Jara on 6/12/24.
//

import SwiftUI

struct SearchableResultView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var viewModel: ExploreProductsViewModel
    private let productService: ProductService
    
    init(productService: ProductService) {
        self.productService = productService
        self._viewModel = StateObject(
            wrappedValue: ExploreProductsViewModel(
                productService: productService
            )
        )
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing: 10) {
                    //button dismiss
                    VStack {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "arrow.left")
                                .foregroundStyle(.black)
                                .imageScale(.large)
                                
                        })
                    }
                    
                    VStack {
                        HStack(spacing: 10) {
                            Image(systemName: "magnifyingglass")
                            TextField(
                                "Search...",
                                text: $viewModel.textSearch
                            )
                            Spacer()
                        }
                        .foregroundStyle(.black)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 80,
                               height: 50
                        )
                        .frame(alignment: .leading)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.orangeP, lineWidth: 1.0)
                        }
                        
                    }
                    
                }
                .padding(.horizontal)
                
                if viewModel.isSearching {
                    ForEach(viewModel.filteredProducts) { product in
                        NavigationLink {
                            ProductRowView(
                                productService: productService,
                                product: product
                            )
                        } label: {
                            SearchableResultRowView(product: product)
                        }
                    }
                    .foregroundStyle(.black)
                    .padding()
                }

                
                Spacer()
            }
            .padding()
        }
    }
}


#Preview {
    SearchableResultView(
        productService: ProductService()
    )
}

//extension SearchableResultView {
//    private func rowProduct(product: Product) -> some View {
//        VStack(alignment: .leading, spacing: 10) {
//            Text(product.name)
//            Text(product.category.rawValue)
//                .font(.headline)
//        }
//        .font(.title3)
//        .fontWeight(.semibold)
//    }
//}
