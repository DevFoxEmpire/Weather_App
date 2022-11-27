//
//  ContentView.swift
//  Weather
//
//  Created by Olha Hladush on 11/27/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            //MARK: main VStack
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                //MARK: VStack for main icon and temperature
                VStack(spacing: 8) {
                    
                    MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: isNight ? 55 : 76)
                    
                }
                .padding(.bottom, 40)
                
                
                //MARK: HStack for weater by day
                HStack(spacing: 25) {
                    
                    WeatherDayView()

                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
                
            }.foregroundColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View{
    
    @ObservedObject var model = WeatherDayModel()
    var body: some View {
            ForEach(model.weatherDays) { item in
                VStack {
                    Text(item.dayOfWeek)
                        .font(.system(size: 16, weight: .medium))
                    Image(systemName: item.imageName)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    Text(String("\(item.temperature)°"))
                        .font(.system(size: 28, weight: .medium))
                }
        }
    }
}


struct BackgroundView: View {
    
    @Binding var isNight:Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(
            colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName:String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName:String
    var temperature: Int
    
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        
        Text("\(temperature)°")
            .font(.system(size: 70, weight: .medium))
    }
}


