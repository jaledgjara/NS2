//
//  SearchableResultRowView.swift
//  NS2
//
//  Created by Jaled Jara on 6/13/24.
//

import SwiftUI

struct SearchableResultRowView: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack(spacing: 20) {
                Image(systemName: "pill")
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: 40,
                        height: 40
                    )
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .font(.headline)
                    Text(product.category.rawValue)
                        .font(.subheadline)
                }
                
                Spacer()
            }
            .padding()
        }
        .frame(
            width: UIScreen.main.bounds.width - 30,
            height: 90,
            alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/
        )
        .background(.white)
        .shadow(radius: 10)
    }
}

#Preview {
    SearchableResultRowView(product: DeveloperPreview.products[0])
}
