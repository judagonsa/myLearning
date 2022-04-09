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
    @State var list = false
    
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
            
            Button(action: {
                list.toggle()
            }, label: {
                Text("List")
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
        .fullScreenCover(isPresented: $list, content: {
            ExampleList()
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
}

extension Color {
    static let colorPrimary: Color = Color("colorPrimary")
}
