//
//  ViewRouter.swift
//  iOS-App-Survey
//
//  Created by Charmaine Beluso on 5/15/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import Foundation
import Combine
import SwiftUI


class ViewRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()
    
    //var adminQuestion: Question
    
    // Hardcoded amount of pages
    var totalPages: Int = 5
    
    

    var currentPage: Int = 1 {
        didSet {
            objectWillChange.send(self)
        }
    }
}

