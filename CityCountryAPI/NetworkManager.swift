//
//  NetworkManager.swift
//  CityCountryAPI
//
//  Created by asmaa gamal  on 18/03/2024.
//

import Foundation
class NetworkManager{
    static let shared = NetworkManager()
    private init(){
        
    }
    func getRequest(url:String, compilation:@escaping(Data?)->Void){
        guard let urlRequest = URL(string:url) else {return}
        var request = URLRequest(url: urlRequest)
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        request.cachePolicy = .useProtocolCachePolicy
        
        let task = URLSession.shared.dataTask(with:request ){data , response , error in
            
            if  data  != nil {
                compilation(data)
            }else{
                compilation(nil)
            }
            
        }
        task.resume()
    }
}
