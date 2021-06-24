//
//  LoginViewController.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 24/06/2021.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextFeild: UITextField!
    @IBOutlet weak var passwordTextFeild: UITextField!
   
    @IBOutlet weak var loginButton: UIButton!
    
    var viewModel: LoginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEmailTextFeild()
        setupPasswordTextFeild()
        viewModel.isValid().bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
    }
    
    func setupEmailTextFeild(){
        emailTextFeild
            .rx
            .text
            .throttle(0.5, scheduler: MainScheduler.instance)
            .map{$0 ?? "" }
            .bind(to: viewModel.emailTextSubject)
            .disposed(by: disposeBag)

    }
    func setupPasswordTextFeild(){
        passwordTextFeild
            .rx
            .text
            .throttle(0.5, scheduler: MainScheduler.instance)
            .map{$0 ?? "" }
            .bind(to: viewModel.passwordTextSubject)
            .disposed(by: disposeBag)
    }
    

    @IBAction func loginButtonPressed(_ sender: Any) {
       
    }
    

}
