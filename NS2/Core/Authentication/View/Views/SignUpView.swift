//
//  SignUpView.swift
//  NS2
//
//  Created by Jaled Jara on 5/28/24.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: SignUpViewModel
    
    //Dependecy Injection
    private let authenticationService: AuthenticationService
    private let userService: UserService
    init(authenticationService: AuthenticationService,
         userService: UserService
    ) {
        self.authenticationService = authenticationService
        self.userService = userService
        
        self._viewModel = StateObject(wrappedValue: SignUpViewModel(
            authenticationService: authenticationService,
            userService: userService
        ))
        
    }

    
    var body: some View {
        VStack(spacing: 70) {
            
            //title&subtitle
            VStack(alignment: .leading, spacing: 10) {
                Text("Sign Up")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Join our community and discover new products")
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
                
                TextField(
                    "Username...",
                    text: $viewModel.textUsername
                )
                .modifier(InputViewModifiers())

                Button {
                    Task {
                        try await viewModel.signUp(
                            withEmail: viewModel.textEmail,
                            username: viewModel.textUsername,
                            password: viewModel.textPassword
                        )
                    }
                } label: {
                    CustomButton(
                        text: "Sign Up".uppercased(),
                        width: 50,
                        height: 50,
                        color: .greenP
                    )
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1 : 0.5)
                }
                
            }
            
            
            //forgettPass & signing up
            VStack(spacing: 15) {
                
                
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                        Text("Sign In!")
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

extension SignUpView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return isValidEmail(email: viewModel.textEmail) && validatePassword(viewModel.textPassword)
    }
}

extension SignUpView {
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
    SignUpView(authenticationService: AuthenticationService(),
               userService: UserService()
    )
}
