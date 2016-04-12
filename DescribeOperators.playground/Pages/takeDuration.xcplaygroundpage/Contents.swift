//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next takeLast](@next)

example("take duration with wait") {
    let sequence = createSequenceWithWait([1,2,3,4]) { $0 }
    let takeSequence = sequence.take(2, scheduler: MainScheduler.instance)
    takeSequence.subscribe { e in
        print(e)
    }
}

