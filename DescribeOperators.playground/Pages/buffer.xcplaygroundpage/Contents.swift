//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next catchError](@next)
example("buffer") {
    let varA = Variable<Int>(0)
    
    let bufferSequence = varA.asObservable()
        .buffer(timeSpan: 3, count: 3, scheduler: MainScheduler.instance)
    bufferSequence.subscribe { e in
        print("\(NSDate()) - \(e)")
    }
    varA.value = 1
    varA.value = 2
    varA.value = 3
    delay(3) {
        varA.value = 4
        varA.value = 5
        delay(5) {
            varA.value = 6
        }
    }
}
