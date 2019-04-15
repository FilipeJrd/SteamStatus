//
//  ViewController.swift
//  SteamStatus
//
//  Created by Filipe Jordão on 14/04/19.
//

import UIKit
import API
import RxSwift

class ViewController: UIViewController {
    let provider = SteamStatusDataProvider()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        provider.status()
        .debug("resultado", trimOutput: true)
            .subscribe(onSuccess: { (_) in
            
            }, onError: nil)
            .disposed(by: disposeBag)
    }


}

