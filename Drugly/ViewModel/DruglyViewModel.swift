//
//  DruglyViewModel.swift
//  Drugly
//
//  Created by boshFbt on 27/01/2024.
//

import SwiftUI
import CoreData
import Combine

class DruglyViewModel:ObservableObject {
    //MARK: - PROPERTIES
    
    //FOR DOCTOR'S NAME
    @AppStorage  ("isOnboarding") var isOnboarding:Bool?
    //USING THE COREDATA
    @Published var Drugss:[Medic] = []
     var FilteredDrugs:[Medic] {
        guard !searchText.isEmpty else { 
//            print("isEmpty")
            return Drugss}
        return Drugss.filter { Medic in
//            print("isNotEmpty")
            return (Medic.gen_name?.contains(searchText))!
            
        }
    }
    @Published var Drugs:[Drug] = []
    
    private var cancellabels = Set<AnyCancellable>()
    
    //Animations Variables
    
    var isFlipped:Bool = false
    @Published var backDegree:Double = 0.0
    @Published var frontDegree:Double = -90.0
    let duration:CGFloat = 0.3
    @Published var degrees:Double = 0.0
    @Published var currentCard:Int = 0
    
    //ADDING DRUGS
    @Published var isAddingDrug:Bool = false
    @Published var searchText:String = "" 
    init(){
        getDrugs()
    }
    
    
    //MARK: - FUNCTIONS
    
    func getDrugs(){
        self.Drugss = CoreDataManager.instance.getDrugs()
    }
    
    
    func updateDrugs(){
        self.Drugss = CoreDataManager.instance.updateDrugs()
    }
    
    
    func flipCard(){
        isFlipped.toggle()
        
        if isFlipped{
            withAnimation(.linear(duration: duration)){
                self.backDegree = 90
            }
            
            withAnimation(.linear(duration:duration).delay(duration)){
                self.frontDegree = 0
            }
        }
        else {
            withAnimation(.linear(duration: duration)){
                self.frontDegree = -90
            }
            
            withAnimation(.linear(duration:duration).delay(duration)){
                self.backDegree = 0
            }
        }
    }
    
    

    
    func fetchData(url:String) -> UIImage? {
        let location = URL(string:url)
        var data:Data?
        var conImage:UIImage?
        if let location {
            do { data = try Data(contentsOf: location)
                if let data {
//                    print("THERE IS DATA HERE!")
                    conImage = UIImage(data: data)
                }else {
//                    print("DATA IS NIL")
                    return nil
                }
            }
            
            catch{ print("Error Getting the url")} }
        
        return conImage
    }
    
    func deleteDrug(item:IndexSet){
        guard let index = item.first else {return}
        let entity = Drugss[index]
        Drugss.remove(atOffsets: item)
        CoreDataManager.instance.deleteDrug(entity: entity,item:item)
        print("After Deletion\(Drugss.count)")
    }
    
    
}




/*
 PhotoPickerItem -> UIImage -> Data
 
 Data -> UIImage
 
 */
