//
//  CardViewModel.swift
//  Drugly
//
//  Created by boshFbt on 15/02/2024.
//

import Foundation
import SwiftUI

class CardViewModel:ObservableObject {
    @Published var tempGenName:String = ""
    @Published var tempTRName:String = ""
    @Published var tempDose:String = ""
    @Published var tempPhoto:Image? = nil
    @Published var tempColor:Color? = nil
    
}
