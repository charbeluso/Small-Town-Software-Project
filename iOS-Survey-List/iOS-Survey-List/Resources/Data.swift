//
//  Data.swift
//  iOS-Survey-List
//
//  Created by Charmaine Beluso on 5/18/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//
// This file converts the JSON file into an array of the Type Question. This makes the data from the JSON file usable in SwiftUI.

import UIKit
import SwiftUI

// Creates an array called sampleDatabase with the Type Question from the JSON file.
let sampleDatabase: [Question] = load("sampleDatabase.json")

// Decode the JSON file
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
