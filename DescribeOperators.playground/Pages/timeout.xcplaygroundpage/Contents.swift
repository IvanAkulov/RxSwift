//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next](@next)

func withoutError() {
    example("timeout ") {
        
        let sequence = createSequenceWithWait([1,2,3,4]) { $0 }
        let timeout = sequence.timeout(1, scheduler: MainScheduler.instance)
        timeout.subscribe { e in
            print(e)
        }
    }
}

//withoutError()
func withError() {
    example("failed timeout ") {
        let sequence = createSequenceWithWait([1,2,3,4]) { $0 }
        let timeoutSequence = sequence.timeout(0.9, scheduler: MainScheduler.instance)
        timeoutSequence.subscribe { e in
            print(e)
        }
    }
}

withError()


