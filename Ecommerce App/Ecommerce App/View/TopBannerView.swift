//
//  TopBannerView.swift
//  Ecommerce App
//
//  Created by Ezhilarasi on 02/06/24.
//

import SwiftUI

struct TopBannerView: View {
    var body: some View {
        HStack {
            Image("cart")
                .foregroundColor(.black)
                .frame(width: 26, height: 25)
                .padding(.trailing)
            Spacer()
            TextField("", text: .constant(""))
                .frame(height: 15) // Adjust the height of the TextField
                .padding(.vertical, 5) // Adjust vertical padding
                .padding(.horizontal)
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.trailing, 8) // Adjust the padding as needed
                    }
                )
            
            Spacer()
            Image(systemName: "bell")
                .foregroundColor(.white)
                .padding(.leading)
        }
        .padding(.vertical, 8) // Adjust vertical padding for the whole view
        .padding(.horizontal)
        .background(Color("green"))
    }
}

