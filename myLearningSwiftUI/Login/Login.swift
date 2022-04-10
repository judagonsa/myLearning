//
//  Login.swift
//  myLearningSwiftUI
//
//  Created by Julian González on 16/09/21.
//

import SwiftUI

struct Login: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var username = ""
    @State var password = ""
    @ObservedObject var loginVC = LoginVC()
    @State var validUsername = false
    
    @State var registerUser = ""
    @State var loginUser = ""
    
    @State var showProfile = false
    
    var body: some View {
        VStack{
            Spacer()
            
            VStack  {
                
                TextField("Usuario", text: $username)
                    .onChange(of: username) { newUser in
                        validUsername = loginVC.validateUserName(username: username)
                    }
                    .frame(height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(validUsername ? Color.green : Color.red, lineWidth: 1)
                    )
                
                    
                    
                
                SecureField( "Contraseña", text: $password)
                    .frame(height: 40)

            }
            
            Button(action: {
                loginVC.loginUser(username: username, password: password)
            }, label: {
                Text("Aceptar")
            })
                .frame(width: 150, height: 40, alignment: .center)
                .foregroundColor(.white)
                .background(Color.secondaryColor)
                .cornerRadius(5)
            
            Spacer()
            Button(action: {
                //presentationMode.wrappedValue.dismiss()
                loginVC.registerUser(username: username, password: password)
            }, label: {
                Text("Registrarme")
            })
                .foregroundColor(Color.colorPrimary)
        }.padding()
        
        .fullScreenCover(isPresented: $showProfile, content: {
            ProfileView()
        })
    }
   
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
