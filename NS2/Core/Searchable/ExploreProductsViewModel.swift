//
//  ExploreProductsViewModel.swift
//  NS2
//
//  Created by Jaled Jara on 6/13/24.
//

import Foundation
import Combine

@MainActor class ExploreProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var filteredProducts: [Product] = []
    @Published var textSearch: String = ""
//    @Published var selectedCategory: Categories? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    var isSearching: Bool {
        !textSearch.isEmpty
    }
    
    private let productService: ProductService
    
    init(productService: ProductService) {
        self.productService = productService
        fetchProducts()
        addSubscribersSearchable()
    }
    
    func fetchProducts()  {
        self.products = DeveloperPreview.products
    }
    
    func addSubscribersSearchable() {
        $textSearch
            .debounce(
                for: 0.3,
                scheduler: DispatchQueue.main
            )
            .sink { [weak self] textSearch in
                self?.filterProducts(textSearch: textSearch)
            }
            .store(in: &cancellables)
    }
    
    func filterProducts(textSearch: String) {
        
        guard !textSearch.isEmpty else {
            filteredProducts = []
            return
        }
        
        let search = textSearch.lowercased()
        filteredProducts = products.filter({ product in
            let titleContainsSearch = product.name.lowercased().contains(search)
            let categoryContainsSearch = product.category.rawValue.lowercased().contains(textSearch)
            
            return titleContainsSearch || categoryContainsSearch
        })
        
    }
    
    
//    func filterProductsByCategory(textSearch: String, category: Categories?) {
//        
//        guard !textSearch.isEmpty || category != nil else {
//            filteredProducts = []
//            return
//        }
//        
//        let search = textSearch.lowercased()
//        filteredProducts = products.filter({ product in
//            let titleContainsSearch = product.name.lowercased().contains(search)
//            let categoryContainsSearch = product.category.rawValue.lowercased().contains(textSearch)
//            let matchesCategory = category == nil || product.category == category
//            
//            return (titleContainsSearch || categoryContainsSearch) && matchesCategory
//        })
//        
//    }
        
    func productCategory(for category: Categories) -> [Product] {
        return products.filter { $0.category == category }
    }

}
