//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true


//: [Next never](@next)

example("multicast") {
    let subject = PublishSubject<Int>()
    let firstSequence = createSequenceWithWait([0,1,2,3,4,5]) { $0 }
        .multicast(subject)
    delay(2) {
        _ = subject.subscribe { e in
            print("first: \(e)")
        }
    }
    delay(3) {
        _ = subject.subscribe { e in
            print("second: \(e)")
        }
    }
    firstSequence.connect()
}


