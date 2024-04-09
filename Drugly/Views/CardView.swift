//
//  CardView.swift
//  Drugly
//
//  Created by boshFbt on 23/01/2024.
//

import SwiftUI

struct CardView: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var vm:DruglyViewModel
    let drug:Medic
//   @State var isFlipped:Bool = false
//   @State var backDegree:Double = 0.0
//   @State var frontDegree:Double = -90.0
//    let duration:CGFloat = 0.3
//   @State var degrees:Double = 0.0
//    
    //MARK: - BODY
    
    var body: some View {
        ZStack {
            
            //front
            Card(color:.blue,degree: $vm.frontDegree,drug: drug,front:false,back:true)
            
            
            //back
            Card(color: .blue,degree: $vm.backDegree,drug: drug,front: true,back: false)
            
            
            
        } //:ZSTACK
        .onTapGesture {
            vm.flipCard()
            print("\(vm.frontDegree)")
        }
        
        
        

    }
    //MARK: - FUNCTIONS
    
    
    func flipCard(){
        vm.isFlipped.toggle()
        
        if vm.isFlipped{
            withAnimation(.linear(duration: vm.duration)){
                vm.backDegree = 90
            }
            
            withAnimation(.linear(duration:vm.duration).delay(vm.duration)){
                vm.frontDegree = 0
            }
        }
        else {
            withAnimation(.linear(duration: vm.duration)){
                vm.frontDegree = -90
            }
            
            withAnimation(.linear(duration:vm.duration).delay(vm.duration)){
                vm.backDegree = 0
            }
        }
    }
//    func flipCard(){
//        vm.isFlipped = !vm.isFlipped
//        
//        if vm.isFlipped{
//            withAnimation(.linear(duration: vm.duration)){
//                vm.backDegree = 90
//            }
//            
//            withAnimation(.linear(duration:vm.duration).delay(vm.duration)){
//                vm.frontDegree = 0
//            }
//        }
//        else {
//            withAnimation(.linear(duration: vm.duration)){
//                vm.frontDegree = -90
//            }
//            
//            withAnimation(.linear(duration:vm.duration).delay(vm.duration)){
//                vm.backDegree = 0
//            }
//        }
//    }
//    
}



//struct CardView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        CardView(drug:dummyData.dummyDrug)
//            .environmentObject(DruglyViewModel())
//            
//    }
//}



extension CardView {
   /*
    var details: some View {
        VStack(spacing:20){
            Spacer()
            Image(uiImage: drug.Image)
                .resizable()
                .scaledToFit()
                .frame(width:180)
            Spacer()
            Text(drug.genName)
                .font(.title)
            Text(drug.trName)
                .font(.title)
            Text(drug.Dose)
                .font(.title)
            Text(drug.Description)
                .font(.headline)
            Spacer()
            
        } //: VStack
        
    }
    */
}
