//
//  SteamService.swift
//  API
//
//  Created by Filipe Jordão on 14/04/19.
//

import Foundation

struct SteamService {
    struct Info: Codable {
        let status: Status
        let title: String
        let time: Int?
    }

    enum Status: String, Codable {
        case good = "good"
        case minor = "minor"
    }
}
