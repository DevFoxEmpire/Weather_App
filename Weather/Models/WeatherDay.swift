//
//  WeatherDay.swift
//  Weather
//
//  Created by Olha Hladush on 11/27/22.
//

import Foundation

class WeatherDay: Identifiable, Decodable {
    
    var id:UUID?
    var dayOfWeek:String
    var imageName:String
    var temperature:Int
    
    
}
