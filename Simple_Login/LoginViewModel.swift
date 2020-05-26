//
//  LoginViewModel.swift
//  Simple_Login
//
//  Created by mac on 2020/05/26.
//  Copyright © 2020 UkJin. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel{
    let usernameTextPublishSubject = PublishSubject<String>()
    let passwordTextPublishSubject = PublishSubject<String>()
    
    func isVaild() -> Observable<Bool> {
        Observable.combineLatest(usernameTextPublishSubject.asObserver().startWith(""), passwordTextPublishSubject.asObserver().startWith("")).map{ username, password in
            return username.count > 3 && password.count > 3
        }.startWith(false)
    }
}
