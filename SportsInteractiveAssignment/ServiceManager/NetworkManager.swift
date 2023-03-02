//
//  NetworkManager.swift
//  SportsInteractiveAssignment
//
//  Created by apple on 01/03/23.
//

import Foundation
import Alamofire

enum EndPoints : String {
    case matchList1 = "/nzin01312019187360.json"
    case matchList2 = "/sapk01222019186652.json"
}

class NetworkManager {
    static let shared = NetworkManager()
    let basePath = "https://demo.sportz.io"
        
    func getData <T : Codable> (_ endpoint : EndPoints,
                                toModel : T.Type,
                                completionHandler : @escaping ((Result<T , Error>) -> ()))  {
        let urlPath = basePath + endpoint.rawValue
        guard let url = URL(string: urlPath) else {
            print ("URL didn't get converted")
            return
        }
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        session.dataTask(with: request) { _data, _, _ in
            guard let data = _data else {
                print ("Something went wrong")
                return
            }
            
            do {
                let data = try JSONDecoder().decode(toModel, from: data)
                completionHandler(.success(data))
            } catch let err {
                print("error \(err.localizedDescription)")
                completionHandler(.failure(err))
            }
            
        }.resume()
    }
}
