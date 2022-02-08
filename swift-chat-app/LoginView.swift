//
//  ContentView.swift
//  swift-chat-app
//
//  Created by Geovanny Quiroz on 11/11/21.
//

import SwiftUI

struct LoginView: View {
    
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack (spacing: 10) {
                    Picker(selection: $isLoginMode) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    } label: {
                        
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding()
                    
                    if !isLoginMode {
                        Button {
                        } label: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 64.0))
                                .padding()
                        }
                    }
                    
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .background(Color.white)
                        .padding(12)
                    SecureField("Password", text: $password)
                        .background(Color.white)
                        .padding(12)
                    
                    
                    Button {
                        handleActionButton()
                        
                    }label: {
                        HStack {
                            Spacer()
                            Text(!isLoginMode ?  "Create Account" : "Log in")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .font(.system(size: 14, weight: .semibold, design: .default))
                            Spacer()
                        }.background(Color.blue)
                    }
                    
                }.padding()
                
            }
            .background(Color.init(.sRGB, white: 0, opacity: 0.05)
                            .ignoresSafeArea())
            .navigationTitle(isLoginMode ?  "Log in" : "Create Account")
        }
    }
    
    private func handleActionButton() {
        if isLoginMode {
            print("Should login into Firebase")
        } else {
            print("Should create new account")
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
