//
//  ContentView.swift
//  myLearningSwiftUI
//
//  Created by Julian González on 16/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var showLogin = false
    @State var showCalculator = false
    
    var body: some View {
        VStack (spacing: 10) {
            Button(action: {
                showLogin.toggle()
            }, label: {
                Text("Login")
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(5)
            })
            
            Button(action: {
                showCalculator.toggle()
            }, label: {
                Text("Calculator")
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(5)
            })
            
            
            
            Text("Welcome, My Learninig Judagonsa")
                .padding()
        }.navigationTitle("My Learning")
        .padding(.horizontal, 20)
        
        .fullScreenCover(isPresented: $showLogin, content: {
            Login()
        })
        .fullScreenCover(isPresented: $showCalculator, content: {
            Calculator()
        })
    }
    
    func openLogin(){
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
