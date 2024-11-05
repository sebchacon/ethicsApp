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
    
//These next lines are for the random question feature
    @State static var rand1 = "What is the ethicality behind the creation of intelligent robots in relation to the job market?"
    
    @State static var rand2 = "What is the ethicality behind hacking into a foreign government in the context of war or terrorism?"
    
    @State static var rand3 = "Is it ethical to reverse-engineer or bypass software protections to use a product in unintended ways?"
    
    @State static var rand4 = "Is it ethical for governments to use mass surveillence in the name of national security?"
    
    let randomInt = Int.random(in: 0..<4)
    let randomQuestion = [rand1, rand2, rand3, rand4]
//---------------------------------------------------------
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(destination: SettingsPage().navigationBarBackButtonHidden(true)){
                        //Text("Settings")
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 35.0, height: 35.0)
                    }
                    .offset(x: 170, y: -230)
                    
                     NavigationLink(destination: ConfirmAnswer(question: randomQuestion[randomInt]).navigationBarBackButtonHidden(true)){
                         //Text("Random Ethical Question")
                         Image(systemName: "dice")
                             .resizable()
                             .foregroundColor(.black)
                             .frame(width: 35.0, height: 35.0)
                             .help("Random Ethical Question")
                     }
                     .offset(x: -170, y: -230)
                     
                }
                
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
                
                
                NavigationLink(destination: ChatHistory().navigationBarBackButtonHidden(true)){
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
