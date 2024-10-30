//
//  ChangePasswordTwo.swift
//  EthicalIssuesMobileApp
//
//  Created by Owen Tushan on 10/29/24.
//

import SwiftUI

struct ChangePasswordTwo: View {
    @State private var passwordOne = ""
    @State private var passwordTwo = ""
    @State private var passwordDNM = 0
    @State private var passwordMatch = false
    
    //This variable is unused, but would be used with database functionality
    @State private var newPassword = ""
    var body: some View {
        NavigationView {
            VStack {
                Text("Change Your Password")
                    .offset(y: -200)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .multilineTextAlignment(.center)
                
                SecureField("Password", text: $passwordOne)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(passwordDNM))
                    .offset(x: 0, y: -80)
                
                SecureField("Password", text: $passwordTwo)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(passwordDNM))
                    .offset(x: 0, y: 0)
                
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
        if(passwordOne == passwordTwo && passwordOne != ""){
            passwordDNM = 0
            newPassword = passwordOne
            //insert newPassword into database
            passwordMatch = true
        }
        else{
            passwordDNM = 2
        }
    }
}

#Preview {
    ChangePasswordTwo()
}
