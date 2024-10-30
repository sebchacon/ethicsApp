//
//  ContentView.swift
//  EthicalIssuesMobileApp
//
//  Created by Owen Tushan on 10/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showLoginScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .edgesIgnoringSafeArea(.all)
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.1))
                Circle()
                    .scale(1.5)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Get your Ethical Questions Answered")
                        .offset(y: -70)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 250, height: 50)
                        .background(Color.black.opacity(0.04))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                        .offset(y: -50)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 250, height: 50)
                        .background(Color.black.opacity(0.04))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                        .offset(y: -40)
                    
                    Button ("Login"){
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .offset(y: -20)
                    
                    //this NavigationLink works for the Login button
                    NavigationLink(destination: AskQuestion().navigationBarBackButtonHidden(true), isActive: $showLoginScreen){
                        
                    }
                    
                    
                    NavigationLink(destination: ForgotPassword().navigationBarBackButtonHidden(true)){
                        Text("Forgot Password?")
                    }
                    .offset(x: -81, y: 15)
                    
                    NavigationLink(destination: CreateAccount().navigationBarBackButtonHidden(true)){
                        HStack {
                            Text("Create Account")
                        }
                    }

                    .offset(x: -91, y: 40)
                    
                    NavigationLink(destination: AboutUs().navigationBarBackButtonHidden(true)){
                        HStack{
                            Text("About Us")
                        }
                    }
                    .offset(x: -114, y: 65)
                    

                }

            }
            .navigationBarHidden(true)
        }
        
    }
    
    func authenticateUser(username: String, password: String){
//Need to insert our database logic here
        if username.lowercased() == "testuser@test.com"{
            wrongUsername = 0
            //set to 0 because nothing is wrong
            if password.lowercased() == "testpassword"{
                wrongPassword = 0
                showLoginScreen = true
            }
            else{
                wrongPassword = 2
                //set to 2 so the password box turns red
            }
        }
        else{
            wrongUsername = 2
            //set to 2 so the username box turns red
        }
        
    }
}

#Preview {
    ContentView()
}
