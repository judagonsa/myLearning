//
//  ReduxView.swift
//  myLearningSwiftUI
//
//  Created by Julian González on 29/12/21.
//

import SwiftUI

struct ReduxView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Hello, redux!")
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Volver")
            })
        }
    }
}

struct ReduxView_Previews: PreviewProvider {
    static var previews: some View {
        ReduxView()
    }
}
