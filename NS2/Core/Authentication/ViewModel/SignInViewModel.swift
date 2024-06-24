//
//  SignInViewModel.swift
//  NS2
//
//  Created by Jaled Jara on 5/30/24.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth
import CryptoKit
import AuthenticationServices

@MainActor
class SignInViewModel: NSObject, ObservableObject, ASAuthorizationControllerDelegate {
    
    @Published var textEmail = ""
    @Published var textPassword = ""
    
    //Apple Authentication var
    private var currentNonce: String?
    
    private let authenticationService: AuthenticationService
    private let userService: UserService
    
    init(authenticationService: AuthenticationService, userService: UserService) {
        self.authenticationService = authenticationService
        self.userService = userService
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            try await authenticationService.signIn(withEmail: email, password: password)
        } catch {
            throw PharmacyError.authenticationFailed
        }
    }
    
}


// MARK: GOOGLE SIGN IN
extension SignInViewModel {
    func signInWithGoogle() async throws {
        guard let topViewC = Utilities.shared.topViewController() else {
            throw PharmacyError.authenticationFailed
        }
        
        let googleResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topViewC)
        
        guard let idToken = googleResult.user.idToken?.tokenString else {
            throw PharmacyError.invalidUserID
        }
        let accessToken = googleResult.user.accessToken.tokenString
        
        _ = GoogleAuthProvider.credential(
            withIDToken: idToken,
            accessToken: accessToken
        )
        
        let tokens = GoogleSignInModel(
            idToken: idToken,
            accessToken: accessToken
        )
        
        try await authenticationService.signInWithGoogle(tokens: tokens)
    }
    
}


        
// MARK: SIGN IN AUTH COMPANY MODELS
struct GoogleSignInModel {
    let idToken: String
    let accessToken: String
}



