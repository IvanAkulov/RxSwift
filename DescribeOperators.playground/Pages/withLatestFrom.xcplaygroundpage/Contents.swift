//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true


//: [Next zip](@next)

example("withLatestFrom") {
    let varA = Variable<Int>(0)
    let varB = Variable<Int>(10)
    
    let withLatestFromSequence = varA.asObservable().withLatestFrom(varB.asObservable()) {
        "\($0) - \($1)"
    }
    withLatestFromSequence.subscribe { e in
        print(e)
    }
    varA.value = 1
    varA.value = 2
    varB.value = 20
    
    varB.value = 30
    varA.value = 5
    varA.value = 6
}
