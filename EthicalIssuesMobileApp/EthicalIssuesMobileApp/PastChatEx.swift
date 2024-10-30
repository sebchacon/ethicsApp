//
//  PastChatEx.swift
//  EthicalIssuesMobileApp
//
//  Created by Owen Tushan on 10/30/24.
//

import SwiftUI

struct PastChatEx: View {
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                    .overlay(Color.black)
                    .offset(y: -270)
                
                NavigationLink(destination: ChatHistory().navigationBarBackButtonHidden(true)){
                    
                    Image(systemName: "arrowshape.turn.up.left")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 35.0, height: 30.0)
                    
                }
                .offset(x: -150, y: -330)
                
                Text("Past Chat")
                    .offset(y: -300)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .multilineTextAlignment(.center)
                
                
                
            }
        }
    }
}

#Preview {
    PastChatEx()
}
