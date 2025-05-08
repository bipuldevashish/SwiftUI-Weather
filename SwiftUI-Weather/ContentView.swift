//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Bipul Devashish on 08/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Patna, In")
                
                MainWeatherStatusView(imageName: isNight ? "cloud.moon.fill" : "cloud.sun.fill", temperature: 38)
                
                HStack(spacing: 20) {
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.sun.fill",
                        temperature: 40
                    )
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "sun.max.fill",
                        temperature: 48
                    )
                    WeatherDayView(
                        dayOfWeek: "THU",
                        imageName: "wind.snow",
                        temperature: 26
                    )
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "sunset.fill",
                        temperature: 30
                    )
                    WeatherDayView(
                        dayOfWeek: "SAT",
                        imageName: "cloud.rain.fill",
                        temperature: 22
                    )
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(
                        title: "Change Day time",
                        textcolor: .blue,
                        backgroundColor: .white)
                }
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature:Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            VStack(spacing: 8) {
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                
                Text("\(temperature)°")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.white)
            }
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text("Patna, IN")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

