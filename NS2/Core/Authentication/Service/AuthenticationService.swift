//
//  AuthenticationService.swift
//  NS2
//
//  Created by Jaled Jara on 5/29/24.
//

import Foundation
import FirebaseAuth
import AuthenticationServices

class AuthenticationService {
    @Published var userSession: FirebaseAuth.User?
    
    private var userService = UserService()
    
    
    func updateUserSession() {
        self.userSession = Auth.auth().currentUser
    }
    
}

// MARK: SIGN IN EMAIL
extension AuthenticationService {
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let authDataResult = try await Auth.auth().createUser(
                withEmail: email,
                password: password
            )
            self.userSession = authDataResult.user
        } catch {
            throw PharmacyError.authenticationFailed
        }
    }
}

// MARK: SIGN IN GOOGLE
extension AuthenticationService {
    
    func signInWithGoogle(tokens: GoogleSignInModel) async throws {
        let credential = GoogleAuthProvider.credential(
            withIDToken: tokens.idToken,
            accessToken: tokens.accessToken
        )
        return try await signIn(credential: credential)
    }
    
    func signIn(credential: AuthCredential) async throws {
        let authDataResult = try await Auth.auth().signIn(with: credential)
        self.userSession = authDataResult.user
    }
    
    //    func getProvider() throws {
    //        guard let providerData = Auth.auth().currentUser?.providerData else {
    //            throw PharmacyError.networkError
    //        }
    //
    //        for provider in providerData {
    //            print(provider.providerID)
    //        }
    //    }
    
}

// MARK: SIGN IN APPLE

// MARK: UPLOAD USER
extension AuthenticationService {
    //FIREBASE NETWORK CALL
    func createUser(withEmail email: String, username: String, password: String) async throws {
        do {
            let authDataResult = try await Auth.auth().createUser(
                withEmail: email,
                password: password
            )
            self.userSession = authDataResult.user
            try await uploadUserData(
                id: authDataResult.user.uid,
                withEmail: email,
                username: username
            )
            
            print("\(authDataResult.user.uid)")
        } catch {
            throw PharmacyError.authenticationFailed
        }
    }
    
    //UPLOAD
    private func uploadUserData(id: String, withEmail email: String, username: String) async throws {
        let user = User(
            id: id,
            username: username,
            email: email
        )
        
        try await userService.uploadUserData(user)
    }
}

// MARK: SIGN OUT
extension AuthenticationService {
    
    func signOut() async throws {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
}

// MARK: DELETE ACCOUNT
extension AuthenticationService {
    func delete() async throws {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        
        try await currentUser.delete()
        self.userSession = nil
    }
}



















/*
 func loadData() async {
     guard let currentUser = Auth.auth().currentUser else {
         print("DEBUG: No current user session")
         return
     }

     do {
         let userData = try await UserService().fetchUserData(for: currentUser.uid)
         self.currentUserData = userData
         print("DEBUG: Loaded user data: \(userData)")
     } catch {
         print("DEBUG: Failed to load user data: \(error.localizedDescription)")
     }
 }

 */
