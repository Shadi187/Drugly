//
//  BlankPatients.swift
//  Drugly
//
//  Created by boshFbt on 24/01/2024.
//

import SwiftUI

struct BlankPatientsView: View {
    var body: some View {
        VStack {
            Circle()
                .stroke(.black,lineWidth:2)
                
                .frame(width: 50, height: 50)
                
                .overlay(
                    Image(systemName: "plus")
                        .font(.largeTitle)
            )
            
            Text("Add Patient")
        }
    }
}

#Preview {
    BlankPatientsView()
}
