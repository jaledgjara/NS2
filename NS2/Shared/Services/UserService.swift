//
//  UserService.swift
//  NS2
//
//  Created by Jaled Jara on 6/4/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol UserServiceProtocol {
    
    func uploadUserData(_ user: User) async throws
    
    func fetchCurrentUserData() async throws -> User?
}

struct UserService: UserServiceProtocol {
    func uploadUserData(_ user: User) async throws {
        do {
            let userData = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(userData)
        } catch {
            throw PharmacyError.networkError
        }
    }
    
    func fetchCurrentUserData() async throws -> User? {
        guard let currentUid = Auth.auth().currentUser?.uid else { return nil }
        return try await Firestore.firestore().collection("users").document(currentUid).getDocument(as: User.self)
    }
}
