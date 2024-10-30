//
//  AboutUs.swift
//  EthicalIssuesMobileApp
//
//  Created by Owen Tushan on 10/28/24.
//

import SwiftUI

struct AboutUs: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)){
                    Text("Back to Home")
                }
                .offset(x: -120, y: -230)
                .font(.title2)
                
                Divider()
                    .overlay(Color.black)
                    .offset(y: -220)
                
                Text("About Us")
                    .offset(y: -225)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .multilineTextAlignment(.center)
                
                Text("Owen Tushan")
                    .padding()
                    .frame(width: 1000, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(10)
                    .offset(x: -100, y: -200)
                    
                
                Text("Sebastian Chacon")
                    .padding()
                    .frame(width: 1000, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(10)
                    .offset(x: -83, y: -100)
                
                Text("Ava Monte")
                    .padding()
                    .frame(width: 1000, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(10)
                    .offset(x: -113)
                
            }
        }
    }
}

#Preview {
    AboutUs()
}
