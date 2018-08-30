//
//  HomeVM.swift
//  LiguillasPadel
//
//  Created by Alvaro Blazquez on 30/8/18.
//  Copyright © 2018 Alvaro Blazquez Montero. All rights reserved.
//

import SwiftyJSON
import Moya

class HomeVM: ListVM<LeagueItemVM, HomeService> {
    
    func reloadData() {
        guard let viewDelegate = self.viewDelegate else {
            fatalError("ViewModel without view delegate")
        }
        viewDelegate.render(state: .loading)
        
        if !apiService.isReachable {
            viewDelegate.render(state: .error(.connectionError))
            apiService.waitConnection {
                self.reloadData()
            }
            return
        }
        
        apiService.request(.main) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    _ = try moyaResponse.filterSuccessfulStatusCodes()
                    if let json = try JSON(data: moyaResponse.data).dictionary,
                        let leagues = json["leagues"] {
                        self.data = leagues.arrayValue.map { LeagueItemVM(League(json: $0)) }
                    }
  
                    viewDelegate.render(state: .loaded(Process.Main))
                } catch {
                    viewDelegate.render(state: .error(.other))
                }
            case .failure:
                viewDelegate.render(state: .error(.other))
            }
        }
    }
    
    /// Call to coordinator to go to the next screen
    func didSelectItemAt(index: Int) {
        if let leagueItemVM = itemAtIndex(index) {
            let transition = HomeTransition.goCalendar(calendarItemVM: leagueItemVM.calendar, parent: leagueItemVM)
            coordinator.performTransition(transition: transition)
        }
    }
    
}
