//
//  EndPage.swift
//  CSTC-iOS-Survey
//
//  Created by Charmaine Beluso on 5/19/20.
//  Copyright © 2020 MSU Carl Small Town Center. All rights reserved.
//
// The last page of the survey.


import SwiftUI

struct EndPage: View {

    var body: some View {
        
        // Shows the logo above the "thank you" text
        VStack {
            Image("smalltowncenterlogo")
                .padding(.bottom, 100.0)
            Text("Thank you for completing the survey!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text("Return to the Carl Small Town Center website:")
            Text("www.smalltowncenter.msstate.edu")
        }
    }
}

// Previews the end page
struct EndPage_Previews: PreviewProvider {
    static var previews: some View {
        EndPage()
    }
}
