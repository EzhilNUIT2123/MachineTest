//
//  HomeView.swift
//  Ecommerce App
//
//  Created by Ezhilarasi on 02/06/24.
//

import SwiftUI

struct HomeView: View {
    

    @StateObject var viewModel = HomeViewModel()
    
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    TopBannerView()
                    PromoBannerView(banners: viewModel.homeModelData)
                    HorizontalScrollView(title: "Most Popular"){
                        ProductCardView(products: viewModel.homeModelData)
                            .frame(width: 150)
                    }
                    SingleBannerView(banner: viewModel.homeModelData)
                    HorizontalScrollView(title: "Catagories"){
                        CategoryProductView(product: viewModel.homeModelData)
                            .frame(width: 90)
                    }
                    Spacer()
                    HorizontalScrollView(title: "Featured Products"){
                        FeaturedProducts(product: viewModel.homeModelData)
                            .frame(width: 150)
                    }
                    Spacer()
                }
            }
           
            .onAppear {
                viewModel.performTask()
            }
        }
    }
}

