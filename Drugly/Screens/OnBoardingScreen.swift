//
//  OnBoardingScreen.swift
//  Drugly
//
//  Created by boshFbt on 25/01/2024.
//

import SwiftUI

struct OnBoardingScreen: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var vm:OnboardingViewModel
    //MARK: - BODY
    var body: some View {
        ZStack {
            VStack{
                
                Text("Hello Dr. \(vm.nameOfUser)")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    
                
                Spacer()
                TextField("\(vm.placeHolder)", text: $vm.nameOfUser)
                    .disabled(vm.disInab)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            
                            .stroke(Color.black,lineWidth: 3)
                            
                        
                            
                            
                            .foregroundStyle(Color.white)
                            
                    )
                    .padding()
                    
                TabView(selection: $vm.stateIndex){
                    OnBoardingCard(statement: vm.welcomingPhrases[0],valueForAnimation: vm.isAnimating,numOfPills: 0)
                        .tag(0)
                    
                    OnBoardingCard(statement: vm.welcomingPhrases[1],valueForAnimation: vm.isAnimating,numOfPills: 1)
                        .tag(1)
                    
                    OnBoardingCard(statement: vm.welcomingPhrases[2],valueForAnimation: vm.isAnimating,numOfPills: 2)
                        .tag(2)
                    
                }.onChange(of:vm.stateIndex){ value in
                    if(vm.stateIndex == 0){
                        vm.nameOfUser = ""
                        vm.disInab = true
                        vm.placeHolder = "You can't touch me right now!!"
                    }
                    if (vm.stateIndex == 1){
                        vm.nameOfUser = ""
                        vm.disInab = true
                        vm.placeHolder = "not right now either..."
                    }
                    if (vm.stateIndex == 2){
                        vm.disInab = false
                        vm.placeHolder = "okay now you can (:"
                    }
                    
                }
                
                
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                Spacer()
                    
                
                Button(action: {vm.isOnboarding = true
                print("idsdasdsad")
                }) {
                    Text(vm.stateIndex == 2 ? "Finish" : "Swap")
                        
                        .foregroundStyle(Color.white)
                            .font(.headline)
                            .frame(width:150, height:50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color.red)
                                    .opacity(vm.stateIndex == 2 && !vm.nameOfUser.isEmpty ? 1.0 : 0.3)
                            )
                }.disabled(vm.checkInput())
                
                
            }
        }
    }
    
}
#Preview {
    OnBoardingScreen()
        .environmentObject(OnboardingViewModel())
}
//
//extension OnBoardingScreen{
//    
//    
//    var pills: some View {
//        VStack {
//            ForEach(0...6,id:\.self) {_ in
//                HStack{
//                    ForEach(0...100,id:\.self){_ in
//                        Image(systemName: "pill.fill")
//                            .font(.largeTitle)
//                            .fontWeight(.heavy)
//                    }
//                }
//            }
//            
//        }//:VSTACK
//        .padding(.top,60)
//        .onAppear(perform: {
//            withAnimation() {
//                vm.isAnimating = true
//            }
//        
//        })
//    }
//    
//}


/*
 
 TabView(selection: $stateIndex){
     ForEach(welcomingPhrases,id:\.self){ phrase in
         Group {
             Text(phrase)
                 .tag(phrase)
                 .frame(width:220,height:100)
                 .font(.headline)
                 .fontWeight(.bold)
             .padding(.bottom)
         }
             
         .onAppear(perform:{
             stateIndex = 0
             
             
         })
             
     }
     
     
 }
 .onChange(of: stateIndex){newIndex,newValue  in
     
     print("State index: \(newIndex),\(newValue)")
 }
 //: TabView
 
 .tabViewStyle(PageTabViewStyle())
 .padding()
 Spacer(minLength: 230)
 
 Spacer()
 

 
} //:VSTACK
if(isChanged){
 RoundedRectangle(cornerRadius: 22)
     .foregroundStyle(Color.blue)
     .ignoresSafeArea()
     .overlay(
         pills
             .padding(.top,400)
             .offset(x: isAnimating ? 100 : 1)
             .animation(.easeInOut(duration: 10).repeatForever(autoreverses: true), value: isAnimating)
     )
 
}
else {
 mouj()
     .foregroundStyle(Color.blue)
     .ignoresSafeArea()
     .overlay(
         pills
             .padding(.top,400)
             .offset(x: isAnimating ? 100 : 1)
             .animation(.easeInOut(duration: 10).repeatForever(autoreverses: true), value: isAnimating)
 )
}
 */
