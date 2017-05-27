//: Playground - noun: a place where people can play

class Printer {
    func printMessage(_ message: String) {
        print(message)
    }
}

let printerObject = Printer()
printerObject.printMessage("Hello")

Printer.printMessage(printerObject)("Hello")
