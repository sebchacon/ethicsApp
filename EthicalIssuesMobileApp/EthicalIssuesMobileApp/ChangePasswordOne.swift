//
//  ChangePasswordOne.swift
//  EthicalIssuesMobileApp
//
//  Created by Owen Tushan on 10/29/24.
//

import SwiftUI

struct ChangePasswordOne: View {
    @State private var email = ""
    @State private var wrongEmail = 0
    @State private var resetPassword = false
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AskQuestion().navigationBarBackButtonHidden(true)){
                    Text("Back to Ask Question")
                }
                .offset(x: -80, y: -210)
                .font(.title2)
                
                Divider()
                    .overlay(Color.black)
                    .offset(y: -200)
                
                Text("Change Password")
                    .offset(y: -200)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .multilineTextAlignment(.center)
                
                Text("Please Enter the email associated with your account. We will then direct you to a page to change your password.")
                    .offset(x: 0, y: -150)
                    .multilineTextAlignment(.center)
                
                Text("email")
                    .offset(x: -150, y: -90)
                
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(5)
                    .border(.red, width: CGFloat(wrongEmail))
                    .offset(x: 0, y: -80)
                
                Button ("Change Password"){
                    authenticateEmail(email: email)
                }
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .offset(y: -60)
                
                NavigationLink(destination: ChangePasswordTwo().navigationBarBackButtonHidden(true), isActive: $resetPassword){
                    
                }
                
                
            }
            .navigationBarHidden(true)
        }
    }
    
    func authenticateEmail(email: String){
//Needs database functionality
        //If username is in databse
        if(email.lowercased() == "testuser@test.com"){
            wrongEmail = 0
            resetPassword = true
        }
        else{
            wrongEmail = 2
        }
    }
}

#Preview {
    ChangePasswordOne()
}
