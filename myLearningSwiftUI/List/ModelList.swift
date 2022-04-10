//
//  ModelList.swift
//  myLearningSwiftUI
//
//  Created by Julian González on 9/04/22.
//

import Foundation

struct Book: Decodable, Identifiable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
