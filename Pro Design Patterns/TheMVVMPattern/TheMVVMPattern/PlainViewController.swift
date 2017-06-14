//
//  PlainViewController.swift
//  TheMVVMPattern
//
//  Created by Andrew Chai on 5/31/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import UIKit

class PlainViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.profileSegueIdentifier {
            if let profileViewController = segue.destination as? ProfileViewController {
                profileViewController.profileViewModel = ProfileViewModel(withProfile: Profile())
            }
        }
    }
}
