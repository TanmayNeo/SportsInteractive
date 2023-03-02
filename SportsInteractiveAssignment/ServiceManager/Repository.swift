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
