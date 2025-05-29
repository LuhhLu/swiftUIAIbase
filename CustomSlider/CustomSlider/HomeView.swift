//
//  HomeView.swift
//  CustomSlider
//
//  Created by youssef on 2023-05-06.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 50){
            ContentView(tracGradient: LinearGradient(gradient: Gradient(colors: [.red,.yellow,.green,.blue,.purple]), startPoint: .leading, endPoint: .trailing))
            secondSlider()
            ThirdSlider()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
