//
//  ContentView.swift
//  Drugly
//
//  Created by boshFbt on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
//    @Binding var drugs:[Drug]
    var patients:[Patient]
    @EnvironmentObject var vm:DruglyViewModel
    @State var selection = Set<String>()
//    @EnvironmentObject var vm2:AddDrugViewModel
    //MARK: - BODY
    
    var body: some View {
        NavigationStack {
            wholeApp
                .navigationTitle("Drugs")
                .toolbar{
                    Button{
                        
                    }label:{
                        NavigationLink(destination: AddDrugView()){
                            Image(systemName: "plus")
                        }
                    }
                    
                }
                .onAppear{
                    vm.updateDrugs()
                }
            
            
                
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView( patients: dummyData.emptyDummyPatients)
            .environmentObject(DruglyViewModel())
            .environmentObject(AddDrugViewModel())
    }
}


extension ContentView {
   @ViewBuilder
    var wholeApp: some View {
        VStack(spacing: -10){
            
            //PatientsView
//            if !patients.isEmpty {
//                patientsSection
//                    .onTapGesture{
//                        
//                    }
//                Spacer()
//            }
//            
//            else {
//                BlankPatientsView()
//                Spacer()
//            }
            
            
            //DrugsView
//            if (!vm.Drugss.isEmpty){
                thereIsDrugs
//            }else{
//                BlankCardView()
//            }
            }
            
        }

    
    
    
//    var patientsSection: some View {
//        
//    }
    
    
    var thereIsDrugs: some View {
        VStack{
            
                
            List(selection:$selection){
//            TextField("Search...", text: $vm.searchText)
//                .padding()
//                .background(
//                    HStack {
//                        RoundedRectangle(cornerRadius: 12)
//                            .stroke(lineWidth:2)
//                            .foregroundStyle(Color.gray)
//                            .frame(width:380,height:41)
//                        .padding()
//                        .background(
//                            Image(systemName:"magnifyingglass")
//                                .padding()
//                            ,alignment: .trailing
//                        )
//                        
//                    }
//                )
            
                ForEach(vm.FilteredDrugs){ Drug in
                    NavigationLink{
                        
                        EachDrugView(Med: Drug)
                    }label:{
                        
                        NewCard(strokeColor: .black,drug:Drug)
                    }

                
                    
                
//                NewCard1()
                
            }.onDelete(perform:vm.deleteDrug)
            }
    
        
        }
        .searchable(text: $vm.searchText)
//        .scrollIndicators(.hidden)
            
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            .listSectionSeparator(.hidden)
            .onAppear{
//                print("Appeared")
                vm.updateDrugs()
//                print("not Appeared")
//                print(vm.Drugss.count)
            }
            
            
        
        
    }
}
