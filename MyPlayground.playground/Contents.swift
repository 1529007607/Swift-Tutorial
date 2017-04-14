//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class AbstractClass: NSCoding {
    required init() {
        
    }
    
    required convenience init(wkt: String) {
        self.init()
        self.wkt = wkt
    }
    
    var wkt: String?
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(wkt, forKey: "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        
    }
}


