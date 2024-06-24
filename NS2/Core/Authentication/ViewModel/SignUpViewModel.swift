//
//  SignUpViewModel.swift
//  NS2
//
//  Created by Jaled Jara on 5/30/24.
//

import Foundation

@MainActor
class SignUpViewModel: ObservableObject {
    @Published var textEmail = ""
    @Published var textPassword = ""
    @Published var textUsername = ""
    
    private let authenticationService: AuthenticationService
    private let userService: UserService
    
    init(authenticationService: AuthenticationService, userService: UserService) {
        self.authenticationService = authenticationService
        self.userService = userService
    }
    
    func signUp(withEmail email: String, username: String, password: String) async throws {
        do {
            try await authenticationService.createUser(
                withEmail: email,
                username: username,
                password: password
            )
        } catch {
            throw PharmacyError.authenticationFailed
        }
    }
    
    
}
