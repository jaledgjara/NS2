//
//  PaymentImageView.swift
//  NS2
//
//  Created by Jaled Jara on 6/14/24.
//

import SwiftUI

struct PaymentImageView: View {
    @State private var cartCount = 10
    var body: some View {
        ZStack {
            Image(systemName: "cart.fill")
                .resizable()
                .frame(width: 40, height: 40)
            
            Text("\(cartCount)")
                .frame(width: 15, height: 15)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.orangeP)
                .clipShape(Circle())
                .offset(x: 15, y: -15)
            
        }
        .padding()
    }
}

#Preview {
    PaymentImageView()
}
