//
//  PromoBannerView.swift
//  Ecommerce App
//
//  Created by Ezhilarasi on 02/06/24.
//

import SwiftUI

struct PromoBannerView: View {
    
    let banners: [HomeModelData]
    
    var body: some View {
        TabView {
            ForEach(banners, id: \.title) { banner in
                if banner.title == "Top banner"{
                    if let contents = banner.contents{
                        ForEach(contents ,id: \.title){ image in
                            if let image = image.imageURL{
                                RemoteImage(url: image)
                                    .scaledToFill()
                                    .frame(maxWidth: .infinity, maxHeight: 200)
                                    .clipped()
                            }
                        }
                    }
                }
            }
        }
        .frame(height: 200)
        .tabViewStyle(PageTabViewStyle())
    }
}

struct SingleBannerView: View {
    
    let banner: [HomeModelData]
    
    var body: some View {
        ForEach(banner, id: \.title) { banner in
            if banner.title == "ad banner"{
                if let image = banner.imageURL{
                    RemoteImage(url: image)
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 150)
                        .cornerRadius(10)
                        .padding(.all)
                }
            }
        }
    }
}

