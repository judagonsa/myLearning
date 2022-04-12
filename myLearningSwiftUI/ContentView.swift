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
    @State var showRedux = false
    
    var body: some View {
        VStack (spacing: 10) {
            
            Text("Welcome, My Learninig Judagonsa")
                .padding()
            
            Button(action: {
                showLogin.toggle()
            }, label: {
                Text("Login")
                    .styleButtonHome()
            })
            
            Button(action: {
                showCalculator.toggle()
            }, label: {
                Text("Calculator")
                    .styleButtonHome()
            })
            
            Button(action: {
                showRedux.toggle()
            }, label: {
                Text("Redux")
                    .styleButtonHome()
            })
            
        }.navigationTitle("My Learning")
        .padding(.horizontal, 20)
        
        .fullScreenCover(isPresented: $showLogin, content: {
            Login()
        })
        .fullScreenCover(isPresented: $showCalculator, content: {
            Calculator()
        })
        .fullScreenCover(isPresented: $showRedux, content: {
            ReduxView()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//modifier
struct ModifierButton: ViewModifier {
    func body (content: Content) -> some View {
        content
            .font(.body)
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.colorPrimary)
            .cornerRadius(10)
    }
}

extension View {
    func styleButtonHome() -> some View {
        self.modifier(ModifierButton())
    }
    
    func styleInput() -> some View {
        self.modifier(ModifierTextFiled())
    }
    
    func styleButtonView() -> some View {
        self.modifier(ModifierButtonView())
    }
}

extension Color {
    static let colorPrimary: Color = Color("colorPrimary")
    static let secondaryColor: Color = Color("colorSecundary")
    static let grayColor: Color = Color("grayColor")
}

struct ModifierTextFiled: ViewModifier {
    func body (content: Content) -> some View {
        content
            .padding(10)
            .background(Color.white)
            .cornerRadius(8)
    }
}

struct ModifierButtonView: ViewModifier {
    func body (content: Content) -> some View {
        content
            .frame(width: 150, height: 40)
            .foregroundColor(.white)
            .background(Color.secondaryColor)
            .cornerRadius(5)
    }
}
