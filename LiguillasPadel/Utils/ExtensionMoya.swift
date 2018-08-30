//
//  ExtensionMoya.swift
//  LiguillasPadel
//
//  Created by Alvaro Blazquez on 30/8/18.
//  Copyright © 2018 Alvaro Blazquez Montero. All rights reserved.
//

import Moya
import Alamofire

class MoyaProviderConnection<Target: TargetType>: MoyaProvider<Target> {
    
    let reachabilityManager = NetworkReachabilityManager()
    
    var isReachable: Bool {
        return reachabilityManager?.isReachable ?? true
    }
    
    func waitConnection(action: @escaping () -> Void ) {
        reachabilityManager?.startListening()
        reachabilityManager?.listener = { _ in
            if let isNetworkReachable = self.reachabilityManager?.isReachable,
                isNetworkReachable == true {
                action()
            }
        }
    }
    
}
