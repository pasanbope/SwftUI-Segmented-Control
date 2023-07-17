//
//  ContentView.swift
//  SwftUI-Segmented-Control
//
//  Created by Pasan Bopagamage on 2023-07-16.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .yellow
        UISegmentedControl.appearance().setTitleTextAttributes(
            [.foregroundColor : UIColor.black], for: .selected)
    }
    
    @State private var selectedSide: SideOfTheForce = .dark
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Chose a Side", selection: $selectedSide) {
                    ForEach(SideOfTheForce.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Spacer()
                ChosenHeroView(selectedSide: selectedSide)
                Spacer()
            }
            .navigationBarTitle("Choose a Side")
        }
    }
}

enum SideOfTheForce: String, CaseIterable {
    case light = "Light"
    case grey = "Grey"
    case dark = "Dark"
}

struct ChosenHeroView: View {
    
    var selectedSide: SideOfTheForce
    
    var body: some View {
        switch selectedSide {
        case .light:
            HeroImageView(heroName: "yoru")
        case .grey:
            HeroImageView(heroName: "Jett")
        case .dark:
            HeroImageView(heroName: "Breach")
        }
    }
}

struct HeroImageView: View {
    var heroName: String
    
    var body: some View {
        Image(heroName)
            .resizable()
            .frame(width: 250, height: 400)
            .shadow(color: .white, radius: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
