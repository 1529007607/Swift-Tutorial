//
//  MetaObserver.swift
//  The Observer Pattern
//
//  Created by Andrew Chai on 5/25/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

protocol MetaObserver: Observer {
    func notifySubjectCreated(_ subject: Subject)
    func notifySubjectDestroyed(_ subject: Subject)
}

class MetaSubject: SubjectBase, MetaObserver {
    func notifySubjectCreated(_ subject: Subject) {
        sendNotification(CLNotification(type: .create, data: subject))
    }
    
    func notifySubjectDestroyed(_ subject: Subject) {
        sendNotification(CLNotification(type: .destroy, data: subject))
    }
    
    static let shared = MetaSubject()
    
    func notify(_ notification: CLNotification) {
        // do nothing - required for observer conformance
    }
}

class ShortLivedSubject: SubjectBase {
    override init() {
        super.init()
        MetaSubject.shared.notifySubjectCreated(self)
    }
    
    deinit {
        MetaSubject.shared.notifySubjectDestroyed(self)
    }
}
