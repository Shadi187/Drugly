//
//  DruglyApp.swift
//  Drugly
//
//  Created by boshFbt on 23/01/2024.
//

import SwiftUI

@main
struct DruglyApp: App {
//    var dummyDrugs: [Drug] = [
//        Drug(genName: "Paracetamol", trName: "Panadol", Dose: "122", Description: "For Headache",Image: UIImage(named:"Paracetamol")!),
//        Drug(genName: "Tramadol", trName: "Panadol", Dose: "122", Description: "For Headache",Image: UIImage(named:"Paracetamol")!),
//        Drug(genName: "Citrizene", trName: "Panadol", Dose: "122", Description: "For Headache",Image: UIImage(named:"Paracetamol")!)
//    
//    ]
//    
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    @StateObject var vm =  DruglyViewModel()
    @StateObject var bvm = OnboardingViewModel()
    @StateObject var avm = AddDrugViewModel()
    var dummyPatients:[Patient] = []
    
    var body: some Scene {
        WindowGroup {
            if(!isOnboarding){
            OnBoardingScreen()
                    .environmentObject(bvm)
            }
            else {
                ContentView(patients: dummyPatients)
                    .environmentObject(vm)
                    .environmentObject(avm)
            }
        }
    }
}
