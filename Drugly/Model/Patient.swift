//
//  Patient.swift
//  Drugly
//
//  Created by boshFbt on 24/01/2024.
//

import Foundation


struct Patient:Identifiable {
    var id = UUID().uuidString
    var name:String 
}
