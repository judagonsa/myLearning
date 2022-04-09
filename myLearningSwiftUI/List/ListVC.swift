//
//  ListVC.swift
//  myLearningSwiftUI
//
//  Created by Julian González on 9/04/22.
//

import Foundation
import UIKit

class ListVC: ObservableObject{
    
    @Published var dataBooks = [Book]()
    
    init() {
        getBooks()
    }
    
    func getBooks () {
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos")!) { data, _, _  in
            
            do {
                let getBookJson: [Book] = try JSONDecoder().decode([Book].self, from: data!)
                DispatchQueue.main.async {
                    self.dataBooks = getBookJson
                }
            }catch {
                print(error)
            }
        }.resume()
    }
}
