//
//  CoreDataManager.swift
//  Drugly
//
//  Created by boshFbt on 29/01/2024.
//

import Foundation
import CoreData
import UIKit

final class CoreDataManager{
    static let instance = CoreDataManager() //SINGELTON
    
    @Published var savedEntities:[Medic] = []
    
    let container:NSPersistentContainer
//    var viewContext:NSManagedObjectContext {
//        return container.viewContext
//    }
     init(){
        container = NSPersistentContainer(name: "Drugs")
        container.loadPersistentStores { (Description, error) in
            if let error = error {
//                fatalError("ERROR IN GENERATING DATA \(error)")
            }else{
//                print("LOADED SUCCESSFULLY")
            }
        }
         
         savedEntities = getDrugs()
    }
    

        //LOAD THE DRUGS FROM THE DATABASE
    
    func getDrugs()-> [Medic]{
        let request = NSFetchRequest<Medic>(entityName:"Medic")
//        let savedEntities:[Medic]
        do {
             savedEntities = try container.viewContext.fetch(request)
            
//            print("Successfully GETTING THE DRUGS")
            return savedEntities
        } catch{
            return []
        }
    }
    
    
    //ADD NEW DRUGS TO THE DATABASE
    func addDrugs(drug d: Drug){
        //VARIABLES
        var tempMedic = Medic(context: container.viewContext)

        
        //ASSIGNING NEW VALUES TO THE VARIABLES
        tempMedic.id = UUID()
        print("\(String(describing: tempMedic.id?.uuidString))")
        tempMedic.gen_name = d.genName
//        print("\(tempMedic.gen_name ?? "nothin")")
        tempMedic.tr_name = d.trName
        tempMedic.dose = d.Dose
        tempMedic.ddescription = d.DDescription
        tempMedic.url = d.url
        tempMedic.color = d.color
//        print("Added Successfully")
        savedEntities.append(tempMedic)
        
        saveDrugs()
        
    }
    
    func updateDrugs()->[Medic]{
        return savedEntities
//        return []
    }
    
    func saveDrugs(){
        do{
            try container.viewContext.save()
        }catch let error{
            print("ERROR OCCURED \(error)")
        }
    }
    
    func deleteDrug(entity:Medic,item:IndexSet){
        guard let index = item.first else {return}
        let entity = savedEntities[index]
        savedEntities.remove(atOffsets: item)
        container.viewContext.delete(entity)
        print("before deletion \(savedEntities.count) ")
        saveDrugs()
        updateDrugs()
    }
}
