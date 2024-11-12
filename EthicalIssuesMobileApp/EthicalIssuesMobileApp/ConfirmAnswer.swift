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
            ZStack {
   
//Background colors
                /*
                Rectangle()
                    .size(width: 1000, height: 400)
                    .foregroundColor(.blue.opacity(0.3))
                    .offset(y: 646)
                 */
                Rectangle()
                    .size(width: 1000, height: 467)
                    .foregroundColor(.blue.opacity(0.7))
                    //.offset(y: 46)
                    .offset(y: -420)
                Rectangle()
                    .size(width: 1000, height: 134)
                    .foregroundColor(.blue.opacity(0.7))
                    .offset(y: 513)
                
                
                Rectangle()
                    .size(width: 1000, height: 1000)
                    .foregroundColor(.blue.opacity(0.4))
                    .offset(y: 647)
                 
                 
                
                
                
//Lines for dividers
                Rectangle()
                    .size(width: 1000, height: 1)
                    .foregroundColor(.black)
                    .offset(y: 46)
                Rectangle()
                    .size(width: 1000, height: 1)
                    .foregroundColor(.black)
                    .offset(y: 646)
                Rectangle()
                    .size(width: 1000, height: 1)
                    .foregroundColor(.black)
                    .offset(y: 513)
                
//These lines are the question outline
                RoundedRectangle(cornerRadius: 10)
                    .size(width: 230, height: 160)
                    .fill(.black)
                    .offset(x: 85, y: 268)
                
                RoundedRectangle(cornerRadius: 10)
                    .size(width: 228, height: 158)
                    .fill(.white)
                    .offset(x: 86, y: 269)
                
//----------
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
                    //.border(.black)
                    .offset(x: 0, y: -50)
                    
                    Divider()
                        .overlay(Color.black)
                        .offset(y: -440)
                    
                    NavigationLink(destination: AskQuestion().navigationBarBackButtonHidden(true)){
                        
                        Image(systemName: "plus.bubble")
                            .resizable()
                            //.foregroundColor(.black)
                            .foregroundColor(.white)
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
                                    //.background(Color.green)
                                    .background(Color.gray.opacity(0.8))
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
                                    //.background(Color.yellow)
                                    .background(Color.gray.opacity(0.8))
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
                                    //.background(Color.red)
                                    .background(Color.gray.opacity(0.8))
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
}


 #Preview {
     ConfirmAnswer(question: "Your Answer Here...")
 }
