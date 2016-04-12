//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next skipWhileWithIndex](@next)
example("skipWhile") {
    let firstSequence = [1,2,3,4,0].toObservable()
    let skipSequence = firstSequence.skipWhile { $0 < 3 }
    
    skipSequence.subscribe { e in
        print(e)
    }
}
