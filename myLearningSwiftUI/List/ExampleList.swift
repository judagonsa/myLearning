//
//  ExampleList.swift
//  myLearningSwiftUI
//
//  Created by Julian González on 9/04/22.
//

import SwiftUI

struct ExampleList: View {
    
    @ObservedObject var listVC = ListVC()
    
    var books = [Book]()
    
    init() {
        books = listVC.dataBooks
    }
    
    var body: some View {
        VStack {
            NavigationView {
                List (listVC.dataBooks) { book in
                    Text(book.title)
                }
                .navigationTitle("Test List")
            }
        }
    }
}

struct ExampleList_Previews: PreviewProvider {
    static var previews: some View {
        ExampleList()
    }
}
