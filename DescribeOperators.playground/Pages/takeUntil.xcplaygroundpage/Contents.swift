//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next takeWhile](@next)

example("takeUntil") {
    let stopSequence = Observable.just(1)
        .delaySubscription(2, scheduler: MainScheduler.instance)
    let sequence = createSequenceWithWait([1,2,3,4]) { $0 }
        .takeUntil(stopSequence)
    sequence.subscribe { e in
        print(e)
    }
}
