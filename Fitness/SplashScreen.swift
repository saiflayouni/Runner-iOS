//
//  SplashScreen.swift
//  Fitness
//
//  Created by Macbook Pro on 19/4/2023.
//  Copyright © 2023 Amine BEN ZAGGAGH. All rights reserved.
//

import Foundation
import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        VStack {
            Image(systemName: "logo")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            Text("My Awesome App")
                .font(.title)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
