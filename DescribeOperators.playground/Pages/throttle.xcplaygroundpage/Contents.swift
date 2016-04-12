//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next timeout](@next)
example("throttle") {
    let sequence = Observable.of(1, 2, 3, 4)
        .throttle(1, scheduler: MainScheduler.instance)
    sequence.subscribe { e in
        print(e)
    }
}

example("throttle with wait") {
    let sequence = createSequenceWithWait([1,2,3,4]) { $0 }
        .throttle(0.5, scheduler: MainScheduler.instance)
    
    sequence.subscribe { e in
        print(e)
    }
}
