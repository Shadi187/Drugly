//
//  NewCard.swift
//  Drugly
//
//  Created by boshFbt on 14/02/2024.
//

import SwiftUI

struct NewCard: View {
    @StateObject var vm = NewCardViewModel()
    let strokeColor:Color
    let drug:Medic
    var body: some View {
        ZStack(alignment:.leading){
            
            HStack{
            if let data = vm.fetchData(url: drug.url ?? ""){
                    Image(uiImage: data)
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
                
                Text(drug.gen_name ?? "GenName")
//                    .foregroundStyle(Color("FontColor"))
                    .foregroundStyle(Color.black)
                    .font(.title)
                
                Text(drug.tr_name ?? "TradeName" )
                    .foregroundStyle(Color.black)
                    .font(.headline)
                
                Text(drug.dose ?? "12e")
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
//    NewCard(strokeColor: Color(UIColor.systemTeal), drug: <#Medic#>)
//}
