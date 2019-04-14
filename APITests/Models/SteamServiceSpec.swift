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

class SteamServiceSpec: QuickSpec {
    override func spec() {
        steamServiceInfoSpec()
    }

    func steamServiceInfoSpec() {
        describe("SteamService.Info") {
            context("When decoding from a JSON") {
                context("And there is no time info") {
                    let json = ["status": "good", "title": "11,223,456"]
                    let sut: SteamService.Info? = obj(from: json)

                    serviceInfoShouldMatchStatus(sut: sut, dict: json)
                    serviceInfoShouldMatchTitle(sut: sut, dict: json)

                    it("Shouldn't have a time attribute") {
                        expect(sut?.time).to(beNil())
                    }
                }

                context("And there are all attributes") {
                    let json: [String: Any] = [
                        "status": "good",
                        "title": "Normal",
                        "time": 1555194116
                    ]
                    let sut: SteamService.Info? = obj(from: json)

                    serviceInfoShouldMatchStatus(sut: sut, dict: json)
                    serviceInfoShouldMatchTitle(sut: sut, dict: json)
                    serviceInfoShouldMatchTime(sut: sut, dict: json)
                }
            }
        }
    }

    func serviceInfoShouldMatchStatus(sut: SteamService.Info?, dict: [String: Any]) {
        it("Should match the status attribute") {
            let status = dict["status"] as? String
            expect(sut?.status.rawValue).to(equal(status))
        }
    }

    func serviceInfoShouldMatchTitle(sut: SteamService.Info?, dict: [String: Any]) {
        it("Should match the title attribute") {
            let title = dict["title"] as? String
            expect(sut?.title).to(equal(title))
        }
    }

    func serviceInfoShouldMatchTime(sut: SteamService.Info?, dict: [String: Any]) {
        it("Should match the time attribute") {
            let title = dict["time"] as? Int
            expect(sut?.time).to(equal(title))
        }
    }
}
