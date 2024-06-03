//
//  ProductCardView.swift
//  Ecommerce App
//
//  Created by Ezhilarasi on 02/06/24.
//

import SwiftUI
import CoreData

struct ProductCardView: View {
    
    let products: [HomeModelData]
    
    var body: some View {
        ForEach(products, id: \.title) { product in
            if product.title == "Most Popular" {
                if let contents = product.contents {
                    ForEach(contents, id: \.sku) { data in
                        if let image = data.productImage,
                           let productName = data.productName,
                           let offerPrice = data.offerPrice,
                           let actualPrice = data.actualPrice,
                           let discount = data.discount,
                           let rating = data.productRating {
                            ProductView(
                                image: image,
                                productName: productName,
                                offerPrice: offerPrice,
                                actualPrice: actualPrice,
                                discount: discount,
                                rating: String(rating)
                            )
                        }
                    }
                }
            }
        }
    }
}

struct ProductView: View {
    let image: String
    let productName: String
    let offerPrice: String
    let actualPrice: String
    let discount: String
    let rating: String
    
    var body: some View {
        VStack(alignment:.leading) {
            RemoteImage(url: image)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
            
            DiscountView(discount: discount)
            
            Text(productName)
                .font(.system(size: 9))
                .lineLimit(2)
            
            RatingView(rating: rating)
            
            PriceView(offerPrice: offerPrice, actualPrice: actualPrice)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(Color.gray, lineWidth: 1.0)
                .fill(Color.clear)
        )
    }
}

struct DiscountView: View {
    let discount: String
    
    var body: some View {
        if discount.contains("% Off") {
            let discountString = discount.replacingOccurrences(of: "% Off", with: "").trimmingCharacters(in: .whitespaces)
            if let discountValue = Int(discountString) {
                Text("Sale \(discountValue)% OFF")
                    .padding(5)
                    .background(Color("orange"))
                    .cornerRadius(8)
                    .font(.system(size: 9))
            }
        }
    }
}

struct RatingView: View {
    let rating: String
    
    var body: some View {
        HStack(spacing: 1) {
            ForEach(0..<5) { index in
                Image(systemName: index < (Int(rating) ?? 0) ? "star.fill" : "star.fill")
                    .foregroundColor(index < (Int(rating) ?? 0) ? .yellow : .gray)
                    .font(.system(size: 8))
            }
        }
    }
}

struct PriceView: View {
    let offerPrice: String
    let actualPrice: String
    
    var body: some View {
        if actualPrice == offerPrice {
            Text(actualPrice)
                .font(.system(size: 9))
        } else {
            HStack(spacing: 1) {
                Text(offerPrice)
                    .font(.system(size: 9))
                    .padding(2)
                Text(actualPrice)
                    .font(.system(size: 9))
                    .strikethrough()
            }
        }
    }
}


struct HorizontalScrollView<Content: View>: View {
    let title: String
    let content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    content()
                }
                .padding(.horizontal)
            }
        }
    }
}










