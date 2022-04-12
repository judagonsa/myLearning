//
//  Login.swift
//  myLearningSwiftUI
//
//  Created by Julian González on 16/09/21.
//

import SwiftUI

struct Login: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var email = ""
    @State var password = ""
    @ObservedObject var loginVC = LoginVC()
    @State var validEmail = true
    @State var textErrorEmail = ""
    
    @State var validPassword = true
    @State var textErrorPassword = ""
    
    @State var registerUser = ""
    @State var loginUser = ""
    
    @State var showProfile = false
    
    @State var isRegister = false
    
    init(){
        isRegister = false
        showProfile = false
    }
    
    var body: some View {
        VStack{
            
            HStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image("close")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(Color.colorPrimary)
                        .padding()
                })
            }
            
            Spacer()
            
            VStack  {
                
                TextField("Correo", text: $email)
                    .onChange(of: email) { newUser in
                        
                        if !newUser.isEmpty {
                            
                            validEmail = loginVC.validateEmail(email: email)
                            
                            if !validEmail {
                                textErrorEmail = "Formato de correo inválido"
                            }else{
                                textErrorEmail = ""
                            }
                        }else{
                            validEmail = true
                        }
                        
                    }
                    .styleInput()
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(validEmail ? Color.gray : Color.red, lineWidth: 1)
                    )
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
                
                HStack {
                    Text(textErrorEmail)
                        .font(.system(size: 12))
                        .foregroundColor(Color.colorPrimary)
                    Spacer()
                }
                    
                SecureField( "Contraseña", text: $password)
                    .onChange(of: password) { newPass in
                        
                        if !newPass.isEmpty {
                            validPassword = loginVC.validatePassword(password: password)
                            if !validPassword {
                                textErrorPassword = "La contraseña debe contener más de 8 caracteres dentro de ellas una mayúscula y un número"
                            }else{
                                textErrorPassword = ""
                            }
                            
                        }else {
                            validPassword = true
                        }
                        
                    }
                    .styleInput()
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(validPassword ? Color.gray : Color.red, lineWidth: 1)
                    )
                
                HStack {
                    Text(textErrorPassword)
                        .font(.system(size: 12))
                        .foregroundColor(Color.colorPrimary)
                    Spacer()
                }
                
                Button(action: {
                    if validTextFields() {
                        loginVC.loginUser(username: email, password: password)
                    }
                    
                }, label: {
                    Text("Aceptar")
                        .styleButtonView()
                })
                    

            }
            .padding()
            .background(Color.grayColor)
            .cornerRadius(10)
            
            
            Spacer()
            Button(action: {
                
                isRegister = true
                showProfile = true
                
            }, label: {
                Text("Registrarme")
                    .frame(width: 150, height: 40, alignment: .center)
                    .foregroundColor(Color.colorPrimary)
            })
        }.padding()
        
        .fullScreenCover(isPresented: $showProfile, content: {
            ProfileView(isRegister: isRegister)
        })
    }
    
    func validTextFields() -> Bool {
        if email.isEmpty {
            textErrorEmail = "Favor ingrese el correo"
            return false
        }else if password.isEmpty {
            textErrorPassword = "Favor ingrese la contraseña"
            return false
        }else{
            return true
        }
    }
   
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
