//
//  SwiftUIView.swift
//  Drugly
//
//  Created by boshFbt on 19/02/2024.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ZStack(alignment:.leading){
            RoundedRectangle(cornerRadius: 14)
                .frame(width:357,height:103)
            

            
            HStack {
                Image("Paracetamol")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        
                        .frame(width:100,height: 90)
            
                
                VStack(alignment:.leading){
                
                    Text("drug.gen_name")
                        .foregroundStyle(Color("FontColor"))
                        .font(.title)
                        
                    Text("drug.tr_name")
                            .foregroundStyle(Color("FontColor"))
                            .font(.headline)
                
                    Text("drug.dose")
                            .foregroundStyle(Color("DoseColor"))
                            .font(.subheadline)
                
                    
                }
                .padding()
            }
        }.overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(lineWidth: 4)
                .foregroundStyle(Color.gray)
                .frame(width:357,height:103)
        )
    }

}

#Preview {
    SwiftUIView()
}
