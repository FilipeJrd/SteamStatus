//
//  SteamStatusDataProvider.swift
//  API
//
//  Created by Filipe Jordão on 14/04/19.
//

import Alamofire
import RxSwift

public class SteamStatusDataProvider: SteamStatusProvider {
    let disposeBag = DisposeBag()

    public init() {
        
    }

    public func status() -> Single<SteamStatusResponse> {
        return Single<SteamStatusResponse>.create { single  in
            let request = AF.request("https://crowbar.steamstat.us/Barney")
            
            request.responseDecodable { (response: DataResponse<SteamStatusResponse>) in
                switch response.result {
                case let .success(obj):
                    single(.success(obj))
                case let .failure(error):
                    single(.error(error))
                }
            }

            return Disposables.create {
                request.cancel()
            }
        }
    }
}
