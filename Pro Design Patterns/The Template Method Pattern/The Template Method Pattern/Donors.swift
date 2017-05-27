//
//  Donors.swift
//  The Template Method Pattern
//
//  Created by Andrew Chai on 5/26/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

struct Donor {
    
    let title: String
    let firstName: String
    let familyName: String
    let lastDonation: Float
    
}

class DonorDatabase {
    private var donors: [Donor]
    
    init() {
        donors = [
            Donor(title: "Ms", firstName: "Anne", familyName: "Jones", lastDonation: 0),
            Donor(title: "Mr", firstName: "Bob", familyName: "Smith", lastDonation: 100),
            Donor(title: "Dr", firstName: "Alice", familyName: "Doe", lastDonation: 200),
            Donor(title: "Prof", firstName: "Joe", familyName: "Davis", lastDonation: 320)
        ]
    }
    
    func filter(_ donors: [Donor]) -> [Donor] {
        return donors.filter{ $0.lastDonation > 0 }
    }
    
    func generate(_ donors: [Donor]) -> [String] {
        return donors.map{ "Dear \($0.title). \($0.familyName)" }
    }
    
    func generate(_ maxNumber: Int) -> [String] {
        // step 1 - filter out non-donors
        var targetDonors: [Donor] = filter(donors)
        
        // step 2 - order donors by last donation
        targetDonors.sort(by: orderDescend)
        
        // step 3 - limit the number of invitees
        if targetDonors.count > maxNumber {
            targetDonors = Array(targetDonors.prefix(maxNumber))
        }
        
        // step 4 - generate the invitations
        return generate(targetDonors)
    }
    
    func orderDescend(lhs: Donor, rhs: Donor) -> Bool {
        return lhs.lastDonation > rhs.lastDonation
    }
}
