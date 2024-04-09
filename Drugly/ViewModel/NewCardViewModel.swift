//
//  NewCardViewModel.swift
//  Drugly
//
//  Created by boshFbt on 18/02/2024.
//

import Foundation
import SwiftUI


class NewCardViewModel:ObservableObject {
    
    
    init(){
        
    }
    
     func fetchData(url:String) -> UIImage? {
        let location = URL(string:url)
        var data:Data?
        var convertedImg:UIImage?
        if let location {
            do { data = try Data(contentsOf: location)
                if let data {
//                    print("THERE IS DATA HERE!")
                    convertedImg = UIImage(data: data)
                }else {
//                    print("DATA IS NIL")
                    return nil
                }
            }
            
            catch{ print("Error Getting the url")} }
        
        return convertedImg
    }
}
