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
    @State var validUsername = true
    @State var validPassword = true
    
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
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(validUsername ? Color.gray : Color.red, lineWidth: 1)
                    )
                    .background(Color.white)
                    
                SecureField( "Contraseña", text: $password)
                    .onChange(of: password) { newPass in
                        validPassword = loginVC.validatePassword(password: password)
                    }
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(validPassword ? Color.gray : Color.red, lineWidth: 1)
                    )
                    .background(Color.white)
                
                Button(action: {
                    loginVC.loginUser(username: username, password: password)
                }, label: {
                    Text("Aceptar")
                })
                    .frame(width: 150, height: 40, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color.secondaryColor)
                    .cornerRadius(5)

            }
            .padding()
            .background(Color.grayColor)
            .cornerRadius(10)
            
            
            
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
