//
//  DeletedAccMessage.swift
//  EthicalIssuesMobileApp
//
//  Created by Owen Tushan on 10/29/24.
//

import SwiftUI

struct DeletedAccMessage: View {
    var body: some View {
        NavigationView {
            VStack {
                
                
                Text("Account Successfully Deleted")
                    .offset(y: -250)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("Click below to return to the home screen")
                    .offset(y: 25)
                
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)){
                    Text("Return")
                }
                .foregroundColor(.white)
                .frame(width: 250, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .offset(y: 50)
            }
        }
    }
}

#Preview {
    DeletedAccMessage()
}
