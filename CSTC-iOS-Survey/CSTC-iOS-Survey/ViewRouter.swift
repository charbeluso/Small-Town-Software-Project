//
//  ViewRouter.swift
//  CSTC-iOS-Survey
//
//  Created by Charmaine Beluso on 5/19/20.
//  Copyright © 2020 MSU Carl Small Town Center. All rights reserved.
//
// This file creates a ViewRouter class that routes the different views in the program. This allows the program to move between views/pages.


import Foundation
import Combine
import SwiftUI

// Tracks the different pages in the app
class ViewRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()

    var currentPage: Int = 1 {
        didSet {
            objectWillChange.send(self)
        }
    }
}
