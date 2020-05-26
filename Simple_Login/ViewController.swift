//
//  ViewController.swift
//  Simple_Login
//
//  Created by mac on 2020/05/26.
//  Copyright © 2020 UkJin. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    private let loginViewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        usernameTextField.becomeFirstResponder()
        usernameTextField.rx.text.map{ $0 ?? "" }.bind(to: loginViewModel.usernameTextPublishSubject).disposed(by: disposeBag)
        passwordTextField.rx.text.map{ $0 ?? "" }.bind(to: loginViewModel.passwordTextPublishSubject).disposed(by: disposeBag)
        loginViewModel.isVaild().bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
        loginViewModel.isVaild().map{ $0 ? 1 : 0.1}.bind(to: loginButton.rx.alpha).disposed(by: disposeBag)
    }
    @IBAction func tappedLoginButton(_ sender: UIButton) {
        print("Tapped Button")
    }
    

}

