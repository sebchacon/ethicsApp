//
//  ResetPassword.swift
//  EthicalIssuesMobileApp
//
//  Created by Owen Tushan on 10/28/24.
//

import SwiftUI

struct ResetPassword: View {
    @State private var passwordOne = ""
    @State private var passwordTwo = ""
    @State private var passwordDNM = 0
    @State private var passwordMatch = false
    
    @State private var passwordError = ""
    
    //This variable is unused, but would be used with database functionality
    @State private var newPassword = ""
    var body: some View {
        NavigationView {
            VStack {
                Text("Reset Your Password")
                    .offset(y: -200)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .multilineTextAlignment(.center)
                
                SecureField("Password", text: $passwordOne)
                    .padding()
                    .textInputAutocapitalization(.never)
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(passwordDNM))
                    .offset(x: 0, y: -80)
                
                SecureField("Password", text: $passwordTwo)
                    .padding()
                    .textInputAutocapitalization(.never)
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(passwordDNM))
                    .offset(x: 0, y: 0)
                
                    .overlay(
                        Text(passwordError)
                            .foregroundColor(.red)
                            .offset(x: -60, y: -80)
                    )
                
                Text("Enter New Password")
                    .offset(x: -93, y: -230)
                
                Text("Re-enter New Password")
                    .offset(x: -80, y: -110)
                
                Button ("Create New Password"){
                    authenticatePasswordMatch(passwordOne: passwordOne, passwordTwo: passwordTwo)
                }
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .offset(y: -30)
                
                NavigationLink(destination: ChangePassMessage().navigationBarBackButtonHidden(true), isActive: $passwordMatch){
                    
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    func authenticatePasswordMatch(passwordOne: String, passwordTwo: String){
//Needs database functionality
        if(passwordOne != "" || passwordTwo != ""){  //make sure passwords aren't blank
            if(passwordOne == passwordTwo){         //make sure passwords match
                passwordDNM = 0
                passwordError = ""
                newPassword = passwordOne
                //insert newPassword into database
                passwordMatch = true
            }
            else{           //passwords do not match
                passwordDNM = 2
                passwordError = "Passwords do not match        "
            }
        }
        else{           //passwords are blank
            passwordDNM = 2
            passwordError = "Please enter a new password"
        }
    }
}

#Preview {
    ResetPassword()
}
