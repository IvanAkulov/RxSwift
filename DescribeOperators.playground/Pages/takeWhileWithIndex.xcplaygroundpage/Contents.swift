//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next throttle](@next)

example("takeWhileWithIndex") {
    let sequence = [1,2,3,4,5,6].toObservable()
        .takeWhileWithIndex{ (val, idx) in
            val % 2 == 0 || idx < 3
    }
    sequence.subscribe { e in
        print(e)
    }
}
