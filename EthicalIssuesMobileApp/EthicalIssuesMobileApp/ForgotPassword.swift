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
    
    @State private var emailError = ""
    var body: some View {
        NavigationView {
            ZStack {
                
                Color.blue
                    .edgesIgnoringSafeArea(.all)
                 
                Circle()
                    .scale(2.2)
                    .foregroundColor(.white.opacity(0.3))
                    .offset(y: -130)
                  
                Circle()
                    .scale(1.8)
                    .foregroundColor(.white)
                    .offset(y: -130)
                 
                VStack {
                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)){
                        Text("Back to Home")
                    }
                    .offset(x: -120, y: -220)
                    .font(.title2)
                    
                    
                    Divider()
                        .overlay(Color.black)
                        .offset(y: -220)
                     
                    
                    Text("Forgor Password Page")
                        .offset(y: -200)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    Text("Please Enter the email associated with your account. We will then direct you to a page to reset your password.")
                        .offset(x: 0, y: -150)
                        .multilineTextAlignment(.center)
                        .frame(width: 300)
                    
                    Text("Email")
                        .offset(x: -150, y: -90)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .textInputAutocapitalization(.never)
                        .frame(width: 350, height: 50)
                        .background(Color.black.opacity(0.04))
                        .cornerRadius(5)
                        .border(.red, width: CGFloat(wrongUsername))
                        .offset(x: 0, y: -80)
                    
                        .overlay(
                            Text(emailError)
                                .foregroundColor(.red)
                                .offset(x: -125, y: -40)
                        )
                    
                    Button ("Reset Password"){
                        authenticateEmail(username: username)
                    }
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .offset(y: -50)
                    
                    NavigationLink(destination: ResetPassword().navigationBarBackButtonHidden(true), isActive: $resetPassword){
                        
                    }
                    
                    
                }
                .navigationBarHidden(true)
            }
        }
    }
    
    func authenticateEmail(username: String){
//Needs database functionality
        //If username is in databse
        if(username.lowercased() == "testuser@test.com"){
            wrongUsername = 0
            emailError = ""
            resetPassword = true
        }
        else{
            wrongUsername = 2
            emailError = "Invalid Email"
        }
    }
}

#Preview {
    ForgotPassword()
}
