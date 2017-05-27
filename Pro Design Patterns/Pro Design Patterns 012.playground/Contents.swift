//: Playground - noun: a place where people can play

import UIKit

var builder = DateComponents()

builder.hour     = 10
builder.day      = 6
builder.month    = 9
builder.year     = 1940
builder.calendar = Calendar(identifier: .gregorian)

var date = builder.date
print(date!)

