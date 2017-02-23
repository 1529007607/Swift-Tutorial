//
//  DataParse.swift
//  DogsCats
//
//  Created by Andrew Chai on 2/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit
import CoreData

public class DataParse {
    
    public class func save(_ data: [String: Any]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let moc = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "DataEntity", in: moc)!
        let dataEntity = DataEntity(entity: entity, insertInto: moc)
        dataEntity.setValuesForKeys(data)
        do {
            try moc.save()
        } catch {
            fatalError("\(error)")
        }
    }
    
    public class func fetch() -> [Pet]{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [] }
        
        let moc = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<DataEntity>(entityName: "DataEntity")
        do {
            let datas = try moc.fetch(fetchRequest)
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
        } catch {
            print("Could not fetch data. \(error)")
        }
        
        return []
    }
    
    public class func Delete(_ pet: Pet) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let moc = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<DataEntity>(entityName: "DataEntity")
        fetchRequest.predicate = NSPredicate(format: "(creationTime == %@) AND (name == %@)", pet.creationTime as CVarArg, pet.name)
        
        do {
            let results = try moc.fetch(fetchRequest)
            for object in results {
                moc.delete(object)
            }
            do {
                try moc.save()
            } catch {
                fatalError("\(error)")
            }
        } catch {
            fatalError("\(error)")
        }
    }
    
    private class func initializePet(_ pet: Pet, with data: DataEntity) {
        pet.name = data.name!
        pet.attack = Int(data.attack)
        pet.blood = Int(data.blood)
        pet.defense = Int(data.defense)
        pet.intimacy = Int(data.intimacy)
        pet.magic = Int(data.magic)
        pet.variety = PetVariety(rawValue: Int(data.variety))!
        pet.creationTime = data.creationTime as! Date
    }
    
}
