//
//  Auth.swift
//  The Proxy Pattern
//
//  Created by Andrew Chai on 5/23/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class UserAuthentication {
    var user: String?
    var authenticated: Bool = false
    
    private init() {
        // do nothing - stops instances beign created
    }
    
    func authenticate(user: String, pass: String) {
        if pass == "secret" {
            self.user = user
            self.authenticated = true
        } else {
            self.user = nil
            self.authenticated = false
        }
    }
    
    static let shared = UserAuthentication()
}
