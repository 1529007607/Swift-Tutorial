//
//  PetsListViewController.swift
//  DogsCats
//
//  Created by Andrew Chai on 2/22/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit
import CoreData

// MARK: - fetch update & delete data

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
        switch petVariety {
        case PetVariety.dog.rawValue:
            let dog = Dog()
            dogs.append(dog)
            initializePet(dog as Pet, variety: petVariety)
            DataParse.save(dog.data)
            break
        case PetVariety.cat.rawValue:
            let cat = Cat()
            cats.append(cat)
            initializePet(cat as Pet, variety: petVariety)
            DataParse.save(cat.data)
            break
        default:
            break
        }
        
        tableView.reloadData()
    }
    
    fileprivate func deleteData(_ indexPath: IndexPath) {
        switch indexPath.section {
        case PetVariety.dog.rawValue:
            let dog = dogs[indexPath.row]
            DataParse.Delete(dog)
            dogs.remove(at: indexPath.row)
            break
        case PetVariety.cat.rawValue:
            let cat = cats[indexPath.row]
            DataParse.Delete(cat)
            cats.remove(at: indexPath.row)
            break
        default:
            break
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    private func initializePet(_ pet: Pet, variety: Int) {
        pet.name = "little black"
        pet.attack = 3
        pet.blood = 3
        pet.defense = 3
        pet.intimacy = 3
        pet.magic = 3
        pet.variety = PetVariety(rawValue: variety)!
        pet.creationTime = Date()
    }
}

// MARK: - fields, properties, life cycle & business logic

class PetsListViewController: UITableViewController {
    
    fileprivate var dogs: [Dog] = []
    fileprivate var cats: [Cat] = []
    
    fileprivate var collapseSecondaryController = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitViewController?.delegate = self
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

// MARK: - delegate methods

extension PetsListViewController {
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.deleteData(indexPath)
        }
        
        return [deleteAction]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        collapseSecondaryController = false
    }
}

// MARK: - dataSource methods

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
    
}

// MARK: - SplitViewController Delegate

extension PetsListViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return collapseSecondaryController
    }
}
