//
//  AskQuestion.swift
//  EthicalIssuesMobileApp
//
//  Created by Owen Tushan on 10/28/24.
//

import SwiftUI

struct AskQuestion: View {
    @State private var question = ""
    @State private var isNotBlank = false
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SettingsPage().navigationBarBackButtonHidden(true)){
                    //Text("Settings")
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 35.0, height: 35.0)
                }
                .offset(x: 150, y: -230)
                .font(.title2)
                
                
                Divider()
                    .overlay(Color.black)
                    .offset(y: -220)
                
                Text("Ask Your Ethical Dilemma")
                    .offset(y: -150)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .multilineTextAlignment(.center)
                
                TextField("Enter Text Here...", text: $question)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(20)
                    .offset(x: 0, y: -30)
                
                Button ("Submit"){
                    askQuestion(question: question)
                }
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .offset(y: 0)
                
                
                NavigationLink(destination: ConfirmAnswer(question: question).navigationBarBackButtonHidden(true), isActive: $isNotBlank){
                    
                }
                
                
                NavigationLink(destination: ChatHistory().navigationBarBackButtonHidden()){
                    HStack{
                        Text("View Chat History")
                            .padding()
                            .frame(width: 350, height: 30)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                            
                    }
                   
                }
                .offset(x: 0, y: 50)
                
                
            }
        }
    }
    
    func askQuestion(question: String){
        if(question != ""){
            isNotBlank = true
        }
    }
}

#Preview {
    AskQuestion()
}
