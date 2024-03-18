//
//  APIManager.swift
//  CityCountryAPI
//
//  Created by asmaa gamal  on 18/03/2024.
//

import Foundation
class APIManager:ObservableObject{
    @Published var cities: [CityModel] = []
    static let shared = APIManager()
    
    
    private init(){
       getCities()
    }
    
    
    
    func getCities(){
        let url =  "https://raw-tutorial.s3.eu-west-1.amazonaws.com/patients.json"
        let decoder = JSONDecoder()
        NetworkManager.shared.getRequest(url: url) { data in
            if let jsonData = data {
                do {
                    let result = try decoder.decode([CityModel].self, from: jsonData)
                    self.cities = result
                }catch{
                    print(error)
                }
            }
        }
        
    }
    
    
    
    
    
}
