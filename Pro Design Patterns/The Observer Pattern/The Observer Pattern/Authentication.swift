//
//  Authentication.swift
//  The Observer Pattern
//
//  Created by Andrew Chai on 5/25/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class AuthenticationManager: ShortLivedSubject {
    
    @discardableResult
    func authenticate(user: String, pass: String) -> Bool {
        var nType = NotificationTypes.fail
        if user == "bob" && pass == "secret" {
            nType = .success
            print("User \(user) is authenticated")
        } else {
            print("Failed authenticatino attempt")
        }
        sendNotification(CLNotification(type: nType, data: user))
        return nType == .success
    }
}
