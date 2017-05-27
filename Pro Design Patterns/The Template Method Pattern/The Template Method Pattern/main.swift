//
//  main.swift
//  The Template Method Pattern
//
//  Created by Andrew Chai on 5/26/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

let donorDb = DonorDatabase()

let galaInvitations = donorDb.generate(2)
for invite in galaInvitations {
    print(invite)
}

class NewDonors: DonorDatabase {
    override func filter(_ donors: [Donor]) -> [Donor] {
        return donors.filter{ $0.lastDonation == 0 }
    }
    
    override func generate(_ donors: [Donor]) -> [String] {
        return donors.map{ "Hi \($0.firstName)" }
    }
}

let newDonor = NewDonors()
for invite in newDonor.generate(Int.max) {
    print(invite)
}
		
