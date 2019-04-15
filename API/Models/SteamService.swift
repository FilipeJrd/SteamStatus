//
//  SteamService.swift
//  API
//
//  Created by Filipe Jordão on 14/04/19.
//

import Foundation

public struct SteamService {
    public struct Info: Codable {
        public let status: Status
        public let title: String
        public let time: Int?
    }

    public enum Status: String, Codable {
        case good = "good"
        case minor = "minor"
    }
}
