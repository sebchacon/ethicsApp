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
//Button, Header, and lines
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)){
                    Text("Back to Home")
                }
                .offset(x: -120, y: -240)
                .font(.title2)
                
                Divider()
                    .overlay(Color.black)
                    .offset(y: -240)
                
                Text("About Us")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .multilineTextAlignment(.center)
                    .offset(y: -230)
                
//Owen Tushan Information
                Text("Owen Tushan")
                    .padding()
                    .frame(width: 1000, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(10)
                    .offset(x: -100, y: -200)
                
                    .overlay(
                        Image("creator1")
                            .resizable()
                            .frame(width: 80, height: 100)
                            .offset(x: 120, y: -120)
                        
                    )
                
                    .overlay(
                        Text("Software Quality and Assurance\nFrisco, TX")
                            .multilineTextAlignment(.leading)
                            .offset(x: -68, y: -150)
                        
                    )
                    .overlay(
                        Text("Majoring in Computer Science\nand Data Science")
                            .multilineTextAlignment(.leading)
                            .offset(x: -76, y: -100)
                        
                    )
                    
//Sebastian Chacon Information
                Text("Sebastian Chacon")
                    .padding()
                    .frame(width: 1000, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(10)
                    .offset(x: -83, y: -100)
                
                    .overlay(
                        Image("creator3")
                            .resizable()
                            .frame(width: 80, height: 100)
                            .offset(x: 120, y: -20)
                    )
                
                    .overlay(
                        Text("Projet Manager\nLake Tahoe, NV")
                            .multilineTextAlignment(.leading)
                            .offset(x: -129, y: -50)
                    )
                    .overlay(
                        Text("Majoring in Computer Science\nand Econometrics")
                            .multilineTextAlignment(.leading)
                            .offset(x: -76, y: -0)
                    )
                
//Ava Monte information
                Text("Ava Monte")
                    .padding()
                    .frame(width: 1000, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(10)
                    .offset(x: -113)
                
                    .overlay(
                        Image("creator2")
                            .resizable()
                            .frame(width: 70, height: 100)
                            .offset(x: 120, y: 80)
                    )
                
                    .overlay(
                        Text("IT Strategy and Planning\nHot Springs, AR")
                            .multilineTextAlignment(.leading)
                            .offset(x: -95, y: 50)
                    )
                    .overlay(
                        Text("Majoring in Computer Science")
                            .multilineTextAlignment(.leading)
                            .offset(x: -75, y: 100)
                    )
                
//Final Line for symmetry
                    .overlay(
                        Text("")
                            .padding()
                            .frame(width: 1000, height: 50)
                            .background(Color.black.opacity(0.04))
                            .cornerRadius(10)
                            .offset(x: 113, y: 160)
                    )
                
            }
            
        }
    }
}

#Preview {
    AboutUs()
}
