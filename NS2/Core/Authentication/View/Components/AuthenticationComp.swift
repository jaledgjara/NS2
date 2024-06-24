//
//  AuthenticationComp.swift
//  NS2
//
//  Created by Jaled Jara on 5/28/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct AuthenticationComp: View {
    var title: String
    
    var body: some View {
        VStack {
            Text("Sign \(title) with: ")
                .font(.subheadline)
                .fontWeight(.semibold)
            
        
        }
    }
}

#Preview {
    AuthenticationComp(title: "up")
}
