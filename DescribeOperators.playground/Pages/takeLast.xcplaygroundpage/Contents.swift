//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

//: [Next takeUntil](@next)
example("takeLast") {
    let sequence = Observable.of(1, 2, 3, 4).takeLast(2)
    sequence.subscribe { e in
        print(e)
    }
}

example("takeLast with wait") {
    let sequence = createSequenceWithWait([1,2,3,4]) { $0 }
    let takeSequence = sequence.takeLast(2)
    takeSequence.subscribe { e in
        print(e)
    }
}

