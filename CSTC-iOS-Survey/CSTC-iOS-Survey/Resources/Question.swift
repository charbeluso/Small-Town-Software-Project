//
//  Question.swift
//  CSTC-iOS-Survey
//
//  Created by Charmaine Beluso on 5/18/20.
//  Copyright © 2020 MSU Carl Small Town Center. All rights reserved.
//
// This file implements a "Question" Type to make the database readible for the rest of the program.


import SwiftUI

// Creates new variable Type called Question from the database
struct Question: Hashable, Codable, Identifiable {
    var id: Int
    var question: String
    var category: String
    var choices = [String]()
    fileprivate var imageName: String
}


 // Initializes an image variable with a Question type
extension Question {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

