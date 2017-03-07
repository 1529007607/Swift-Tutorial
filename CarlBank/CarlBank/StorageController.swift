//
//  StorageController.swift
//  CarlBank
//
//  Created by Andrew Chai on 3/6/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

// Model controllers manager the model
class StorageController {
    fileprivate let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    fileprivate var accountsFileURL: URL {
        return documentsDirectoryURL.appendingPathComponent("Accounts").appendingPathExtension("plist")
    }
    
    func save(_ accounts: [Account]) {
        let accountPlist = accounts.map{ $0.plistRepresentation } as NSArray
        accountPlist.write(to: accountsFileURL, atomically: true)
    }
    
    func fetchAccounts() -> [Account] {
        guard let accountPlists = NSArray(contentsOf: accountsFileURL) as? [[String: AnyObject]] else { return [] }
        return accountPlists.map(Account.init(plist: ))
    }
}
