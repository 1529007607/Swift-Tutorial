//
//  DataParse.swift
//  DogsCats
//
//  Created by Andrew Chai on 2/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit
import CoreData

class DataParse {
    
    class func save(_ data: [String: Any]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "DataEntity", in: managedContext)!
        let dataEntity = DataEntity(entity: entity, insertInto: managedContext)
        dataEntity.setValuesForKeys(data)
        do {
            try managedContext.save()
        } catch let error {
            print("Could not save. \(error)")
        }
    }
    
    class func fetch() -> [Pet]{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<DataEntity>(entityName: "DataEntity")
        do {
            let datas = try managedContext.fetch(fetchRequest)
            var pets: [Pet] = []
            for data in datas {
                switch Int(data.variety) {
                case PetVariety.dog.rawValue:
                    let dog = Dog()
                    pets.append(dog)
                    initializePet(dog as Pet, with: data)
                    break
                case PetVariety.cat.rawValue:
                    let cat = Cat()
                    pets.append(cat)
                    initializePet(cat as Pet, with: data)
                    break
                default:
                    break
                }
            }
            return pets
        } catch let error {
            print("Could not fetch data. \(error)")
        }
        
        return []
    }
    
    private class func initializePet(_ pet: Pet, with data: DataEntity) {
        pet.name = data.name!
        pet.attack = Int(data.attack)
        pet.blood = Int(data.blood)
        pet.defense = Int(data.defense)
        pet.intimacy = Int(data.intimacy)
        pet.magic = Int(data.magic)
        pet.variety = PetVariety(rawValue: Int(data.variety))!
    }
    
}
