//
//  LoginViewModel.swift
//  Intro to RxSwift
//
//  Created by Mehrdad Ahmadian on 2021-12-13.
//

import Foundation
import RxSwift
import RxRelay

struct LoginViewModel {

    var emailText = BehaviorRelay<String>(value: "")
    var passwordText = BehaviorRelay<String>(value: "")

    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailText.asObservable(), passwordText.asObservable()) { email, password in
            email.count >= 3 && password.count >= 3
        }
    }

}
