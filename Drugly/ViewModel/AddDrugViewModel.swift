//
//  File.swift
//  Drugly
//
//  Created by boshFbt on 29/01/2024.
//

import Foundation
import SwiftUI
import PhotosUI
import Combine


class AddDrugViewModel:ObservableObject{
    //MARK: - PROPERTIES
    @Published var tempDrug:Drug = Drug(genName: "", trName: "", Dose: "", DDescription: "", url: "dasdsad",color:.black)
    
    @Published var genName:String = ""
    @Published var trName:String = ""
    @Published var Dose:String = ""
    @Published var Descrip:String = ""
    @Published var url:String = ""
    
    @Published var isGenValid:Bool = false
    @Published var isTrValid:Bool = false
    @Published var isDoseValid:Bool = false
    @Published var isDescriptionValid:Bool = false
    
    @Published var isAllValid:Bool = false
    @Published var startedTyping:Bool = false
    
    @Published var buttonColor:UIColor = .gray
    @Published var Colors:[Color] = [
        .white,
        .white,
        .white,
        .white
        
    ]
    @Published var selectedColor:Color = .black
    @Published var photoHolder:PhotosPickerItem? = nil
    @Published var convertedImage:UIImage?
    @Published var savedData:Data?
    
    private var cancellableSet = Set<AnyCancellable>()
    init(){
        $genName
            .map{ name in
                return name.count > 3
            }
            .assign(to: \.isGenValid, on: self)
            
            .store(in:&cancellableSet)
        
        $trName
            .map{ name in
                return name.count > 3
            }
            .assign(to: \.isTrValid, on: self)
            .store(in:&cancellableSet)
        
        $Dose
            .map{ name in
                return !name.isEmpty
            }
            .assign(to: \.isDoseValid, on: self)
            .store(in:&cancellableSet)
        
        $Descrip
            .map{ name in
                return name.count > 3
            }
            
            .assign(to: \.isDescriptionValid, on: self)
            .store(in:&cancellableSet)
        
        Publishers.CombineLatest4($isGenValid,$isTrValid,$isDoseValid,$isDescriptionValid)
            .map{ isGValid, isTValid, isDValid, isDDValid in
                    return(isGValid && isTValid && isDValid && isDDValid)
            }
            .assign(to: \.isAllValid, on: self)
            .store(in: &cancellableSet)
    }
    
    
    //MARK: - FUNCTIONS
    
    func saveDrug(){
        tempDrug.genName = genName
        tempDrug.trName = trName
        tempDrug.Dose = Dose
        tempDrug.DDescription = Descrip
        //TODO: CHECK IF THERE IS A FILE WITH THIS NAME IF THERE IS THEN ADD A NUMBER TO IT
        let name = "\(genName)_\(trName)"
        
        tempDrug.url = LocalFileManager.instance.saveImage(data: savedData ?? nil, imageName: name, folderName: "Drugs_Pics_Folder")?.absoluteString ?? ""
//        print("\(tempDrug.url)")
        tempDrug.color = UIColor(selectedColor)
        CoreDataManager.instance.addDrugs(drug: tempDrug)
        
        emptyInputs()
//        tempDrug.id = UUID()
    }
 
    func emptyInputs(){
        genName = ""
        trName = ""
        Dose = ""
        Descrip = ""
    }
    
    
}

