//
//  SearchBar.swift
//  Drugly
//
//  Created by boshFbt on 20/02/2024.
//

import SwiftUI

struct SearchBar: View {
    var body: some View {
        
        ZStack {
            HStack{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Color(.gray))
                    .opacity(0.4)
                    .frame(width:.infinity,height:30)
                    .padding()
                    .shadow(color:.black,radius:3,y:4)
                
                    
            }
            
            Image(systemName:"magnifyingglass")
        }
        
        
    }
}

#Preview {
    SearchBar()
        
}
