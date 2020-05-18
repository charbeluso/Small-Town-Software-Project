//
//  Question.swift
//  iOS-Survey-List
//
//  Created by Charmaine Beluso on 5/18/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

// Creates new variable Type called Question from the database
struct Question: Hashable, Codable, Identifiable {
    var id: Int
    var question: String
    var category: String
    var choices = [String]()
}
