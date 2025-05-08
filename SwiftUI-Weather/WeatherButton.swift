//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Bipul Devashish on 08/05/25.
//

import Foundation
import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textcolor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text (title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textcolor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(title: "Test Title", textcolor: .white, backgroundColor: .blue)
    }
}
