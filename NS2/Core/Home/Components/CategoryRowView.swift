//
//  ProductRowView.swift
//  NS2
//
//  Created by Jaled Jara on 6/10/24.
//

import SwiftUI

struct CategoryRowView: View {
    let image: String
    let title: String
    
    var body: some View {
        VStack(spacing: 15) {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(
                    width: 100,
                    height: 100,
                    alignment:.center
                )
            Text(title.uppercased())
                .font(.subheadline)
                .fontWeight(.semibold)
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    CategoryRowView(
        image: "Perfumery",
        title: "Sparkles"
    )
}
