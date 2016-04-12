//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next skipUntil](@next)

example("skip duration with wait") {
    let sequence = createSequenceWithWait([1,2,3,4]) { $0 }.skip(2, scheduler: MainScheduler.instance)
    sequence.subscribe { e in
        print(e)
    }
}

