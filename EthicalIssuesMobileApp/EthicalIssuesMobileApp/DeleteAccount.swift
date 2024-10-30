//
//  DeleteAccount.swift
//  EthicalIssuesMobileApp
//
//  Created by Owen Tushan on 10/29/24.
//

import SwiftUI

struct DeleteAccount: View {
    //Our variables for the text fields
    @State private var email = ""
    @State private var passwordOne = ""
    @State private var passwordTwo = ""
    
    //our variables to make sure email/password fields are filled out correctly
    @State private var usedEmail = 0
    @State private var passwordDNM = 0
    @State private var passwordMatch = false
    @State private var emailAlreadyUsed = false
    @State private var bothCasesTrue = false
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AskQuestion().navigationBarBackButtonHidden(true)){
                    Text("Back to Ask Question")
                }
                .offset(x: -80, y: -170)
                .font(.title2)
                
                Divider()
                    .overlay(Color.black)
                    .offset(y: -160)
                
                Text("Delete Account")
                    .offset(y: -150)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("Enter your credentials below to delete your account")
                    .offset(x: 0, y: -100)
                    .multilineTextAlignment(.center)
                
                Text("Enter email")
                    .offset(x: -125, y: -50)
                Text("Enter Password")
                    .offset(x: -110, y: 55)
                Text("Re-enter Password")
                    .offset(x: -97, y: 160)
                
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(usedEmail))
                    .offset(x: 0, y: -90)
                
                SecureField("Password", text: $passwordOne)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(passwordDNM))
                    .offset(x: 0, y: -20)
                
                SecureField("Password", text: $passwordTwo)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(passwordDNM))
                    .offset(x: 0, y: 50)
                
                Button ("Delete Your Account"){
                    deleteAccount(email: email, passwordOne: passwordOne, passwordTwo: passwordTwo)
                }
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .offset(y: 100)
                
                NavigationLink(destination: DeletedAccMessage().navigationBarBackButtonHidden(true), isActive: $bothCasesTrue){
                    
                }
                
            }
        }
    }
    
    func deleteAccount(email: String, passwordOne: String, passwordTwo: String){
        
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
        if(email.lowercased() == "testuser@test.com"){
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
            //delete email and password from database
            bothCasesTrue = true
        }
    }
}

#Preview {
    DeleteAccount()
}
