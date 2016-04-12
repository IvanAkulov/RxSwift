//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

//: [Next create](@next)
example("concat object method") {
    let firstSequence = Observable<AnyObject>.of(1, 2, 3)
    let secondSequence = Observable<AnyObject>.of("A", "B", "C")
    let concatSequence = firstSequence.concat(secondSequence)
    concatSequence.subscribe { e in
        print(e)
    }
}

example("concat from array") {
    let firstSequence = Observable.of(1,2,3)
    let secondSequence = Observable.of(4,5,6)
    let concatSequence = Observable.of(firstSequence, secondSequence)
        .concat()
    
    concatSequence.subscribe { e in
        print(e)
    }
}




