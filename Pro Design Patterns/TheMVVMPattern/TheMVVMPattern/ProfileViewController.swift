//
//  ViewController.swift
//  TheMVVMPattern
//
//  Created by Andrew Chai on 5/31/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return ProfileSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = ProfileSection(rawValue: section) else { return 1 }
        
        switch section {
        case .warmUp:
            return profileViewModel.numberOfRows(for: .warmUp)
        case .coolDown:
            return profileViewModel.numberOfRows(for: .coolDown)
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = ProfileSection(rawValue: section) else { return "" }
        return section.sectionTitle()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = ProfileSection(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch section {
        case .time:
            return cellForTimeSectionRow(at: indexPath)
        case .warmUp:
            return cellForWarmUpSectionRow(at: indexPath)
        case .coolDown:
            return cellForCoolDownSectionRow(at: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    private func cellForCoolDownSectionRow(at indexPath: IndexPath) -> UITableViewCell {
        let result = UITableViewCell()
        
//        switch indexPath.row {
//        case 0: break
//        case 1: break
//        case 2: break
//        default: break
//            
//        }
        return result
    }
    
    private func cellForWarmUpSectionRow(at indexPath: IndexPath) -> UITableViewCell {
        let result = UITableViewCell()
//        switch indexPath.row {
//        case 0:
//            if let cell = tableView.dequeueReusableCell(
//        default:
//            <#code#>
//        }
        return result
    }
    
    private func cellForTimeSectionRow(at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.profileCellIdentifier, for: indexPath) as? ProfileTableViewCell else { return UITableViewCell() }
        
        cell.detailTextLabel?.text = ""
        cell.textLabel?.text = profileViewModel.timeForProfile()
        return cell
    }
}

class ProfileViewController: UIViewController {

    var profileViewModel: ProfileViewModel!
    
    @IBOutlet weak var tableView: UITableView!
}

