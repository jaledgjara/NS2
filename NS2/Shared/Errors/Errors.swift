//
//  Errors.swift
//  NS2
//
//  Created by Jaled Jara on 6/4/24.
//

import Foundation

enum PharmacyError: Error {
    // Authentication errors
    case authenticationFailed
    case authorizationFailed
    case tokenExpired
    case networkError

    // User errors
    case userNotFound
    case invalidUserID
    case insufficientPermissions

    // Product errors
    case productNotFound
    case invalidProductID
    case productOutOfStock
    case productExpired

    var errorMessage: String {
        switch self {
        case .authenticationFailed:
            return "Authentication failed. Please check your credentials."
        case .authorizationFailed:
            return "Authorization failed. You do not have permission to access this resource."
        case .tokenExpired:
            return "Token has expired. Please log in again."
        case .networkError:
            return "Network error. Please check your internet connection."
            
        case .userNotFound:
            return "User not found. Please check the user ID."
        case .invalidUserID:
            return "Invalid user ID. Please provide a valid ID."
        case .insufficientPermissions:
            return "Insufficient permissions. You do not have the required permissions to perform this action."
            
        case .productNotFound:
            return "Product not found. Please check the product ID."
        case .invalidProductID:
            return "Invalid product ID. Please provide a valid ID."
        case .productOutOfStock:
            return "Product is out of stock. Please try again later."
        case .productExpired:
            return "Product has expired. Please check the expiration date."
        }
    }
}
