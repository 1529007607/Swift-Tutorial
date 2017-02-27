//: Playground - noun: a place where people can play

import UIKit

var s = "aa bb -[:/?&=;+!@#$()',*]";

let sEncode = s.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)

let sDecode = sEncode?.removingPercentEncoding
print(sDecode ?? "")