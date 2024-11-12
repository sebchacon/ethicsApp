//
//  ContentView.swift
//  EthicalIssuesMobileApp
//
//  Created by Owen Tushan on 10/28/24.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showLoginScreen = false
    
    @State private var emailError = ""
    @State private var passwordError = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .edgesIgnoringSafeArea(.all)
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.1))
                Circle()
                    .scale(1.5)
                    .foregroundColor(.white)
                
                VStack {
                    Text("Get your Ethical Questions Answered")
                        .offset(y: -70)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .textInputAutocapitalization(.never)
                        .frame(width: 250, height: 50)
                        .background(Color.black.opacity(0.04))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                        .offset(y: -50)
                    
                        .overlay(
                            Text(emailError)
                                .foregroundColor(.red)
                                .offset(x: -60, y: -90)
                            
                        )
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .textInputAutocapitalization(.never)
                        .frame(width: 250, height: 50)
                        .background(Color.black.opacity(0.04))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                        .offset(y: -40)
                    
                        .overlay(
                            Text(passwordError)
                                .foregroundColor(.red)
                                .offset(x: -60, y: -0)
                        )
                    
                    
                    Button ("Login"){
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 100, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .offset(y: -20)
                    
                    
                    //this NavigationLink works for the Login button
                    NavigationLink(destination: AskQuestion().navigationBarBackButtonHidden(true), isActive: $showLoginScreen){}
                    
                    
                    
                    NavigationLink(destination: ForgotPassword().navigationBarBackButtonHidden(true)){
                        Text("Forgot Password?")
                    }
                    .offset(x: -81, y: 15)
                    
                    NavigationLink(destination: CreateAccount().navigationBarBackButtonHidden(true)){
                        HStack {
                            Text("Create Account")
                        }
                    }

                    .offset(x: -91, y: 40)
                    
                    NavigationLink(destination: AboutUs().navigationBarBackButtonHidden(true)){
                        HStack{
                            Text("About Us")
                        }
                    }
                    .offset(x: -114, y: 65)
                    

                }

            }
            .navigationBarHidden(true)
        }
        
    }
    
    func authenticateUser(username: String, password: String) {
//Need to insert our database logic here
        
        if username.lowercased() == "testuser@test.com"{
            wrongUsername = 0
            emailError = ""
            //set to 0 because nothing is wrong
            if password == "Testpassword"{
                wrongPassword = 0
                passwordError = ""
                showLoginScreen = true
            }
            else{
                wrongPassword = 2
                passwordError = "Invalid Password"
                //set to 2 so the password box turns red
            }
        }
        else{
            wrongUsername = 2
            emailError = "Invalid Username"
            //set to 2 so the username box turns red
        }
        
        /*
        AuthService.authenticate(username: username, password: password) { result in
            switch result {
            case .success(let isSuccess):
                if isSuccess {
                // Login successful, show the next screen
                    showLoginScreen = true
                    emailError = ""
                    passwordError = ""
                    wrongUsername = 0
                    wrongPassword = 0
                }
                else {
                // Invalid credentials, show error messages
                    wrongUsername = 2
                    wrongPassword = 2
                    emailError = "Invalid Username"
                    passwordError = "Invalid Password"
                }
            case .failure(let error):
            // Network error, show a generic error message
                emailError = "Server connection error"
                passwordError = ""
                wrongUsername = 2
                wrongPassword = 2
            }
        }
        */
    }
}

class AuthService {
    static func authenticate(username: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        // Replace with your server URL
        guard let url = URL(string: "http://localhost:12345") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Create a dictionary of the username and password
        let body = [
            "username": username,
            "password": password
        ]
        
        // Convert the dictionary to JSON data
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(body)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }
        
        // Make the request to the server
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Check the response status code
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                // Success
                completion(.success(true))
            } else {
                // Failure, invalid username or password
                completion(.success(false))
            }
        }
        
        task.resume()
    }
}

#Preview {
    ContentView()
}
