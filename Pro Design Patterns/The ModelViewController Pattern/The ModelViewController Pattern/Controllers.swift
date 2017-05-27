//
//  Controllers.swift
//  The ModelViewController Pattern
//
//  Created by Andrew Chai on 5/27/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

class ControllerBase {
    fileprivate let repository: Repository
    fileprivate let nextController: ControllerBase?
    
    init(repo: Repository, nextController: ControllerBase?) {
        self.repository = repo
        self.nextController = nextController
    }
    
    func handleCommand(_ command: Command, _ data: [String]) -> View? {
        return nextController?.handleCommand(command, data)
    }
}

class PersonController: ControllerBase {
    override func handleCommand(_ command: Command, _ data: [String]) -> View? {
        switch command {
        case .listPeople:
            return listAll()
        case .addPerson:
            return addPerson(data[0], data[1])
        case .deletePerson:
            return deletePerson(data[0])
        case .updatePerson:
            return updatePerson(data[0], data[1])
        case .search:
            return search(data.first)
        default:
            return super.handleCommand(command, data)
        }
    }
    
    private func listAll() -> View {
        return PersonListView(data: repository.people)
    }
    
    private func addPerson(_ name: String, _ city: String) -> View {
        repository.addPerson(Person(name, city))
        return listAll()
    }
    
    private func deletePerson(_ name: String) -> View {
        repository.removePerson(name)
        return listAll()
    }
    
    private func updatePerson(_ name: String, _ newCity: String) -> View {
        repository.updatePerson(name, newCity)
        return listAll()
    }
    
    private func search(_ term: String?) -> View? {
        if let term = term {
            let termLower = term.lowercased()
            let matches = repository.people.filter { (person) -> Bool in
                return person.name.lowercased().range(of: termLower) != nil || person.city.lowercased().range(of: termLower) != nil
            }
            return PersonListView(data: matches)
        }
        return nil
    }
}


class CityController: ControllerBase {
    override func handleCommand(_ command: Command, _ data: [String]) -> View? {
        switch command {
        case .listCities:
            return listAll()
        case .searchCities:
            return search(data[0])
        case .deleteCity:
            return delete(data[0])
        default:
            return super.handleCommand(command, data)
        }
    }
    
    private func listAll() -> View {
        return CityListView(data: repository.people.map{ $0.city }.unique())
    }
    
    private func search(_ city: String) -> View {
        let cityLower = city.lowercased()
        let matches: [Person] = repository.people.filter{ $0.city.lowercased() == cityLower }
        return PersonListView(data: matches)
    }
    
    private func delete(_ city: String) -> View {
        let cityLower = city.lowercased()
        let toDelete = repository.people.filter{ $0.city.lowercased() == cityLower }
        for person in toDelete {
            repository.removePerson(person.name)
        }
        return PersonListView(data: repository.people)
    }
}













