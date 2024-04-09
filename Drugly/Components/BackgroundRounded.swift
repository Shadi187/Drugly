//
//  BackgroundRounded.swift
//  Drugly
//
//  Created by boshFbt on 19/02/2024.
//

import SwiftUI

struct BackgroundRounded: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 14)
                .frame(width:357,height:103)
            
            VStack{

            Image(systemName: "pill.fill")
                .foregroundStyle(Color.white)
                .font(.title)
            }
        }
        
    }
}

#Preview {
    BackgroundRounded()
}
