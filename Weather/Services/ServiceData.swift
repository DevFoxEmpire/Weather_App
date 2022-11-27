//
//  ServiceData.swift
//  Weather
//
//  Created by Olha Hladush on 11/27/22.
//

import Foundation

class ServiceData {
    
    static func getLocalData() -> [WeatherDay] {
        
        let pathString = Bundle.main.path(forResource: "data", ofType: "json")
        
        guard pathString != nil else {
            return [WeatherDay]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do {
                 let serviceData = try decoder.decode([WeatherDay].self, from: data)
                
                for i in serviceData {
                    i.id = UUID()
                }
                
                return serviceData
                
            }
            catch {
                print(error)
            }
            
            
        }
        catch {
            print(error)
        }
        
        
        
       return [WeatherDay]()
    }
    
    
}
