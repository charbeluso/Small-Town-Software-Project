//
//  ViewRouter.swift
//  iOS-Survey-List
//
//  Created by Charmaine Beluso on 5/19/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import Foundation
import Combine
import SwiftUI


class ViewRouter: ObservableObject {
    
    let objectWillChange = PassthroughSubject<ViewRouter,Never>()

    var currentPage: Int = 1 {
        didSet {
            objectWillChange.send(self)
        }
    }
}
