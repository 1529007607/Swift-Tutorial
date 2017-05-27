//: Playground - noun: a place where people can play

import Foundation

class Owner: NSObject, NSCopying {
    var name: String
    var city: String
    
    init(name: String, city: String) {
        self.name = name
        self.city = city
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        print("Copy")
        return Owner(name: name, city: city)
    }
}

class FlyweightFactory {
    class func createFlyweight() -> Flyweight {
        return Flyweight()
    }
    
    private static let ownerSingleton = Owner(name: "Anonymous", city: "Anywhere")
}

class Flyweight {
    private let extrinsicOwner: Owner
    private var intrinsicOwner: Owner?
    
    init(owner: Owner) {
        self.extrinsicOwner = owner
    }
    
    var name: String {
        get {
            return intrinsicOwner?.name ?? extrinsicOwner.name
        }
        set {
            decoupleFromExtrinsic()
            intrinsicOwner?.name = newValue
        }
    }
    
    var city:String {
        get {
            return intrinsicOwner?.city ?? extrinsicOwner.city
        }
        set (value) {
            decoupleFromExtrinsic()
            intrinsicOwner?.city = value
        }
    }
    
    private func decoupleFromExtrinsic() {
        if let intrinsicOwner = intrinsicOwner {
            intrinsicOwner = extrinsicOwner.copy() as? Owner
        }
    }
}