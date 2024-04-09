//
//  OnboardingViewModel.swift
//  Drugly
//
//  Created by boshFbt on 29/01/2024.
//
//
//

import SwiftUI

class OnboardingViewModel:ObservableObject{
    //MARK: - PROPERTIES
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    var welcomingPhrases:[String] = [
        "Welcome to drugly App",
        "The place where all your drugs will be stored",
        "You can Start using it by clicking on the button below"]
    
    @Published var isAnimating:Bool = false
    @Published var nameOfUser: String = ""
    @Published var placeHolder:String = "You can't touch me right now"
    @Published var disInab:Bool = true
    @Published var stateIndex: Int = 0

    //MARK: - FUNCTIONS
    
    func checkInput() -> Bool{
        return stateIndex != 2 && !nameOfUser.isEmpty
    }
    
    
}
