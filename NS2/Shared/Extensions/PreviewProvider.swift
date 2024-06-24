//
//  PreviewProvider.swift
//  NS2
//
//  Created by Jaled Jara on 6/13/24.
//

import Foundation

struct DeveloperPreview {
    
    static var user : User = User(
        id: UUID().uuidString,
        username: "Valentina Rodriguez",
        email: "valentinagattas@gmail.com",
        address: "Olascoaga 2555",
        phoneNumber: "+ 54 9 261 579 4988"
    )
    
    static var products : [Product] = [
        Product(
            id: UUID().uuidString,
            name: "Band-Aid Brand Adhesive Bandages",
            description: "Flexible fabric bandages for minor cuts and scrapes.",
            price: 4.99,
            category: .firstAid,
            rating: 4
        ),

        Product(
            id: UUID().uuidString,
            name: "ACE Elastic Bandage",
            description: "Elastic bandage for supporting and compressing injuries.",
            price: 6.99,
            category: .firstAid,
            rating: 5
        ),

        Product(
            id: UUID().uuidString,
            name: "Dumbbell Set",
            description: "Set of adjustable dumbbells for strength training.",
            price: 49.99,
            category: .fitness,
            rating: 4
        ),

        Product(
            id: UUID().uuidString,
            name: "Yoga Mat",
            description: "Non-slip yoga mat for fitness and exercise.",
            price: 19.99,
            category: .fitness,
            rating: 5
        ),

        Product(
            id: UUID().uuidString,
            name: "Chanel No. 5 Eau de Parfum",
            description: "Iconic floral fragrance for women.",
            price: 99.99,
            category: .perfumery,
            rating: 5
        ),

        Product(
            id: UUID().uuidString,
            name: "Dior Sauvage Eau de Toilette",
            description: "Fresh and spicy fragrance for men.",
            price: 89.99,
            category: .perfumery,
            rating: 5
        ),

        Product(
            id: UUID().uuidString,
            name: "Always Ultra Thin Pads",
            description: "Menstrual pads with wings for extra protection.",
            price: 8.99,
            category: .womansHealth,
            rating: 4
        ),

        Product(
            id: UUID().uuidString,
            name: "One A Day Men's Multivitamin",
            description: "Daily multivitamin to support men's health.",
            price: 12.99,
            category: .mensHealth,
            rating: 4
        ),

        Product(
            id: UUID().uuidString,
            name: "Bath Bomb Gift Set",
            description: "Set of aromatic bath bombs for a relaxing experience.",
            price: 24.99,
            category: .gifts,
            rating: 5
        ),

        Product(
            id: UUID().uuidString,
            name: "CeraVe Moisturizing Cream",
            description: "Rich, hydrating cream for all skin types.",
            price: 15.99,
            category: .creams,
            rating: 5
        ),

        
    
    ]
        
  
}
