//
//  ProductService.swift
//  NS2
//
//  Created by Jaled Jara on 6/13/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol ProductServiceProtocol {
    func fetchProducts() async throws -> [Product]
}

struct ProductService: ProductServiceProtocol {
    func fetchProducts() async throws -> [Product] {
        let snapshot = try await Firestore.firestore().collection("products").getDocuments()
            
        return snapshot.documents.compactMap({ try? $0.data(as: Product.self) })
        
    }
}

struct MockProductService: ProductServiceProtocol {
    func fetchProducts() async throws -> [Product] {
        return DeveloperPreview.products
    }
    
    
}
