//
//  GetAnswer.swift
//  EthicalIssuesMobileApp
//
//  Created by Owen Tushan on 10/28/24.
//



/*
        finalQuestion is what needs to be put into ChatGPT.
        It follows the format "Write me an ethical response for/against
        the following question: (user input here)
*/


import SwiftUI

struct GetAnswer: View {
    var finalQuestion: String
    
    @State private var answer = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                ScrollView {
                    Text(finalQuestion)
                        .multilineTextAlignment(.leading)
                        .frame(width: 200, alignment: .leading)
                }
                .frame(height: 130)
                .padding()
                .border(.black)
                .offset(x: 80, y: -50)
                
                ScrollView {
                    Text(answer)
                        .frame(width: 200, alignment: .leading)
                }
                .frame(height: 130)
                .padding()
                .border(.black)
                .offset(x: -80, y: -0)
                
                Divider()
                    .overlay(Color.black)
                    .offset(y: -440)
                    //.offset(y: -590)
                
                NavigationLink(destination: AskQuestion().navigationBarBackButtonHidden(true)){
                    
                    Image(systemName: "plus.bubble")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 35.0, height: 35.0)
                    
                }
                .offset(x: -140, y: -510)
                //.offset(x: -140, y: -660)
                
                
                Divider()
                    .overlay(Color.black)
                    .offset(y: -30)
                    //.offset(y: -200)
                
                
                NavigationLink(destination: ChatHistory().navigationBarBackButtonHidden(true)){
                    Text("View History")
                }
                .foregroundColor(.black)
                .padding()
                .border(.black)
                .offset(x: 0, y: 0)
                //.offset(x: 0, y: -170)
                
            }
            .onAppear {
                generateResponse(finalQuestion: finalQuestion)
            }
        }
    }
    
    func generateResponse(finalQuestion: String){
        
        /*
         Here is where the ChatGPT stuff needs to go.
         
         finalQuestion is the question that ChatGPT needs to answer. It is all good to go, so no formatting should be necessary.
         
         self.answer is where the ChatGPT output needs to go, so just set self.answer to the output
         
         */
        self.answer = "Get Answer Here..."
    }
}

#Preview {
    GetAnswer(finalQuestion: "Your Question Here... (Click and drag to scroll)")
    }
