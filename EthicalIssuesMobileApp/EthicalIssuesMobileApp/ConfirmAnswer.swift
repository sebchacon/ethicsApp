//
//  ConfirmAnswer.swift
//  EthicalIssuesMobileApp
//
//  Created by Owen Tushan on 11/5/24.
//

import SwiftUI

struct ConfirmAnswer: View {
    @State private var For = "Write me an ethical response in favor of the question: "
    @State private var Against = "Write me an ethical response against the question: "
    @State private var Neutral = "Write me a neutral ethical response for the question: "
    
    @State private var finalQuestion = ""
    var question: String
    var body: some View {
        NavigationView {
            VStack {
                Text("How would you like the AI to answer your question?")
                    .offset(y: -110)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .frame(width: 350)
                
                ScrollView {
                    Text(question)
                        .frame(width: 200, alignment: .leading)
                        
                }
                .frame(height: 130)
                .padding()
                .border(.black)
                .offset(x: 0, y: -50)
                
                Divider()
                    .overlay(Color.black)
                    .offset(y: -440)
                
                NavigationLink(destination: AskQuestion().navigationBarBackButtonHidden(true)){
                    
                    Image(systemName: "plus.bubble")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 35.0, height: 35.0)
                    
                }
                //.offset(x: -140, y: -390)
                .offset(x: -150, y: -500)
                
                
                
                Divider()
                    .overlay(Color.black)
                    //.offset(y: 75)
                    .offset(y: -25)
                
                Divider()
                    .overlay(Color.black)
                    //.offset(y: 190)
                    .offset(y: 100)
                
                HStack {
                    
                    
                    NavigationLink(destination: GetAnswer(finalQuestion: For + question).navigationBarBackButtonHidden(true)){
                        //finalQuestion = For + question
                        HStack{
                            Text("For")
                                .foregroundColor(.white)
                                .frame(width: 100, height: 50)
                                .background(Color.green)
                                .cornerRadius(10)
                        }
                    }
                    //.offset(x: -20, y: 100)
                    .offset(x: -20, y: 0)
                    
                    
                    NavigationLink(destination: GetAnswer(finalQuestion: Neutral + question).navigationBarBackButtonHidden(true)){
                        //finalQuestion = For + question
                        HStack{
                            Text("Neutral")
                                .foregroundColor(.white)
                                .frame(width: 100, height: 50)
                                .background(Color.yellow)
                                .cornerRadius(10)
                        }
                    }
                    //.offset(x: 3, y: 100)
                    .offset(x: 3, y: 0)
                    
                    
                    NavigationLink(destination: GetAnswer(finalQuestion: Against + question).navigationBarBackButtonHidden(true)){
                        //finalQuestion = For + question
                        HStack{
                            Text("Against")
                                .foregroundColor(.white)
                                .frame(width: 100, height: 50)
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                    }
                    //.offset(x: 20, y: 100)
                    .offset(x: 20, y: -0)
                    
                    
                }
                
                /*
                NavigationLink(destination: ChatHistory().navigationBarBackButtonHidden(true)){
                    Text("View History")
                }
                .foregroundColor(.black)
                .padding()
                .border(.black)
                .offset(x: 0, y: 225)
                 
                 */
                
            }
        }
    }

}


 #Preview {
     ConfirmAnswer(question: "Your Answer Here...")
 }
