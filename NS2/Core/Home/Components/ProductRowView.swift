//
//  ProductRowView.swift
//  NS2
//
//  Created by Jaled Jara on 6/10/24.
//

import SwiftUI

struct ProductRowView: View {
    let product: Product
    private let productService: ProductService
    @StateObject private var viewModel: ExploreProductsViewModel
    
    init(productService: ProductService, product: Product) {
        self.productService = productService
        self.product = product
        self._viewModel = StateObject(
            wrappedValue: ExploreProductsViewModel(
                productService: productService
            ))
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Image(product.image ?? "")
                .resizable()
                .scaledToFit()
                .frame (
                    width: 200,
                    height: 200,
                    alignment: .center
                )

            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                Text("$ \(String(format: "%.2f", product.price))")
                    .font(.headline)
                HStack {
                    Text("\(product.rating)")
                    Image(systemName: "star.fill")
                }
                .font(.subheadline)
            }
            .padding(.vertical)
            .fontWeight(.semibold)
            
        }
        .padding()
        .foregroundStyle(.black)
    }
}

#Preview {
    ProductRowView(
        productService: ProductService(),
        product: DeveloperPreview.products[0]
    )
}
