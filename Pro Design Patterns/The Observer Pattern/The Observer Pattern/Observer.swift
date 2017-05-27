//
//  Observer.swift
//  The Observer Pattern
//
//  Created by Andrew Chai on 5/25/17.
//  Copyright © 2017 Carl Lee. All rights reserved.
//

import Foundation

/// Generalizing notifications
enum NotificationTypes: String {
    case success = "authenation success"
    case fail = "authenation fail"
    /// Dealing with short lived subjects
    case create = "subject create"
    case destroy = "subject destory"
}

class CLNotification {
    let type: NotificationTypes
    let data: Any?
    
    init(type: NotificationTypes, data: Any?) {
        self.type = type
        self.data = data
    }
}

class AuthenticationNotification: CLNotification {
    init(user: String, success: Bool) {
        super.init(type: success ? .success : .fail, data: user)
    }
    
    var userName: String? {
        return data as? String
    }
    
    var requestSuccessed: Bool {
        return type == .success
    }
}

protocol Observer: class {
    func notify(_ notification: CLNotification)
}

protocol Subject {
    func addObserver(_ observers: Observer...)
    func removeObserver(_ observer: Observer)
}

/// Using weak references to observers
fileprivate class WeakObserverReference {
    weak var observer: Observer?
    
    init(observer: Observer) {
        self.observer = observer
    }
}

class SubjectBase: Subject {
    private var observers = [WeakObserverReference]()
    private var collectionQueue = DispatchQueue(label: "colQ", qos: .userInteractive, attributes: .concurrent, autoreleaseFrequency: .workItem)
    
    func addObserver(_ observers: Observer...) {
        _ = collectionQueue.sync(flags: .barrier) {
            for newOb in observers {
                self.observers.append(WeakObserverReference(observer: newOb))
            }
        }
    }
    
    func removeObserver(_ observer: Observer) {
        _ = collectionQueue.sync(flags: .barrier, execute: {
            observers = observers.filter{ weakref in
                return weakref.observer != nil && weakref.observer !== observer
            }
        })
    }
    
    func sendNotification(_ notification: CLNotification) {
        collectionQueue.sync {
            for ob in observers {
                ob.observer?.notify(notification)
            }
        }
    }
}
