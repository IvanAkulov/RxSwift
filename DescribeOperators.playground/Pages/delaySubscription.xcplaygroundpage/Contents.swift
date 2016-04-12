//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next distinctUntilChanged](@next)
example("delaySubscription") {
    let sequence = Observable.of(1, 2, 3).debug("sequence")
        .delaySubscription(3, scheduler: MainScheduler.instance).debug("delayed sequence")
    
    
    sequence.subscribe { e in
        print(e)
    }
}
