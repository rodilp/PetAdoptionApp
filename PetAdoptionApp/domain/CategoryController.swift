//
//  CategoryController.swift
//  PetAdoptionApp
//
//  Created by Rodil Pampañaupa Velasque on 30/06/22.
//

import Foundation

class CategoryController{
    var categories: [LocalCategory] = []
    //var apiCategories: [Category] = []
    
    init(categories: [LocalCategory]){
        self.categories = categories
    }
    
    
    func loadLocalCategory(apiCategories: [Category] ){
        if(!apiCategories.isEmpty){
            apiCategories.forEach { category in
               /* if(category.name == "Todos"){
                    categories.append(LocalCategory(idCategory: category.idCategory, name: category.name, isSelected: true))
                }*/
                categories.append(LocalCategory(idCategory: category.idCategory, name: category.name, isSelected: false))
            }
        }
    }
    
    func getCategories() -> [LocalCategory] {
        return categories
    }
    
    func updateSelected(idCategory:Int) -> [LocalCategory]{
        
        var newList:[LocalCategory] = []
        
        categories.forEach { cat in
            newList.append(LocalCategory(idCategory: cat.idCategory, name: cat.name, isSelected: false))
        }
        categories = newList
        
        /*for i in 0..<(categories.count) {
             var item = categories[i]
             item.isSelected = false
         }*/
        
        print("todo Falso",categories)
        
        let index = getIndex(idCategory: idCategory)
        
        var item = categories[index]
        item.isSelected = true
        categories.remove(at: index)
        categories.insert(item, at: index)


        print("nuevo true", categories)
        
        return categories
        
    
        
        
    }
    
    func getIndex(idCategory:Int) -> Int {
      
        let index = categories.firstIndex(where: { cat in
                cat.idCategory == idCategory
        }) ?? -1
            
        return index
   
    }
    
    
    
    
    
    
    
}
