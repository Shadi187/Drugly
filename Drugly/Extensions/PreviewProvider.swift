//
//  PreviewProvider.swift
//  Drugly
//
//  Created by boshFbt on 24/01/2024.
//

import SwiftUI

extension PreviewProvider{
    static var dummyData:DeveloperPreview{
        return DeveloperPreview.instance
    }
}

class DeveloperPreview{
    static let instance = DeveloperPreview()
//     var dummyDrug:Drug = Drug(genName: "Paracetamol", trName: "Panadol", Dose: "122", Description: "For Headache",Image: UIImage(named:"Paracetamol")!)
//    
//    var dummyDrugs: [Drug] = [
//        Drug(genName: "Paracetamol", trName: "Panadol", Dose: "122", Description: "For Headache",Image: UIImage(named:"Paracetamol")!),
//        Drug(genName: "Tramadol", trName: "Panadol", Dose: "122", Description: "For Headache",Image: UIImage(named:"Paracetamol")!),
//        Drug(genName: "Citrizene", trName: "Panadol", Dose: "122", Description: "For Headache",Image: UIImage(named:"Paracetamol")!)
//    
//    ]
//    
    var emptyDummyDrugs2 : [Drug] = []
    
    var emptyDummyPatients:[Patient] = [] 
        
    
}
