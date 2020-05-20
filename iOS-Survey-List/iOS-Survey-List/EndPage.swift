//
//  EndPage.swift
//  iOS-Survey-List
//
//  Created by Charmaine Beluso on 5/19/20.
//  Copyright © 2020 Carl Small Town Center. All rights reserved.
//

import SwiftUI

struct EndPage: View {

    var body: some View {
        VStack {
            Image("smalltowncenterlogo")
                .padding(.bottom, 100.0)
            Text("Thank you for completing the survey!")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}

struct EndPage_Previews: PreviewProvider {
    static var previews: some View {
        EndPage()
    }
}
