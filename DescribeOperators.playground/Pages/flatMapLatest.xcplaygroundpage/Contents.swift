//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next flatMapWithIndex](@next)
example("flatMapLatest") {
    let sequence:Observable<Int> = Observable.of(10, 20, 30)
    let flatMapSequence = sequence.flatMapLatest{val in Observable.of(0, 1, 2)
        .map{"\($0) - \(val)"
        }
    }
    flatMapSequence.subscribe { e in
        print(e)
    }
}

example("flatMapLatest with delay") {
    let subjectA = Observable<Int>.create{ observer in
        delay(0) {
            observer.on(.Next(10))
        }
        delay(3) {
            observer.on(.Next(20))
        }
        delay(5) {
            observer.onCompleted()
        }
        return NopDisposable.instance
        }.debug("sA")
    let subjectB = Observable<Int>.create{ observer in
        delay(0) {
            observer.on(.Next(100))
        }
        delay(1) {
            observer.on(.Next(200))
        }
        delay(2) {
            observer.onCompleted()
        }
        return NopDisposable.instance
        }.debug("sB")
    
    let subjectC = Observable<Int>.create{ observer in
        delay(0) {
            observer.on(.Next(1000))
        }
        delay(1) {
            observer.on(.Next(2000))
        }
        delay(2) {
            observer.onCompleted()
        }
        return NopDisposable.instance
        }.debug("sC")
    
    let subjects = [subjectA, subjectB, subjectC]
    let sequence:Observable<Int> = createSequenceWithWait([0, 1, 2],waitTime:1) {$0}
        .debug("sequence")
    let flatMapSequence:Observable<Int> = sequence.flatMapLatest{val in
        return subjects[val].asObservable()
        }.debug("flatMapSequence")
    flatMapSequence.subscribe { e in
        print(e)
    }
}
