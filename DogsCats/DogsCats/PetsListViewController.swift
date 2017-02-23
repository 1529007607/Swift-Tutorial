//
//  PetsListViewController.swift
//  DogsCats
//
//  Created by Andrew Chai on 2/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit
import CoreData

extension PetsListViewController {
    fileprivate func setupData() {
        let pets = DataParse.fetch()
        for pet in pets {
            if pet is Dog {
                dogs.append(pet as! Dog)
            }
            if pet is Cat {
                cats.append(pet as! Cat)
            }
        }
    }
    
    fileprivate func savePet(_ petVariety: Int) {
        let dog = Dog()
        dog.name = "little black"
        dog.attack = 3
        dog.blood = 3
        dog.defense = 3
        dog.intimacy = 3
        dog.magic = 3
        dog.variety = .dog
        
        DataParse.save(dog.data)
        dogs.append(dog)
        tableView.reloadData()
    }
}

class PetsListViewController: UITableViewController {
    
    var dogs: [Dog] = []
    var cats: [Cat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
    }
    
    @IBAction func AddNewPet(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add a pet", message: "add a pet to play with", preferredStyle: .alert)
        let addDogAction = UIAlertAction(title: "add a dog", style: .default) { action in
            self.savePet(PetVariety.dog.rawValue)
        }
        let addCatAction = UIAlertAction(title: "add a cat", style: .default) { action in
            self.savePet(PetVariety.cat.rawValue)
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
        alertController.addAction(addDogAction)
        alertController.addAction(addCatAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
}

extension PetsListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return PetVariety.allValues.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case PetVariety.dog.rawValue: return dogs.count
        case PetVariety.cat.rawValue: return cats.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "petCell", for: indexPath)
        switch indexPath.section {
        case PetVariety.dog.rawValue:
            let dog = dogs[indexPath.row]
            cell.textLabel?.text = dog.name
            break
        case PetVariety.cat.rawValue:
            let cat = cats[indexPath.row]
            cell.textLabel?.text = cat.name
            break
        default:
            break
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "showPetDetail",
            let indexPath = tableView.indexPathForSelectedRow,
            let dest = segue.destination as? UINavigationController,
            let petDetailVC = dest.topViewController as? PetDetailViewController {
            
            switch indexPath.section {
            case PetVariety.dog.rawValue:
                petDetailVC.pet = dogs[indexPath.row]
                break
            case PetVariety.cat.rawValue:
                petDetailVC.pet  = cats[indexPath.row]
                break
            default:
                break
            }
        
        }
    }
}
