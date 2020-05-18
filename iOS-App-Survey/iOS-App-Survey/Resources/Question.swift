//
//  Questions.swift
//  iOS-App-Survey
//
//  Created by Charmaine Beluso on 5/15/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

struct Question: Hashable, Codable, Identifiable {
    var id: Int
    var question: String
    var category: Category
    var choices: String //[String]()

    enum Category: String, CaseIterable, Codable, Hashable {
        case checkbox 
        case radio
        case map
        case comment
    }
}
