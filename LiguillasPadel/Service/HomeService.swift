//
//  HomeService.swift
//  LiguillasPadel
//
//  Created by Alvaro Blazquez on 30/8/18.
//  Copyright © 2018 Alvaro Blazquez Montero. All rights reserved.
//

import Foundation

/// Actions for Service of the Web Views
enum WebViewService {
    /// Represent a call to main screen
    case main
}

/// WebViewService Implementation
extension WebViewService {
    var baseURL: URL { return URL(string: Constant.URLAPI)! }
    var path: URL {
        switch self {
        case .main:
            return URL(string: "https://www.nutritienda.com")!
        }
    }
}
