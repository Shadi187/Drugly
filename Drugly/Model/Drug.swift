//
//  Drug.swift
//  Drugly
//
//  Created by boshFbt on 24/01/2024.
//

import SwiftUI
import PhotosUI


struct Drug:Identifiable {
    
    var id = UUID()
    var genName:String
    var trName:String
    var Dose:String
    var DDescription:String
    var Image:UIImage?
    var url:String
    var color:UIColor
}




