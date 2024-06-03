//
//  BannerSliderView.swift
//  Ecommerce App
//
//  Created by Ezhilarasi on 02/06/24.
//

import SwiftUI

struct BannerSliderView: View {
    
    var items : [HomeModelData]
    
    var body: some View {
        ScrollView{
            HStack {
                ForEach(items, id: \.id) { item in
                    if let imageUrl = item.imageURL, let url = URL(string: imageUrl) {
                        AsyncImage(url: url) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            Color.gray
                        }
                    }
                }
               // Image("dummy").resizable()
            }
            //.frame(height: 200)
        }
    }
}

