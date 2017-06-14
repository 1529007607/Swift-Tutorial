//: Playground - noun: a place where people can play

import Foundation

let configuretion = URLSessionConfiguration.ephemeral
let session = URLSession(configuration: configuretion, delegate: nil, delegateQueue: OperationQueue.main)
let task = session.dataTask(with: URL(string: "https://www.baidu.com")!) {(data, response, error) in
    // Parse the data in the response and use it
}
task.resume()

struct Question {}

class NetworkController {
    static let questionsURL = "https://www.baidu.com"
    static let usersURL = "https://www.baidu.com"
    
    func loadQuestions(_ urlString: String, withCompletion completion: @escaping ([Any]?) -> Void) {
        let url = URL(string: urlString)!
        let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: url) {(data: Data?, response: URLResponse?, error: Error?) in
            guard let data = data else {
                completion(nil)
                return
            }
            guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
                completion(nil)
                return
            }
            let result: [Any]
            switch urlString {
            case NetworkController.questionsURL:
                result = [] // Transform JSON into Question values
            case NetworkController.usersURL:
                result = [] // Transform JSON into user values
            default:
                result = []
            }
            completion(result)
        }
        task.resume()
    }
}