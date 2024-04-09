//
//  EachDrugView.swift
//  Drugly
//
//  Created by boshFbt on 04/03/2024.
//

import SwiftUI

struct EachDrugView: View {
//    var genName: String
    var Med:Medic
    var body: some View {
        ScrollView{
            VStack(alignment:.leading,spacing:20){
            //MARK: - HEADER
            
                if let data = ImageService.instance.fetchData(url: Med.url ?? ""){
                        Image(uiImage: data)
                            .resizable()
                            .scaledToFit()
                            
                }else {
                        Image("DefaultDrug")
                            .resizable()
                            .scaledToFit()
                            
                    }
                    
            Divider()
                    .shadow(color:.black, radius: 10,y:3)
                    .frame(minHeight:2)
                    .overlay( Color.blue)
                    
            
            
            //MARK: - BODY
                VStack(alignment: .leading,spacing:13){
                //Generic Name
                    Text(Med.gen_name ?? "Generic Name")
                        .font(.title)
                    
                        .foregroundStyle(Color.black)
                
                    Text(Med.tr_name ?? "Trade Name")
                        .foregroundStyle(.gray)
                        .font(.title2)
                    
                    
                    Text(Med.dose ?? "Dose")
                        .font(.headline)
                }
            .padding(.leading)
                
            Divider()
                    .shadow(color:.black, radius: 10,y:3)
                    .frame(minHeight:2)
                    .overlay( Color.blue)
                
            //MARK: - FOOTER
                VStack{
                    Text(Med.ddescription ?? "Description")
                        .font(.subheadline)
                        .padding(.leading)
                }
            }
        }
        
    }
}

//#Preview {
//    EachDrugView()
//}
