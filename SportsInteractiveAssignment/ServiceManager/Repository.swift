//
//  Repository.swift
//  SportsInteractiveAssignment
//
//  Created by apple on 02/03/23.
//

import Foundation

class Repository {
    static let shared = Repository()
    private let networkManager = NetworkManager.shared
    
    private init(){
        
    }
    
    ///Returns the list of matches
    ///Parameters :
    /// 1. endPoint - A string from the Endpoints enum
    /// 2. toModel - The specific response model to which the data is to be parsed
    /// 3. completion - An escaping closure that would take either the success response or an error if occurred
    func getMatchList ( _ endPoint : EndPoints, toModel: MatchList.Type , completion : @escaping ((Result<MatchList, Error>) -> ())){
        
        networkManager.getData(endPoint, toModel: MatchList.self) { result in
            switch result {
            case .success(let matchData) :
                completion(.success(matchData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
