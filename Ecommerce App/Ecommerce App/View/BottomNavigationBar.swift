//
//  BottomNavigationBar.swift
//  Ecommerce App
//
//  Created by Ezhilarasi on 02/06/24.
//

import SwiftUI

struct BottomNavigationBar: View {
    
    enum Tab {
        case home, category, offers, account, cart
    }
    
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                switch selectedTab {
                case .home:
                    HomeView()
                case .category:
                    CategoryView()
                case .offers:
                    OffersView()
                case .account:
                    AccountView()
                case .cart:
                    CartView()
                }
                
                Divider()
                
                HStack {
                    TabButton(tab: .home, selectedTab: $selectedTab)
                    Spacer()
                    TabButton(tab: .category, selectedTab: $selectedTab)
                    Spacer()
                    TabButton(tab: .offers, selectedTab: $selectedTab)
                    Spacer()
                    TabButton(tab: .account, selectedTab: $selectedTab)
                    Spacer()
                    TabButton(tab: .cart, selectedTab: $selectedTab)
                }
                .padding()
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct TabButton: View {
    let tab: BottomNavigationBar.Tab
    @Binding var selectedTab: BottomNavigationBar.Tab
    
    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            Image(systemName: tab == selectedTab ? selectedImageName(for: tab) : unselectedImageName(for: tab))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(tab == selectedTab ? .blue : .gray)
        }
    }
    
    func selectedImageName(for tab: BottomNavigationBar.Tab) -> String {
        switch tab {
        case .home:
            return "house.fill"
        case .category:
            return "rectangle.grid.1x2.fill"
        case .offers:
            return "tag.fill"
        case .account:
            return "person.fill"
        case .cart:
            return "cart.fill"
        }
    }
    
    func unselectedImageName(for tab: BottomNavigationBar.Tab) -> String {
        switch tab {
        case .home:
            return "house"
        case .category:
            return "rectangle.grid.1x2"
        case .offers:
            return "tag"
        case .account:
            return "person"
        case .cart:
            return "cart"
        }
    }
}

