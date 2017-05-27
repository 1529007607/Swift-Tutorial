//: Playground - noun: a place where people can play

import UIKit

class Person: NSObject, NSCopying {
    var name: String
    var country: String
    
    init(name: String, country: String) {
        self.name = name
        self.country = country
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Person(name: name, country: country)
    }
}

func deepCopy(data: [Any]) -> [Any] {
    return data.map({ (item) -> Any in
        if item is NSCopying && item is NSObject {
            return (item as! NSObject).copy()
        } else {
            return item
        }
    })
}

var people = [Person(name: "Joe", country: "France"),
              Person(name: "Bob", country: "USA")]
var otherpeople = deepCopy(data: people) as! [Person]

people[0].country = "UK"
print("Country: \(otherpeople[0].country)")