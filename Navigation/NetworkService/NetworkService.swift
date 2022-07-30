//
//  NetworkService.swift
//  Navigation
//
//  Created by Владлен on 22.07.2022.
//

import Foundation

struct NetworkService {
    
    private static let sharedSession = URLSession.shared
//
//    let url = URL(string: "https://jsonplaceholder.typicode.com/todos/5")!
//
//    private func jsonSerialuzation(data: String) -> String {
//        var recievedTitle = ""
//        let string = Data(data.utf8)
//        do {
//            if let json = try JSONSerialization.jsonObject(with: string, options: []) as? [String: Any] {
//                if let title = json["title"] as? String {
//                    recievedTitle = title
//                }
//            }
//            }
//        catch let error as NSError {
//            print("Faled to load \(error.localizedDescription)")
//            let emptyTitle = "No Title"
//            recievedTitle = emptyTitle
//        }
//        return recievedTitle
//    }
    
    static func dataTask(url: URL, completion: @escaping (String?) -> Void) {
        let task = sharedSession.dataTask(
            with: url
        ) { data, response, error in
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return }
            print(httpResponse.statusCode)
            print(httpResponse.allHeaderFields as! [String: Any])
            if let data = data {
                completion(String(data: data, encoding: .utf8))
            }
        }
        task.resume()
    }
}



