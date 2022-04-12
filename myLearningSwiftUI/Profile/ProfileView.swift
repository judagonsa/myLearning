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
    
    @State var name = ""
    @State var textErrorName = ""
    
    @State var lastName = ""
    
    @State var document = ""
    
    @State var email = ""
    
    @State var dateBirth = ""
    
    @State var profession = ""
    
    @State var description = ""
    
    @State var password = ""
    
    var body: some View {
        ZStack {
            Color.grayColor
                .edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 10) {
                
                Image("imageDefault")
                    .resizable()
                    .frame(width: 180, height: 180)
                    .cornerRadius(90)
                    .padding()
                
                TextField("Name", text: $name)
                    .padding(10)
                    .background(Color.white)
                
                TextField("Last Name", text: $lastName)
                    .padding(10)
                    .background(Color.white)
                
                TextField("Document", text: $document)
                    .padding(10)
                    .background(Color.white)
                    .keyboardType(.numberPad)
                
                TextField("Email", text: $email)
                    .padding(10)
                    .background(Color.white)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .padding(10)
                    .background(Color.white)
                
                TextField("Date Birth", text: $dateBirth)
                    .padding(10)
                    .background(Color.white)
                
                TextField("Profession", text: $profession)
                    .padding(10)
                    .background(Color.white)
                
                TextField("Description", text: $description)
                    .padding(10)
                    .background(Color.white)
                
                Button(action: {
                    
                }, label: {
                    Text(isRegister ? "Register" : "Save")
                        .padding(.horizontal)
                        .frame(width: 200.0, height: 40)
                        .background(Color.secondaryColor)
                        .foregroundColor(Color.white)
                        .cornerRadius(5)
                        .padding()
                })
                
            }
            .padding()
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isRegister: false)
    }
}
