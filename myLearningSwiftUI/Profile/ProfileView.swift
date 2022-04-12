//
//  ProfileView.swift
//  myLearningSwiftUI
//
//  Created by Julian González on 10/04/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isRegister: Bool
    
    @State var imageProfileUrl = ""
    @State var textErrorImage = ""
    
    @State var name = ""
    @State var textErrorName = ""
    
    @State var lastName = ""
    @State var textErrorLastName = ""
    
    @State var document = ""
    @State var textErrorDocument = ""
    
    @State var email = ""
    @State var validEmail = true
    @State var textErrorEmail = ""
    
    @State var password = ""
    @State var validPassword = true
    @State var textErrorPassword = ""
    
    @State var dateBirth = ""
    @State var textErrorDateBirth = ""
    
    @State var profession = ""
    @State var textErrorProfession = ""
    
    @State var description = ""
    @State var textErrorDescription = ""
    
    
    var body: some View {
        ZStack {
            Color.grayColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Image("imageDefault")
                    .resizable()
                    .frame(width: 180, height: 180)
                    .cornerRadius(90)
                    .padding()
                
                Text(textErrorImage)
                    .font(.system(size: 12))
                    .foregroundColor(Color.colorPrimary)
                
                
                Section (header:
                            HStack {
                            Text("Personal data")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                    Spacer()
                }) {
                    
                    
                    TextField("Name", text: $name)
                        .styleInput()
                    HStack {
                        Text(textErrorName)
                            .font(.system(size: 12))
                            .foregroundColor(Color.colorPrimary)
                        Spacer()
                    }
                    
                    TextField("Last Name", text: $lastName)
                        .styleInput()
                    HStack {
                        Text(textErrorLastName)
                            .font(.system(size: 12))
                            .foregroundColor(Color.colorPrimary)
                        Spacer()
                    }
                    
                    TextField("Document", text: $document)
                        .styleInput()
                        .keyboardType(.numberPad)
                    HStack {
                        Text(textErrorDocument)
                            .font(.system(size: 12))
                            .foregroundColor(Color.colorPrimary)
                        Spacer()
                    }
                    
                    TextField("Date Birth", text: $dateBirth)
                        .styleInput()
                    
                    HStack {
                        Text(textErrorDateBirth)
                            .font(.system(size: 12))
                            .foregroundColor(Color.colorPrimary)
                        Spacer()
                    }
                }
                
                
                Section (header:
                            HStack {
                            Text("Profession data")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                    Spacer()
                }){
                    
                    TextField("Email", text: $email)
                        .styleInput()
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .autocapitalization(.none)
                    
                    HStack {
                        Text(textErrorEmail)
                            .font(.system(size: 12))
                            .foregroundColor(Color.colorPrimary)
                        Spacer()
                    }
                    
                    SecureField("Password", text: $password)
                        .styleInput()
                    HStack {
                        Text(textErrorPassword)
                            .font(.system(size: 12))
                            .foregroundColor(Color.colorPrimary)
                        Spacer()
                    }
                    
                    TextField("Profession", text: $profession)
                        .styleInput()
                    HStack {
                        Text(textErrorProfession)
                            .font(.system(size: 12))
                            .foregroundColor(Color.colorPrimary)
                        Spacer()
                    }
                    
                    TextField("Description", text: $description)
                        .styleInput()
                    HStack {
                        Text(textErrorDescription)
                            .font(.system(size: 12))
                            .foregroundColor(Color.colorPrimary)
                        Spacer()
                    }
                }
                
                Button(action: {
                    if validTextFields() {
                        print("Registrar")
                    }
                }, label: {
                    Text(isRegister ? "Register" : "Save")
                        .styleButtonView()
                })
                
            }
            .padding()
        }
    }
    
    
    func validTextFields() -> Bool {
        if name.isEmpty {
            textErrorName = "Favor ingrese el nombre"
            return false
        }else if lastName.isEmpty {
            textErrorLastName = "Favor ingrese el apellido"
            return false
        }else if document.isEmpty {
            textErrorDocument = "Favor ingrese el documento"
            return false
        }else if email.isEmpty {
            textErrorEmail = "Favor ingrese el correo"
            return false
        }else if password.isEmpty {
            textErrorPassword = "Favor ingrese la contraseña"
            return false
        }else if dateBirth.isEmpty {
            textErrorDateBirth = "Favor ingrese la fecha de nacimiento"
            return false
        }else if profession.isEmpty {
            textErrorProfession = "Favor seleccione la profesión"
            return false
        }else if description.isEmpty {
            textErrorDescription = "Favor ingrese la descripción"
            return false
        }else{
            return true
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isRegister: false)
    }
}
