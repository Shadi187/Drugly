//
//  OnBoardingCard.swift
//  Drugly
//
//  Created by boshFbt on 27/01/2024.
//

import SwiftUI

struct OnBoardingCard: View {
    var statement: String
    var valueForAnimation:Bool
    var numOfPills:Int
    var body: some View {
        VStack(spacing:10){
            HStack{
                ForEach(0...numOfPills,id:\.self){_ in
                    Image(systemName: "pill.fill")
                        .font(valueForAnimation ? .largeTitle : .title)
                }
            }
                
            Text(statement)
                .bold()
                .multilineTextAlignment(.center)
        }
        .frame(width: 300, height: 500)
        
        
        .background(
            RoundedRectangle(cornerRadius: 18)
                .foregroundStyle(
                    LinearGradient(colors: [Color.red,Color.blue], startPoint: .bottomLeading, endPoint: .topTrailing)
                )
                .shadow(color:Color.black, radius: 5,x:3,y:5)
        )
        
    }
}

//#Preview {
//    OnBoardingCard(statement:"The place where all your drugs will be stored")
//}

/* */
