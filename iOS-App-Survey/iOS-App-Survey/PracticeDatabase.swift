//
//  PracticeDatabase.swift
//  iOS-App-Survey
//
//  Created by Charmaine Beluso on 5/15/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

struct PracticeDatabase: View {
    var adminQuestion: Question
    
    var body: some View {
        
        VStack {
            Text(adminQuestion.question)
            Text("\(sampleDatabase.count)")
        }
    }
}

struct PracticeDatabase_Previews: PreviewProvider {
    static var previews: some View {
        PracticeDatabase(adminQuestion: sampleDatabase[0])
    }
}
