//
//  AdvertisementsView.swift
//  NS2
//
//  Created by Jaled Jara on 6/11/24.
//

import SwiftUI

struct AdvertisementsView: View {
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(Advertisements.allCases) { add in
                VStack(alignment: .leading, spacing: 17) {
                    Text(add.title)
                        .font(.title2)
                        .underline()
                    Text(add.description)
                        .font(.headline)
                }
                .fontWeight(.semibold)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(add.color, lineWidth: 2.0)
                }
            }
        }
        .tabViewStyle(.page)
        .clipped()
        .frame(
            width: UIScreen.main.bounds.width - 50,
            height: 200
        )
    }
}


#Preview {
    AdvertisementsView()
}
