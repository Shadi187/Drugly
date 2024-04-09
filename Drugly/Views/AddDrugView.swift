//
//  AddDrugView.swift
//  Drugly
//
//  Created by boshFbt on 29/01/2024.
//

import SwiftUI
import PhotosUI

struct AddDrugView: View {
    @EnvironmentObject var vm: AddDrugViewModel
    var body: some View {
        ZStack(){
            VStack{
                ZStack{
                    PreviewCard(genName: vm.genName, trName: vm.trName, Dose: vm.Dose, url:vm.url, strokeColor: vm.selectedColor)
                }
                
                
                ZStack{
                    allInputs
                }
                
            }
            if vm.showSuccess {
                AddedSuccessfully()
            }
        }
    }
}


#Preview {
    AddDrugView()
        .environmentObject(AddDrugViewModel())
}

extension AddDrugView{
    var allInputs: some View{
        VStack(spacing:10){
            Text("Add New Drug")
                .font(.title)
                .fontWeight(.bold)
            addPhoto
            genName
            trName
            dose
            description
            pickColor
            addButton
        }
        
    }
    
    var addPhoto: some View {
        PhotosPicker(selection: $vm.photoHolder, photoLibrary: .shared(), label: {
            Text((vm.photoHolder != nil) ? "Change Image" : "Add Image" )
                    .kerning(2)
                    
            }).onChange(of:vm.photoHolder){_,_ in
            
                Task{
                    //PhotoPickerItem --> Data
                    if let loaded = try? await vm.photoHolder?.loadTransferable(type: Data.self){
                        
                    vm.savedData = loaded
                }else {
                    print("Failed")
                }
            }
        }
        
    }
    
    var genName: some View {
        TextField("GenericName", text: $vm.genName)
            .textContentType(.name)
//            .textEditorStyle(.automatic)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 19)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.black)
                    .foregroundStyle(vm.Colors[0])
            )
            .padding()
            
            
    }
    
    var trName: some View {
        TextField("TradeName", text: $vm.trName)
            .textContentType(.name)
//            .textEditorStyle(.automatic)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 19)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.black)
                    
            )
            .padding()
            
    }
    
    var dose: some View {
        TextField("Dose", text: $vm.Dose)
            .textContentType(.name)
//            .textEditorStyle(.automatic)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 19)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.black)
                    
            )
            .padding()
    }
    
    var description: some View {
        TextField("Description", text: $vm.Descrip)
            .textContentType(.name)
//            .textEditorStyle(.automatic)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 19)
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.black)
                    
            )
            .padding()
            
    }

    var pickColor: some View {
        ColorPicker("PickColor", selection:$vm.selectedColor , supportsOpacity: false)
            .labelsHidden()
    }
    
    var addButton: some View {
        Text("Finish")
            .foregroundStyle(.black)
            .font(.headline)
            .frame(width:160,height:50)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(vm.isAllValid ? UIColor.orange : vm.buttonColor))
            )
            
            .onTapGesture {
                if(vm.isAllValid){
                    vm.saveDrug()
                }else{
                    
                }
            }
            
        
    }
}
