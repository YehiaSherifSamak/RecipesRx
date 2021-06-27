//
//  LoginViewModel.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 24/06/2021.
//

import Foundation
import RxSwift

class LoginViewModel{
    //MARK: Public Attribute
    let emailTextSubject = PublishSubject<String>()
    let passwordTextSubject = PublishSubject<String>()
    let title = "Login"
    
    //MARK: Private attribute
    private weak var coordinator: LoginCoordinator?
    
    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }
}
//MARK: Public Functions
extension LoginViewModel{
    
    func isValid() -> Observable<Bool>{
        return Observable.combineLatest(emailTextSubject.asObserver(), passwordTextSubject.asObserver()).map{[weak self] email, password in
            return  self?.isValid(email: email) ?? false && self!.isValid(password: password)
        }
    }
    
    func loginButtonTapped(){
        coordinator?.startRecipes()
    }
}
//MARK: Private Function
extension LoginViewModel{
    
   private func isValid(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func isValid(password: String) -> Bool{
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
}
