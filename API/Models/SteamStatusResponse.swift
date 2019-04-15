//
//  SteamStatusResponse.swift
//  API
//
//  Created by Filipe Jordão on 14/04/19.
//

import Foundation

public struct SteamStatusResponse: Codable {
    public let success: Bool
    public let time: Int
    public let online: Double
    public let services: [String: SteamService.Info]
}
