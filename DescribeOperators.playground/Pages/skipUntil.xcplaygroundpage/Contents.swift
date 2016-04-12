//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next skipWhile](@next)
example("skipUntil") {
    let firstSequence = createSequenceWithWait([1,2,3,4]) { $0 }
    let secondSequence = Observable.just(1)
        .delaySubscription(1, scheduler: MainScheduler.instance)
    let skippedSequence = firstSequence.skipUntil(secondSequence)
    
    skippedSequence.subscribe { e in
        print(e)
    }
}