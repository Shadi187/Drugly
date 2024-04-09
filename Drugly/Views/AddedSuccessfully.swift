//
//  AddedSuccessfully.swift
//  Drugly
//
//  Created by boshFbt on 09/04/2024.
//

import SwiftUI

struct AddedSuccessfully: View {
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 12)
                .frame(width:190,height:180)
            VStack{
                ZStack{
                    Image(systemName:"checkmark")
                        .font(.largeTitle)
                    
                    Circle()
                        .stroke()
                        .frame(width: 100, height:100)
                }
                
                Text("Added Successfully")
            }
            .foregroundStyle(Color.white)
            .bold()
            
        }
    }
}

#Preview {
    AddedSuccessfully()
}
