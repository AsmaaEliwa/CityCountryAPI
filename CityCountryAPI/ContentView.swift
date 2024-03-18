//
//  ContentView.swift
//  CityCountryAPI
//
//  Created by asmaa gamal  on 18/03/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var apiManager = APIManager.shared
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            ScrollView{
                ForEach(apiManager.cities , id:\.self){city in
                    
                    Text(city.city)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
