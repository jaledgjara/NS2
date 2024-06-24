//
//  ProfileImageView.swift
//  NS2
//
//  Created by Jaled Jara on 5/28/24.
//

import SwiftUI

struct ProfileImageView: View {
    var body: some View {
        Image(.pharmacyLogo)
            .resizable()
            .scaledToFill()
            .frame(
                width: 100,
                height: 100,
                alignment: .center
            )
            .padding()
            .preferredColorScheme(.light)
    }
}

#Preview {
    ProfileImageView()
}
