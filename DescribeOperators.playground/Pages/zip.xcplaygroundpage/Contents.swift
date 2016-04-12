//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

example("zip with simple Variable") {
    let varA = Variable<Int>(0)
    let varB = Variable<Int>(10)
    
    let zippedSequence = Observable.zip(varA.asObservable(), varB.asObservable()) { "\($0) - \($1)"
    }
    
    zippedSequence.subscribe { e in
        print(e)
    }
    varA.value = 1
    varA.value = 2
    varB.value = 20
    
    varB.value = 30
    varA.value = 3
    varA.value = 4
}

example("zip with PublishSubject") {
    let subjectA = PublishSubject<Int>()
    let subjectB = PublishSubject<Int>()

    let zippedSequence = Observable.zip(subjectA, subjectB) { "\($0) - \($1)"
    }
    
    zippedSequence.subscribe { e in
        print(e)
    }
    subjectA.onNext(0)
    subjectA.onNext(1)
    subjectA.onNext(2)
    subjectB.onNext(100)
    subjectB.onNext(101)
    subjectA.onNext(3)
    subjectB.onNext(102)
    subjectA.onNext(4)
}
