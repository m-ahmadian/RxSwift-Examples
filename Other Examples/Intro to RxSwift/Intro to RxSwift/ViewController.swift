//
//  ViewController.swift
//  Intro to RxSwift
//
//  Created by Mehrdad Ahmadian on 2021-12-13.
//  Intro to RxSwift | Login Validation with MVVM by James Haville - Raywenderlich

// https://www.youtube.com/watch?v=0Z5AiFvPUB4

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginEnabledLabel: UILabel!

    // MARK: - Properties
    var loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        _ = emailTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.emailText)
        _ = passwordTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.passwordText)

        _ = loginViewModel.isValid.bind(to: loginButton.rx.isEnabled)


        loginViewModel.isValid.subscribe(onNext: { [unowned self] isValid in
            self.loginEnabledLabel.text = isValid ? "Enabled" : "Not Enabled"
            self.loginEnabledLabel.textColor = isValid ? .green : .red
            print("isValid: \(isValid)")
        }).disposed(by: disposeBag)
    }


}
