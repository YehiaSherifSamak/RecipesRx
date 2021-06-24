//
//  LoginViewModel.swift
//  RecipiesRX
//
//  Created by Yehia Samak on 24/06/2021.
//

import Foundation
import RxSwift

class LoginViewModel{
    let emailTextSubject = PublishSubject<String>()
    let passwordTextSubject = PublishSubject<String>()
    
    
    func isValid() -> Observable<Bool>{
        return Observable.combineLatest(emailTextSubject.asObserver(), passwordTextSubject.asObserver()).map{[weak self] email, password in
            return  self?.isValid(email: email) ?? false && self!.isValid(password: password)
        }
    }
    
   private func isValid(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func isValid(password: String) -> Bool{
        let passwordRegEx = "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
    
    
}
