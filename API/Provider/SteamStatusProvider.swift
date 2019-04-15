//
//  SteamStatusProvider.swift
//  API
//
//  Created by Filipe Jordão on 14/04/19.
//

import Foundation
import RxSwift

public protocol SteamStatusProvider {
    func status() -> Single<SteamStatusResponse>
}
