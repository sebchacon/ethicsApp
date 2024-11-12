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
import OpenAI

struct GetAnswer: View {
    var finalQuestion: String
    
    @State private var answer = ""
    
//---------------------------------------------------
//Replace 'temp' with the API key
    let openAI = OpenAI(apiToken: "temp")
//---------------------------------------------------

    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .foregroundColor(.blue.opacity(0.7))
                    .offset(y: -715)
                Rectangle()
                    .foregroundColor(.blue.opacity(0.7))
                    .offset(y: 525)
                
                Circle()
                    .scale(1.705)
                    .foregroundColor(.black)
                    .offset(y: -50)
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white)
                    .offset(y: -50)
                
                Text("Your Answer")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .multilineTextAlignment(.center)
                    .offset(y: -330)
                
                
//These rectangles are the dividers on screen
                
                Rectangle()
                    .size(width: 1000, height: 1)
                    .offset(y: 524)
                
                
                
//These rectangles outline the user question
                RoundedRectangle(cornerRadius: 10)
                    .size(width: 230, height: 160)
                    .fill(.black)
                    .offset(x: 165, y: 113)
                
                RoundedRectangle(cornerRadius: 10)
                    .size(width: 228, height: 158)
                    .fill(.white)
                    .offset(x: 166, y: 114)
                
//These rectangles outline the AI response
                RoundedRectangle(cornerRadius: 10)
                    .size(width: 230, height: 160)
                    .fill(.black)
                    .offset(x: 5, y: 334)
                
                RoundedRectangle(cornerRadius: 10)
                    .size(width: 228, height: 158)
                    .fill(.white)
                    .offset(x: 6, y: 335)
                
//---------
                    
                VStack {
                    
                    ScrollView {
                        Text(finalQuestion)
                            .multilineTextAlignment(.leading)
                            .frame(width: 200, alignment: .leading)
                    }
                    .frame(height: 130)
                    .padding()
                    //.border(.black)
                    .offset(x: 80, y: -62)
                    
                    ScrollView {
                        Text(answer)
                            .frame(width: 200, alignment: .leading)
                    }
                    .frame(height: 130)
                    .padding()
                    //.border(.black)
                    .offset(x: -80, y: -12)
                    
                    
                    
                    
                    NavigationLink(destination: AskQuestion().navigationBarBackButtonHidden(true)){
                        
                        Image(systemName: "plus.bubble")
                            .resizable()
                            .foregroundColor(.white)
                            //.foregroundColor(.black)
                            .frame(width: 35.0, height: 35.0)
                        
                    }
                    .offset(x: -160, y: -525)
                    //.offset(x: -140, y: -660)
                    
                    
                    
                    
                    
                    NavigationLink(destination: ChatHistory().navigationBarBackButtonHidden(true)){
                        Text("View History")
                    }
                    .foregroundColor(.black)
                    .padding()
                    .border(.black)
                    .offset(x: 0, y: 10)
                    //.offset(x: 0, y: -170)
                    
                }
                .onAppear{
                    Task{
                        await generateResponse(finalQuestion: finalQuestion)
                    }
                    
                }
            }
        }
    }
    
    
    func generateResponse(finalQuestion: String) async {
        
        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
            
        let messages = [
            ChatMessage(role: "system", content: "You are a helpful assistant."),
            ChatMessage(role: "user", content: finalQuestion)
            ]
            
        let request = ChatCompletionRequest(
                model: "gpt-3.5-turbo",   // Or "gpt-4" depending on the model you're using
                messages: messages
            )
            
        // Set up the request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
//---------------------------------------------------
//Replace 'temp' with the API key, leave everything else including 'Bearer' the same
        urlRequest.addValue("Bearer temp", forHTTPHeaderField: "Authorization")
//---------------------------------------------------

        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
        do {
            let encoder = JSONEncoder()
            urlRequest.httpBody = try encoder.encode(request)
                
            // Make the request
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
                
            // Handle the response
            let decoder = JSONDecoder()
            let chatResponse = try decoder.decode(ChatCompletionResponse.self, from: data)
                
            // Extract and set the response text
            if let message = chatResponse.choices.first {
                DispatchQueue.main.async {
                    self.answer = message.message.content.trimmingCharacters(in: .whitespacesAndNewlines)
                }
            }
        }
        catch {
            DispatchQueue.main.async {
                self.answer = "Error generating response: \(error.localizedDescription)"
            }
            print("Error: \(error)")
        }
        
    }
}

struct ChatCompletionRequest: Codable {
    let model: String
    let messages: [ChatMessage]
    let max_tokens: Int
    let temperature: Double
    let top_p: Double
    let frequency_penalty: Double
    let presence_penalty: Double

    init(model: String, messages: [ChatMessage], max_tokens: Int = 250, temperature: Double = 0.7, top_p: Double = 1.0, frequency_penalty: Double = 0, presence_penalty: Double = 0) {
        self.model = model
        self.messages = messages
        self.max_tokens = max_tokens
        self.temperature = temperature
        self.top_p = top_p
        self.frequency_penalty = frequency_penalty
        self.presence_penalty = presence_penalty
    }
}

// Define the structure for each message
struct ChatMessage: Codable {
    let role: String
    let content: String
}

// Define the response structure
struct ChatCompletionResponse: Codable {
    struct Choice: Codable {
        let message: ChatMessage
        let finish_reason: String
    }

    let choices: [Choice]
}

class ChatController: ObservableObject{
    @Published var messages: [Message] = [.init(content: "Get Message Here...", isUser: true)]
    //@Published var message:
}

struct Message: Identifiable {
    var id: UUID = .init()
    var content: String
    var isUser: Bool
}



//---------------------------------------------
#Preview {
    GetAnswer(finalQuestion: "Your Question Here... (Click and drag to scroll)")
    }
