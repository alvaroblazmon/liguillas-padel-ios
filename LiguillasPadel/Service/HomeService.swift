//
//  HomeService.swift
//  LiguillasPadel
//
//  Created by Alvaro Blazquez on 30/8/18.
//  Copyright © 2018 Alvaro Blazquez Montero. All rights reserved.
//

import Moya

enum HomeService {
    case main
}

extension HomeService: TargetType {

    var baseURL: URL { return URL(string: Constant.URLAPI)! }
    var path: String {
        switch self {
        case .main:
            return "total.php"
        }
    }
    var method: Moya.Method {
        switch self {
        case .main:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .main:
            return .requestPlain
            //let parameters = ["token": ""]
            //return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    var sampleData: Data {
        switch self {
        case .main:
            return "".utf8Encoded
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
