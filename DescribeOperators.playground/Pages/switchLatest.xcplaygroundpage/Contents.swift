//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true


//: [Next take](@next)0

example("switchLatest") {
    let varA = Variable<Int>(0)
    let varB = Variable<Int>(100)
    
    let proxyVar = Variable(varA.asObservable())
    let concatSequence = proxyVar.asObservable().switchLatest()
    
    concatSequence.subscribe { e in
        print(e)
    }
    varA.value = 1
    varA.value = 2
    varB.value = 3
    proxyVar.value = varB.asObservable()
    varB.value = 4
    varA.value = 5
}


example("switchLatest") {
    let observableA = Observable<Int>.create{ observer in
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
        }.debug("oA")
    let observableB = Observable<Int>.create{ observer in
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
        }.debug("oB")
    
    let observableC = Observable<Int>.create{ observer in
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
        }.debug("oC")
    
        let subjects = [observableA, observableB, observableC]
        let sequence:Observable<Observable<Int>> = createSequenceWithWait([observableA, observableB, observableC],waitTime:1) {$0}
        let switchLatestSequence:Observable<Int> = sequence.switchLatest()
        switchLatestSequence.subscribe { e in
            print(e)
        }
}
