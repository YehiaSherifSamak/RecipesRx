//
//  LoginViewModelTests.swift
//  RecipiesRXTests
//
//  Created by Yehia Samak on 28/06/2021.
//

import XCTest
import RxSwift
import RxTest
import RxBlocking
import RxCocoa

@testable import RecipiesRX

class LoginViewModelTests: XCTestCase {

    var sut: LoginViewModel!
    var scheduler: TestScheduler!
    var subscription: Disposable!
    override func setUp(){
        super.setUp()
       sut = LoginViewModel(coordinator: LoginCoordinator(navigationController: UINavigationController()) )
        scheduler = TestScheduler(initialClock: 0)
    }

    override func tearDown() {
        scheduler.scheduleAt(1000) {
            self.subscription.dispose()
            self.sut = nil
        }
        scheduler = nil
        super.tearDown()
        
    }

    func test_isValid_WrongEmailAndValidpassword_false(){
        //Given
        let observer = scheduler.createObserver(Bool.self)
        _ = scheduler.createHotObservable([.next(10, ""), .next(100, "tes"), .next(200, "test@test"), .next(300, "test@test,com")]).bind(to: sut.emailTextSubject)
        _ = scheduler.createHotObservable([.next(11, "Test1234")]).bind(to: sut.passwordTextSubject)
       
        
        // when
        subscription = sut.isValid().subscribe(observer)
        scheduler.start()
        
        //then
        let results = observer.events.compactMap{$0.value.element}
        for result in results{
            XCTAssertFalse(result)
        }
    }
    
    func test_isValid_validEmailAndWrongPassword_false(){
        
        //Given
        let observer = scheduler.createObserver(Bool.self)
        _ = scheduler.createHotObservable([.next(20, "test@test.com")]).bind(to: sut.emailTextSubject)
        _ = scheduler.createHotObservable([.next(100, ""), .next(200, "a"), .next(300, "abcdefgtizk"), .next(400, "1234567890")]).bind(to: sut.passwordTextSubject)
        
        
        //when
        subscription = sut.isValid().subscribe(observer)
        scheduler.start()
        
        //then
        let results = observer.events.compactMap{$0.value.element}
        for result in results{
            XCTAssertFalse(result)
        }
    }
    
    func test_isValid_validEmailAndValidPassword_True(){
        //Given
        let observer = scheduler.createObserver(Bool.self)
        _ = scheduler.createHotObservable([.next(100, "test@test.com"), .next(200, "t@t.co"), .next(300, "z@z.net"), .next(400, "f@f.fr")]).bind(to: sut.emailTextSubject)
        _ = scheduler.createHotObservable([.next(100, "Test1234"), .next(200, "abcdefg1"), .next(300, "1234567Y"), .next(400, "12345qwery")]).bind(to: sut.passwordTextSubject)
        
        //when
        subscription = sut.isValid().subscribe(observer)
        scheduler.start()
        
        //then
        let results = observer.events.compactMap{$0.value.element}
        for result in results{
            XCTAssertTrue(result)
        }
    }
    


}
