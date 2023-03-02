//
//  MatchListViewModel.swift
//  SportsInteractiveAssignment
//
//  Created by apple on 02/03/23.
//

import Foundation

class MatchListViewModel {
    
    var firstMatch : MatchList?
    var secondMatch : MatchList?
    var matchesArray : [MatchList?]?
    private let repository = Repository.shared
    private let dispatchGroup = DispatchGroup()
    var reloadTable : (() -> Void)?
    
    init(){
        
    }
    
    func getMatchDetails () {
        dispatchGroup.enter()
        repository.getMatchList(.matchList1, toModel: MatchList.self) { response in
            switch response {
            case .success(let matchList) :
                self.firstMatch = matchList
            case .failure(_) :
                print("Failed")
            }
            self.dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        repository.getMatchList(.matchList2, toModel: MatchList.self) { response in
            switch response {
            case .success(let matchList) :
                self.secondMatch = matchList
            case .failure(_) :
                print("Failed")
            }
            self.dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            print("Notified")
            self.matchesArray = []
            self.matchesArray?.append(self.firstMatch)
            self.matchesArray?.append(self.secondMatch)
            self.reloadTable?()
        }
    }
    
    func getHomeTeam (index : Int) -> Team? {
        let teamID = self.matchesArray?[index]?.matchdetail.teamHome
        guard let teams = self.matchesArray?[index]?.teams else { return nil}
        
        for (key, value) in teams {
            if key == teamID {
                return value
            }
        }
        
        return nil
    }
    
    func getAwayTeam (index : Int) -> Team? {
        let teamID = self.matchesArray?[index]?.matchdetail.teamAway
        guard let teams = self.matchesArray?[index]?.teams else { return nil}
        
        for (key, value) in teams {
            if key == teamID {
                return value
            }
        }
        
        return nil
    }
    
    func getHomeTeamShortName (index : Int) -> String? {
        return getHomeTeam(index: index)?.nameShort
    }
    
    func getAwayTeamShortName (index : Int) -> String? {
        return getAwayTeam(index: index)?.nameShort
    }
    
    func getTimings(index : Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/dd/yyyy"
        let dateString = self.matchesArray?[index]?.matchdetail.match.date ?? "" //"\(self.matchesArray?[index]?.matchdetail.match.date ?? "") \(self.matchesArray?[index]?.matchdetail.match.time ?? "")"
        guard let matchDate = dateFormatter.date(from: dateString) else { return ""}
        
        return dateFormatter.string(from: matchDate)
    }
    
    func getVenue (index: Int) -> Venue? {
        return self.matchesArray?[index]?.matchdetail.venue
    }
    
    
    
}

extension Date {
    func getDateStringFromStringWanted(string: String, timeZone: TimeZone? = nil) -> String? {
           let formatter = DateFormatter()
           formatter.timeZone = timeZone
           formatter.dateFormat = DateFormattor.yyyyMMddHHmmss.rawValue
           let dateObj = formatter.date(from: string) ?? self
           formatter.dateFormat = DateFormattor.yyyyMMddHHmmss.rawValue
           let newDate = formatter.string(from: dateObj)
           return newDate
       }
}

enum DateFormattor:String {
    case HHMMAMPM = "HH:mma"
    case monthDateHHMMAMPM = "LLL dd hh:mma"
    case yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss"
    case yyyyMMdd = "yyyy-MM-dd"
    case yyyyMMddHHmmssa = "yyyy-MM-dd HH:mm"
    case MMMdhmma = "MMM. d, h:mm a"
    case HHmm = "h:mm a"
    case d = "dd"
    case yy = "yyyy"
    case HH = "HH"
    case MM = "mm"
    case mm = "MM"
    case MMddyyyyhmma = "MM/dd/yyyy h:mm a"
    case yyyyMMddhmma = "yyyy-MM-dd h:mm a"
    case ddMMyyyyhmma = "dd-MM-yyyy h:mm a"
}
