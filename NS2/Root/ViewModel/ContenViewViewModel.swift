//
//  ContenViewViewModel.swift
//  NS2
//
//  Created by Jaled Jara on 6/4/24.
//

import Foundation
import FirebaseAuth
import Combine

@MainActor 
class ContentViewViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    private let authenticationService: AuthenticationService
    private let userService: UserService
    private let productService: ProductService
    
    private var cancellables = Set<AnyCancellable>()
    
    init(
        authenticationService: AuthenticationService,
        userService: UserService,
        productService: ProductService
    
    ) {
        self.authenticationService = authenticationService
        self.userService = userService
        self.productService = productService
        
        setUpSubscribers()
        authenticationService.updateUserSession()
    }
    
    private func setUpSubscribers() {
        authenticationService.$userSession
            .receive(on: DispatchQueue.main)  // Asegúrate de recibir en el hilo principal
            .sink { [weak self] user in
                self?.userSession = user
                self?.fetchCurrentUser()
            }
            .store(in: &cancellables)
    }
    
    func fetchCurrentUser() {
        guard userSession != nil else { return }
        Task {
            self.currentUser = try await userService.fetchCurrentUserData()
        }
    }
}
