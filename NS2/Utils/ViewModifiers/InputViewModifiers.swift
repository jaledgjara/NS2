//
//  InputViewModifiers.swift
//  NS2
//
//  Created by Jaled Jara on 5/28/24.
//

import SwiftUI

struct InputViewModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.light)
            .padding()
            .frame(width: UIScreen.main.bounds.width - 50,
                   height: 45,
                   alignment: .center
            )
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.greenP ,lineWidth: 1.0)
            }
    }
}

#Preview {
    Text("Hello, world!")
        .modifier(InputViewModifiers())
}
