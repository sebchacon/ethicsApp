//
//  GetAnswer.swift
//  EthicalIssuesMobileApp
//
//  Created by Owen Tushan on 10/28/24.
//



/*
        finalQuestion is what needs to be put into ChatGPT.
        It follows the format "Write me an ethical response for/against
        the following question: ......
*/


import SwiftUI

struct GetAnswer: View {
    //@State static var finalQuestion = ""
    @State private var response = ""
    var finalQuestion: String
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
                    Text("Get Answer Here...")
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
        }
    }
    
    func generateResponse(finalQuestion: String){
        response = "Get Answer here..."
    }
}

#Preview {
    //GetAnswer(finalQuestion: "Your Question Here...")
    GetAnswer(finalQuestion: "This is a long question. " + String(repeating: "More text. ", count: 20))
}
