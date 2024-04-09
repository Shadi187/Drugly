//
//  Card.swift
//  Drugly
//
//  Created by boshFbt on 28/01/2024.
//

import SwiftUI

struct Card: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var vm:DruglyViewModel
    var color:Color
    @Binding var degree:Double
    var drug:Medic
     var front:Bool
     var back:Bool
    
    //MARK: - BODY
    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 19)
            .foregroundStyle(color)
            .frame(width: 300, height: 450)
            .shadow(color:Color.black, radius: 5,x:3,y:5)
                VStack(spacing:20){
                    if(front){
                    Spacer()
                        if let data = vm.fetchData(url: drug.url ?? "") {
                            Image(uiImage: data)
                            
                            .resizable()
                            .scaledToFit()
                            .frame(width:180)
                            
                    }
                        
                       
                    
                    Spacer()
                        Text(drug.gen_name ?? "")
                            .font(.title)
                        Text(drug.tr_name ?? "" )
                            .font(.title)
                        Text(drug.dose ?? "" )
                            .font(.title)
                    
                    Spacer()
                    
                }
                    
                     else if(back){
                        Text(drug.ddescription ?? "" )
                            .font(.title2)
                    }
                    
                    
                }
            
        }
        .rotation3DEffect(
        Angle(degrees:degree),
                              axis: (x: 0.0, y: 1.0, z: 0.0)
    )
    }
}

//#Preview {
//    Card(color:Color.blue)
//}
