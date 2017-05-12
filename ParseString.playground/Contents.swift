//: Playground - noun: a place where people can play

import UIKit

var str = "#Hello#, play#gr#ound"

var arr = str.components(separatedBy: "#")

var resultStr = NSMutableAttributedString(string: str)

for (i, s) in arr.enumerated() {
    var attrs = [String: Any]()
    if i % 2 == 0 {
        
    } else {
        attrs[NSFontAttributeName] = UIFont.boldSystemFont(ofSize: 20)
    }
    let range = NSRange(location: i, length: s.characters.count)
    resultStr.addAttributes(attrs, range: range)
}

print(resultStr)
