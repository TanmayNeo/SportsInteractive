//
//  MatchListViewModel.swift
//  SportsInteractiveAssignment
//
//  Created by Tanmay on 03/03/23.
//

import Foundation
class MatchListViewModel {
    
    var matchesArray = [MatchList]()
    private let repository:Repository
    private let dispatchGroup = DispatchGroup()
    var reloadTable : (() -> Void)?
    
    init(repository: Repository){
        self.repository = repository
    }
    
    ///Makes asynchronous API calls to get the list of matches and reloads the table after the data or an error has been received
    func getMatchDetails () {
        matchesArray = []
        dispatchGroup.enter()
        repository.getMatchList(.matchList1, toModel: MatchList.self) { response in
            switch response {
            case .success(let matchList) :
                self.matchesArray.append(matchList)
            case .failure(_) :
                print("Failed")
            }
            self.dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        repository.getMatchList(.matchList2, toModel: MatchList.self) { response in
            switch response {
            case .success(let matchList) :
                self.matchesArray.append(matchList)
            case .failure(_) :
                print("Failed")
            }
            self.dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            print("Notified")
            self.reloadTable?()
        }
    }
}

struct DateFormator {
    static let dateFormatter = DateFormatter()
    static func getFormatedString(strDate: String) ->String? {
        guard let matchDate = dateFormatter.date(from: strDate) else { return ""}
        return dateFormatter.string(from: matchDate)
    }
}

