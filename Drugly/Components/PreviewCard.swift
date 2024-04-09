//
//  PreviewCard.swift
//  Drugly
//
//  Created by boshFbt on 15/02/2024.
//

import SwiftUI

struct PreviewCard: View {
    var genName:String
    var trName:String
    var Dose:String
    var url:String
    let strokeColor:Color
    @EnvironmentObject private var vm:AddDrugViewModel
    var body: some View {
        ZStack(alignment:.leading){
            
            HStack{
                if let data = vm.savedData{
                    Image(uiImage: UIImage(data: data)!)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius:12))
                        .frame(width:100,height:80)
                }else {
                    Image("DefaultDrug")
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius:12))
                        .frame(width:100,height:80)
                }
                
                VStack(alignment:.leading){
                    
                    Text(genName)
                    //                    .foregroundStyle(Color("FontColor"))
                        .foregroundStyle(Color.black)
                        .font(.title)
                    
                    Text(trName)
                        .foregroundStyle(Color.black)
                        .font(.headline)
                    
                    Text(Dose)
                        .foregroundStyle(Color("DoseColor"))
                        .font(.subheadline)
                    
                    
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

//#Preview {
//    PreviewCard()
//}


/*
 if let img = vm.savedData {
     Image(uiImage: UIImage(data: img)!)
             .resizable()
             .clipShape(RoundedRectangle(cornerRadius: 14))
             .opacity(0.3)
             .frame(width:357,height:103)
     }
     
 else{
     Image(systemName:"pill.fill")
         .foregroundStyle(Color.white)
             .clipShape(RoundedRectangle(cornerRadius: 14))
             .opacity(0.3)
             .frame(width:357,height:103)
 }
 */
