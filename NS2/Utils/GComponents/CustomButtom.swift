//
//  CustomButtom.swift
//  NS2
//
//  Created by Jaled Jara on 5/28/24.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var width: CGFloat
    var height: CGFloat
    var color: Color

    var body: some View {
        VStack {
            Text(text.uppercased())
                .foregroundColor(.black)
                .font(.headline)
                .frame(
                    width: UIScreen.main.bounds.width - width,
                    height: height
                )
                .background(color)
                .cornerRadius(10)
        }
    }
}

#Preview {
    CustomButton(
        text: "Sign Up!",
        width: 50,
        height: 50,
        color: .orangeP
    )
}
