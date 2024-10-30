//
//  ForgotPassword.swift
//  EthicalIssuesMobileApp
//
//  Created by Owen Tushan on 10/28/24.
//

import SwiftUI

struct ForgotPassword: View {
    @State private var username = ""
    @State private var wrongUsername = 0
    @State private var resetPassword = false
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)){
                    Text("Back to Home")
                }
                .offset(x: -120, y: -210)
                .font(.title2)
                
                Divider()
                    .overlay(Color.black)
                    .offset(y: -200)
                
                Text("Forgor Password Page")
                    .offset(y: -200)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .multilineTextAlignment(.center)
                
                Text("Please Enter the email associated with your account. We will then direct you to a page to reset your password.")
                    .offset(x: 0, y: -150)
                    .multilineTextAlignment(.center)
                
                Text("email")
                    .offset(x: -150, y: -90)
                
                TextField("Username", text: $username)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(wrongUsername))
                    .offset(x: 0, y: -80)
                
                Button ("Reset Password"){
                    authenticateEmail(username: username)
                }
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .offset(y: -60)
                
                NavigationLink(destination: ResetPassword().navigationBarBackButtonHidden(true), isActive: $resetPassword){
                    
                }
                
                
            }
            .navigationBarHidden(true)
        }
    }
    
    func authenticateEmail(username: String){
//Needs database functionality
        //If username is in databse
        if(username.lowercased() == "testuser@test.com"){
            wrongUsername = 0
            resetPassword = true
        }
        else{
            wrongUsername = 2
        }
    }
}

#Preview {
    ForgotPassword()
}
