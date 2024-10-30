//
//  CreateAccount.swift
//  EthicalIssuesMobileApp
//
//  Created by Owen Tushan on 10/28/24.
//

import SwiftUI

struct CreateAccount: View {
    //Our variables for the text fields
    @State private var email = ""
    @State private var passwordOne = ""
    @State private var passwordTwo = ""
    
    //our variables that will go into the database
    @State private var newEmail = ""
    @State private var newPassword = ""
    
    //our variables to make sure email/password fields are filled out correctly
    @State private var usedEmail = 0
    @State private var passwordDNM = 0
    @State private var passwordMatch = false
    @State private var emailAlreadyUsed = false
    @State private var bothCasesTrue = false
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)){
                    Text("Back to Home")
                }
                .offset(x: -120, y: -160)
                .font(.title2)
                
                Divider()
                    .overlay(Color.black)
                    .offset(y: -150)
                
                Text("Create Your Account")
                    .offset(y: -150)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .multilineTextAlignment(.center)
                
                Text("Enter email")
                    .offset(x: -125, y: -90)
                Text("Enter Password")
                    .offset(x: -110, y: 15)
                Text("Re-enter Password")
                    .offset(x: -97, y: 120)
                
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(usedEmail))
                    .offset(x: 0, y: -130)
                
                SecureField("Password", text: $passwordOne)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(passwordDNM))
                    .offset(x: 0, y: -60)
                
                SecureField("Password", text: $passwordTwo)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(passwordDNM))
                    .offset(x: 0, y: 10)
                
                Button ("Create New Account"){
                    createNewAccount(email: email, passwordOne: passwordOne, PasswordTwo: passwordTwo)
                }
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .offset(y: 40)
                
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true), isActive: $bothCasesTrue){
                    
                }
                
            }
        }
    }
    
    func createNewAccount(email: String, passwordOne: String, PasswordTwo: String){
        
        //make sure passwords match
        if(passwordOne == passwordTwo && passwordOne != ""){
            passwordDNM = 0
            passwordMatch = true
        }
        else{
            passwordDNM = 2
            passwordMatch = false
        }
        
//Needs database functionality
        //Check to make sure email isn't already in use
        if(email.lowercased() != "testuser@test.com" && email.lowercased() != ""){
            usedEmail = 0
            emailAlreadyUsed = true
        }
        else{
            usedEmail = 2
            emailAlreadyUsed = false
        }
        
//Needs database functionality
        //if both cases passed, set bothCasesTrue to true, and enter credentials into database
        if(passwordMatch == true && emailAlreadyUsed == true){
            newEmail = email.lowercased()
            newPassword = passwordOne
            bothCasesTrue = true
        }
        
        
        
    }
}

#Preview {
    CreateAccount()
}
