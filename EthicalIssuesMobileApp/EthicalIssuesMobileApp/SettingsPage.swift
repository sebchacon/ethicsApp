//
//  SettingsPage.swift
//  EthicalIssuesMobileApp
//
//  Created by Owen Tushan on 10/29/24.
//

import SwiftUI

struct SettingsPage: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Settings")
                    .offset(y: -275)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                NavigationLink(destination: AskQuestion().navigationBarBackButtonHidden(true)){
                    Text("Back to Ask Question")
                }
                .offset(x: 0, y: -100)
                .font(.title2)
                
                NavigationLink(destination: ChangePasswordOne().navigationBarBackButtonHidden(true)){
                    Text("Change Password")
                }
                .offset(x: 0, y: -50)
                .font(.title2)
                
                NavigationLink(destination: DeleteAccount().navigationBarBackButtonHidden(true)){
                    Text("Delete Account")
                }
                .offset(x: 0, y: 0)
                .font(.title2)
                
                
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)){
                    Text("Log Out")
                }
                .offset(y: 250)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    SettingsPage()
}
