//
//  FIleManager.swift
//  Drugly
//
//  Created by boshFbt on 29/01/2024.
//

import Foundation
import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    
    func saveImage(data:Data?, imageName:String, folderName:String) -> URL?{
//        Create folder if didn't yet (will run on the first time only)
        createFolderIfNeeded(folderName: folderName)
//        print("FOLDER CREATED SUCCESSFULLY")
        guard let url = getURLForImage(imageName: imageName, folderName: folderName) else {return nil}
//        print("WE'VE GOT THE URL SUCCESSFULLY AND IT IS \(url.absoluteString)")
        do {
            if let data {
                try data.write(to: url)
//                print("DATA CONVERTED SUCCESSFULLY")
            }
            else{
                
            }
            
        }catch let error{
            print("ERROR WITH SAVING THE DATA!! \(error)")
            return nil
        }
        return url
    }
    
    func getImage(url:URL) -> UIImage? {
        var image = UIImage(contentsOfFile: url.path)
        return image
    }
    
    private func createFolderIfNeeded(folderName:String){
        guard let url = getURLForFolder(folderName: folderName) else {return}
        if !FileManager.default.fileExists(atPath: url.path){
            do {
                try FileManager.default.createDirectory(at:url,withIntermediateDirectories: true)
            }catch let error {
                print("ERROR IN CREATING THE FILE \(error)")
            }
        }
    }
    
    private func getURLForFolder(folderName:String) -> URL? {
        guard let url = FileManager.default.urls(for: .documentDirectory, in:.userDomainMask).first else{
            return nil
        }
        return url.appendingPathComponent(folderName)
    }
    
    
    private func getURLForImage(imageName:String, folderName:String) ->URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else { return nil}
        return folderURL.appendingPathComponent("\(imageName)" + ".png")
    }
    
}
