//
//  FeaturedProducts.swift
//  Ecommerce App
//
//  Created by Ezhilarasi on 02/06/24.
//

import SwiftUI

struct CategoryProductView: View {
    
    let product: [HomeModelData]
    
    var body: some View {
        
        ForEach(product, id: \.title) { product in
        
            if product.title == "Top categories"{
                if let contents = product.contents {
                    ForEach(contents ,id: \.title){ data in
                        if let image = data.imageURL , let title = data.title {
                            VStack{
                                RemoteImage(url: image)
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(8)
                                
                                Text(title)
                                    .font(.system(size: 9))
                        
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10,style: .continuous)
                                    .stroke(Color.gray,lineWidth: 1)
                                    .fill(Color.clear)
                            )
                        }
                    }
                }
            }
        }
    }
    
}
