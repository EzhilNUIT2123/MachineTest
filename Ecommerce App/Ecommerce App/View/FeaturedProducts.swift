//
//  FeaturedProducts.swift
//  Ecommerce App
//
//  Created by Ezhilarasi on 02/06/24.
//

import SwiftUI

struct FeaturedProducts: View {
    
    let product: [HomeModelData]
    
    var body: some View {
        
        ForEach(product, id: \.title) { product in
        
            if product.title == "Best Sellers"{
                if let contents = product.contents {
                    ForEach(contents ,id: \.sku){ data in
                        if let image = data.productImage , let productName = data.productName , let offerPrice = data.offerPrice , let actualPrice = data.actualPrice, let discount = data.discount {
                            VStack{
                                RemoteImage(url: image)
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(8)
                                
                                Text(productName)
                                    .font(.system(size: 9))
                                    .lineLimit(2)
                                
                                Text(offerPrice)
                                    .font(.system(size: 9))
                                
                                Text(actualPrice)
                                    .font(.system(size: 9))
                                    .strikethrough()
                                
                                Text(discount)
                                    .font(.system(size: 9))
                                    .foregroundColor(.red)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10,style: .continuous)
                                    .stroke(Color.gray,lineWidth: 1.0)
                                    .fill(Color.clear)
                                
                            )
                        }
                    }
                }
            }
        }
    }
    
}
