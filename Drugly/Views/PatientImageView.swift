//
//  PatientImageView.swift
//  Drugly
//
//  Created by boshFbt on 23/01/2024.
//

import SwiftUI

struct PatientImageView: View {
    var body: some View {
        VStack {
            Circle()
                .stroke(.black,lineWidth:2)
                
                .frame(width: 50, height: 50)
                
                .overlay(
                    Image(systemName: "person.fill")
                        .font(.largeTitle)
            )
            
            Text("Name")
        }
    }
}

#Preview {
    PatientImageView()
}
