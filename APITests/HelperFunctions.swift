//
//  HelperFunctions.swift
//  APITests
//
//  Created by Filipe Jordão on 14/04/19.
//

import Foundation

func obj<T: Codable>(from dict: [String: Any]) -> T? {
    let wrappedJson = try? JSONSerialization.data(withJSONObject: dict, options: [])
    guard let json = wrappedJson else { return nil }

    return try? JSONDecoder().decode(T.self, from: json)
}
