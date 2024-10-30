//
//  ChatHistory.swift
//  EthicalIssuesMobileApp
//
//  Created by Owen Tushan on 10/28/24.
//

import SwiftUI

struct ChatHistory: View {
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                    .overlay(Color.black)
                    .offset(y: -270)
                
                NavigationLink(destination: AskQuestion().navigationBarBackButtonHidden(true)){
                    
                    Image(systemName: "plus.bubble")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 35.0, height: 35.0)
                }
                .offset(x: -150, y: -330)
                
                Text("Chat History")
                    .offset(y: -310)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .multilineTextAlignment(.center)
                
                
                NavigationLink(destination: PastChatEx().navigationBarBackButtonHidden(true)){
                    
                    Text("Previous Chat Example")
                        .foregroundColor(.black)
                    
                }
                .offset(x: -0, y: -100)
                
            }
        }
    }
}

#Preview {
    ChatHistory()
}
