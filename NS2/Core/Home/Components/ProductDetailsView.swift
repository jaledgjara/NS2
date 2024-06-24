//
//  ProductDetailsView.swift
//  NS2
//
//  Created by Jaled Jara on 6/11/24.
//

import SwiftUI

struct ProductDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var count: Int = 0
    let product: Product
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                
                //toolbar
                HStack(spacing: 30) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "arrow.backward")
                            .imageScale(.large)
                            .foregroundStyle(.black)
                    })
                
                    Text(product.category.rawValue)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
                
                //image
                VStack {
                    ZStack(alignment: .topTrailing) {
                        Image(product.image ?? "")
                            .resizable()
                            .scaledToFill()
                            .frame(
                                width: 300,
                                height: 300
                            )
                        Button(action: {
                            //
                        }, label: {
                            Image(systemName: "heart")
                                .foregroundStyle(.greenP)
                                .imageScale(.large)
                        })
                    }
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
                }
                .frame(width: UIScreen.main.bounds.width - 50)
                
                //title
                HStack {
                    Text(product.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                //stepper
                VStack {
                    Stepper(
                        "HOW MANY?:  \(count)",
                        value: $count,
                        in: 0 ... Int.max,
                        step: 1
                    )
                    .foregroundStyle(.orangeP)
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding()
                    .frame(
                        width: UIScreen.main.bounds.width - 50,
                        height: 60
                    )
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
                    
                        
                }
                
                //button
                VStack {
                    Button(action: {
                        //
                    }, label: {
                        Text("ADD TO CART")
                            .padding()
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            .frame(
                                width: UIScreen.main.bounds.width - 50,
                                height: 50
                            )
                            .background(.greenP)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                }
                
                //Details
                VStack(alignment: .leading, spacing: 15) {
                    Text("Details")
                        .font(.title3)
                        .underline()
                    VStack(alignment: .leading,spacing: 15) {
                        Text(product.description)
                            .multilineTextAlignment(.leading)
                            .fontWeight(.light)
                        Text("$ \(String(format: "%.2f", product.price))")
                        HStack {
                            Text("\(product.rating)")
                            Image(systemName: "star.fill")
                        }
                    }
                    .font(.title3)
                    .fontWeight(.semibold)
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    ProductDetailsView(
        product: DeveloperPreview.products[0]
    )
}
