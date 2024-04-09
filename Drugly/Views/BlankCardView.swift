//
//  BlankCardView.swift
//  Drugly
//
//  Created by boshFbt on 24/01/2024.
//

import SwiftUI

struct BlankCardView: View {
    var body: some View {
        VStack{
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(Color.gray)
                VStack(spacing:30){
                Circle()
                    .frame(width:150,height:100)
                    .foregroundStyle(Color(UIColor.lightGray))
                    .overlay(
                        Image(systemName:"plus")
                            .font(.largeTitle)
                            .foregroundStyle(Color(UIColor.darkGray))
                        
                    )
                    
                    Text("Add a Drug To Start Using The App")
                        .font(.headline)
                }
            }
            
            
        }.frame(width:300,height:550)
    }
}

#Preview {
    BlankCardView()
}
