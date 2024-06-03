//
//  HomeDataViewModel.swift
//  Ecommerce App
//
//  Created by Ezhilarasi on 02/06/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var homeModelData: [HomeModelData] = []
 
    func performTask() {
        guard let url = URL(string: "https://64bfc2a60d8e251fd111630f.mockapi.io/api/Todo") else {
            print("Invalid URL")
            return
        }
  
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            self.parseJson(data: data)
            
        }.resume()
    }
    
    func parseJson(data : Data){
        let decode = JSONDecoder()
        do {
            let response = try decode.decode(HomeModel.self, from: data)
                //CoreDataManager.shared.saveDataToCoreData(apiData: response)
            DispatchQueue.main.async {
                self.homeModelData = response
            }
        } catch {
            print(error)
        }
    }
    
    
}
