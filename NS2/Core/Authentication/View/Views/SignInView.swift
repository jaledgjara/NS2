//
//  SignInView.swift
//  NS2
//
//  Created by Jaled Jara on 5/28/24.
//

import SwiftUI
import UIKit
import GoogleSignIn
import GoogleSignInSwift
import AuthenticationServices

struct SignInView: View {
    @StateObject var viewModel: SignInViewModel
    
    private let authenticationService: AuthenticationService
    private let userService: UserService
    init(authenticationService: AuthenticationService,
         userService: UserService
    ) {
        self.authenticationService = authenticationService
        self.userService = userService
        self._viewModel = StateObject(wrappedValue: SignInViewModel(
            authenticationService: authenticationService,
            userService: userService
        ))
    }
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 60) {
                
                //title&subtitle
                VStack(alignment: .leading, spacing: 10) {
                    Text("Sign In")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Welcome back! Sign in to continue exploring.")
                        .font(.headline)
                        .fontWeight(.regular)
                }
                
                
                //input items
                VStack(spacing: 15) {
                    TextField(
                        "Email...",
                        text: $viewModel.textEmail
                    )
                    .modifier(InputViewModifiers())
                    SecureField(
                        "Password...",
                        text: $viewModel.textPassword
                    )
                    .modifier(InputViewModifiers())
                    
                    Button {
                        Task {
                            try await viewModel.signIn(
                                withEmail: viewModel.textEmail,
                                password: viewModel.textPassword
                            )
                        }
                    } label: {
                        CustomButton(
                            text: "Sign In".uppercased(),
                            width: 50,
                            height: 50,
                            color: .greenP
                        )
                        .disabled(!formIsValid)
                        .opacity(formIsValid ? 1 : 0.5)
                    }
                    
                }
                
                //Links and company auths
                VStack(spacing: 15) {
                    //forgettPass
                    
                    NavigationLink {
                        //
                    } label: {
                        HStack {
                            Text("Forget your sign in items?")
                            Text("Get help signing in")
                                .fontWeight(.semibold)
                        }
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundStyle(.black)
                        
                    }
                    
                    
                    //or
                    
                    HStack {
                        Rectangle()
                            .frame(
                                width: (UIScreen.main.bounds.width/2) - 50,
                                height: 1
                            )
                        Text("OR")
                        
                        Rectangle()
                            .frame(
                                width: (UIScreen.main.bounds.width/2) - 50,
                                height: 1
                            )
                    }
                    
                    
                    //apple & google
                    
                    
                    VStack(spacing: 20) {
                        GoogleSignInButton(scheme: .light, style: .standard, state: .normal) {
                            Task {
                                do {
                                    try await viewModel.signInWithGoogle()
                                } catch {
                                    throw PharmacyError.authenticationFailed
                                }
                            }
                        }
                        .frame(
                            width: UIScreen.main.bounds.width - 50,
                            height: 40
                        )
                        
                        SignInWithAppleButton { request in
                            //
                        } onCompletion: { result in
                            //
                        }
                        .frame(
                            width: UIScreen.main.bounds.width - 50,
                            height: 40
                        )

                        
                    }
                    
                    
                    //signUp
                    
                    NavigationLink {
                        SignUpView(authenticationService: authenticationService, userService: userService)
                    } label: {
                        HStack {
                            Text("Don´t have an account?")
                            Text("Sign Up!")
                                .fontWeight(.semibold)
                                .underline()
                        }
                        .font(.subheadline)
                        .foregroundStyle(.black)
                    }
                }
                
                //logo
                VStack {
                    Image(.pharmacyLogo)
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: 100,
                            height: 70,
                            alignment: .center
                        )
                }
            }
            .padding()
                
        }
    }
}



extension SignInView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return isValidEmail(email: viewModel.textEmail) && validatePassword(viewModel.textPassword)
    }
}

extension SignInView {
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func validatePassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
}




#Preview {
    SignInView(authenticationService: AuthenticationService(),
               userService: UserService()
    )
}
