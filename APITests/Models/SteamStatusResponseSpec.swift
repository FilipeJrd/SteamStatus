//
//  SteamStatusResponseSpec.swift
//  APITests
//
//  Created by Filipe Jordão on 14/04/19.
//

import Foundation
import Quick
import Nimble

@testable import API

class SteamStatusResponseSpec: QuickSpec {
    override func spec() {
        describe("SteamStatusResponse") {
            context("When decoding from a JSON") {
                let json: [String: Any] = [
                    "success": true,
                    "time": 1555198438,
                    "online": 99.5,
                    "services": [
                        "cms": [
                            "status": "good",
                            "title": "99.5% Online",
                            "time": 1554940577
                        ],
                        "cms-ws": [
                            "status": "good",
                            "title": "100.0% Online",
                            "time": 1554852270
                        ]
                    ]
                ]
                let sut: SteamStatusResponse? = obj(from: json)

                it("Should match the success attribue") {
                    let success = json["success"] as? Bool

                    expect(sut?.success).to(equal(success))
                }

                it("Should match the time attribute") {
                    let time = json["time"] as? Int

                    expect(sut?.time).to(equal(time))
                }

                it("Should match the online attribute") {
                    let online = json["online"] as? Double

                    expect(sut?.online).to(equal(online))
                }

                it("Should contain the correct ammount of services") {
                    let services = json["services"] as? [String: Any]
                    let servicesCount = services?.count

                    expect(sut?.services.count).to(equal(servicesCount))
                }
            }
        }
    }
}
