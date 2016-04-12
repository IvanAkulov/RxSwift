//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next startWith](@next)
example("skipWhileWithIndex") {
    let firstSequence = [1,2,5,0,7].toObservable()
    let skipSequence = firstSequence.skipWhileWithIndex{ value, idx in
        value < 4 || idx < 2
    }
    skipSequence.subscribe { e in
        print(e)
    }
}
