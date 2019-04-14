//
//  SteamStatusResponse.swift
//  API
//
//  Created by Filipe Jordão on 14/04/19.
//

import Foundation

struct SteamStatusResponse: Codable {
    let success: Bool
    let time: Int
    let online: Double
    let services: [String: SteamService.Info]
}
