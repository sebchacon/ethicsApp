//
//  GetAnswer.swift
//  EthicalIssuesMobileApp
//
//  Created by Owen Tushan on 10/28/24.
//

import SwiftUI

struct GetAnswer: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Question here...")
                    .offset(x: 100, y: -120)
                
                Text("Get answer here...")
                    .offset(x: -100, y: 50)
                
                Divider()
                    .overlay(Color.black)
                    .offset(y: -265)
                
                NavigationLink(destination: AskQuestion().navigationBarBackButtonHidden(true)){
                    
                    Image(systemName: "plus.bubble")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 35.0, height: 35.0)
                    
                }
                .offset(x: -140, y: -330)
                
                
                
                Divider()
                    .overlay(Color.black)
                    .offset(y: 125)
                
                Divider()
                    .overlay(Color.black)
                    .offset(y: 250)
                
                HStack {
                    Button ("For"){
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 100, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                    .offset(x: -20, y: 150)
                    
                    Button ("Neutral"){
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 100, height: 50)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .offset(x: 0, y: 150)
                    
                    Button ("Against"){
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 100, height: 50)
                    .background(Color.red)
                    .cornerRadius(10)
                    .offset(x: 20, y: 150)
                    
                }
                
                NavigationLink(destination: ChatHistory().navigationBarBackButtonHidden(true)){
                    Text("View History")
                }
                .foregroundColor(.black)
                .padding()
                .border(.black)
                .offset(x: 0, y: 225)
                
            }
        }
    }
}

#Preview {
    GetAnswer()
}
