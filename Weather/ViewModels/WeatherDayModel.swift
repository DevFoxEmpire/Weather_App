//
//  WeatherDayModel.swift
//  Weather
//
//  Created by Olha Hladush on 11/27/22.
//

import Foundation

class WeatherDayModel: ObservableObject  {
    
    @Published var weatherDays: [WeatherDay]
    
    init() {
        self.weatherDays = ServiceData.getLocalData()
    }
    
    
    
}
