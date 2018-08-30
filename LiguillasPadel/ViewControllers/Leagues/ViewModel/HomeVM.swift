//
//  HomeVM.swift
//  LiguillasPadel
//
//  Created by Alvaro Blazquez on 30/8/18.
//  Copyright © 2018 Alvaro Blazquez Montero. All rights reserved.
//

import SwiftyJSON
import Moya

/// View Model of country
///
/// - Parent: `ListVM`
/// - Generic: `CountryItemVM` , `WakeUpService`
/*class CountryVM: ListVM<CountryItemVM, WakeUpService> {
    
    /// Get the info of the countries with the Api Service
    /// Delagate the response to his ViewController
    ///
    /// - Returns:            If everythings is OK, call render delegate else call render delegate with error
    ///
    /// - Remark:             If viewDelegate is nil, return a fatalError
    /// - SeeAlso:            `ViewModelDelegate.render(state: ProcessViewState)`
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
        
        apiService.request(.wakeup) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    _ = try moyaResponse.filterSuccessfulStatusCodes()
                    let json = try JSON(data: moyaResponse.data)["response"].arrayValue
                    self.data = json.map({ CountryItemVM(Country(json: $0)) })
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
        if let countryItemVM = itemAtIndex(index) {
            UserDF.oldUser = true
            UserDF.geoZone = countryItemVM.id
            coordinator.performTransition(transition: AppTransition.goHome)
        }
    }
    
}*/
