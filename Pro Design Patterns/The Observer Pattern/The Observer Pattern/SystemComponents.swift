//
//  SystemComponents.swift
//  The Observer Pattern
//
//  Created by Andrew Chai on 5/25/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

class ActivityLog: Observer {
    func notify(_ notification: CLNotification) {
        print("Auth request for \(notification.type.rawValue). Success: \((notification.data as? String) ?? "")")
    }
    
    func logActivity(_ activity: String) {
        print("Log: \(activity)")
    }
}

class FileCache: Observer {
    func notify(_ notification: CLNotification) {
        if let authenNotification = notification as? AuthenticationNotification,
            authenNotification.requestSuccessed,
            let userName = authenNotification.userName
            {
            loadFiles(userName)
        }
    }
    
    func loadFiles(_ user: String) {
        print("Load files for \(user)")
    }
}

class AttackMonitor: MetaObserver {
    func notifySubjectCreated(_ subject: Subject) {
        if subject is AuthenticationManager {
            subject.addObserver(self)
        }
    }
    
    func notifySubjectDestroyed(_ subject: Subject) {
        subject.removeObserver(self)
    }
    
    func notify(_ notification: CLNotification) {
        monitorSuspiciousActivity = notification.type == .fail
    }
    
    var monitorSuspiciousActivity: Bool = false {
        didSet {
            print("Monitoring for attack: \(monitorSuspiciousActivity)")
        }
    }
}
