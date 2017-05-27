//: Playground - noun: a place where people can play

let hearts = "Hearts <3 ❤️💘"
if let i = hearts.characters.index(of: " ") {
    let j = i.samePosition(in: hearts.utf8)
    print(Array(hearts.utf8.prefix(upTo: j)))
}