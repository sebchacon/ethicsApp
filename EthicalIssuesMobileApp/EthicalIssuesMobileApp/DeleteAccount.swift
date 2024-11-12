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
    
    @State private var emailError = ""
    @State private var passwordError = ""
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AskQuestion().navigationBarBackButtonHidden(true)){
                    Text("Back to Ask Question")
                }
                .offset(x: -80, y: -160)
                .font(.title2)
                
                Divider()
                    .overlay(Color.black)
                    .offset(y: -150)
                
                Text("Delete Account")
                    .offset(y: -140)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("Enter your credentials below to delete your account")
                    .frame(width: 300)
                    .offset(x: 0, y: -100)
                    .multilineTextAlignment(.center)
                
                Text("Enter email")
                    .offset(x: -125, y: -60)
                Text("Enter Password")
                    .offset(x: -110, y: 45)
                Text("Re-enter Password")
                    .offset(x: -97, y: 150)
                
                TextField("Email", text: $email)
                    .padding()
                    .textInputAutocapitalization(.never)
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(usedEmail))
                    .offset(x: 0, y: -100)
                
                    .overlay(
                        Text(emailError)
                            .foregroundColor(.red)
                            .offset(x: -92, y: -58)
                    )
                
                SecureField("Password", text: $passwordOne)
                    .padding()
                    .textInputAutocapitalization(.never)
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(passwordDNM))
                    .offset(x: 0, y: -30)
                
                SecureField("Password", text: $passwordTwo)
                    .padding()
                    .textInputAutocapitalization(.never)
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(passwordDNM))
                    .offset(x: 0, y: 40)
                
                    .overlay(
                        Text(passwordError)
                            .foregroundColor(.red)
                            .offset(x: -80, y: -45)
                    )
                
                Button ("Delete Your Account"){
                    deleteAccount(email: email, passwordOne: passwordOne, passwordTwo: passwordTwo)
                }
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .offset(y: 90)
                
                NavigationLink(destination: DeletedAccMessage().navigationBarBackButtonHidden(true), isActive: $bothCasesTrue){
                    
                }
                
            }
        }
    }
    
    func deleteAccount(email: String, passwordOne: String, passwordTwo: String){
        
        //make sure passwords match
        if(passwordOne != "" || passwordTwo != ""){
            if(passwordOne == passwordTwo){
                passwordDNM = 0
                passwordError = ""
                passwordMatch = true
            }
            else{           //passwords do not match
                passwordDNM = 2
                passwordError = "Passwords do not match"
                passwordMatch = false
            }
        }
        else{               //passwords are blank
            passwordDNM = 2
            passwordError = "Please enter a password"
        }
        
//Needs database functionality
        //Check to make sure email isn't already in use
        if(email.lowercased() != ""){
            if(email.lowercased() == "testuser@test.com"){
                usedEmail = 0
                emailError = ""
                emailAlreadyUsed = true
            }
            else{
                usedEmail = 2
                emailError = "Invalid email               "
                emailAlreadyUsed = false
            }
        }
        else{
            usedEmail = 2
            emailError = "Please enter an email"
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
