//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next takeWhileWithIndex](@next)

example("takeWhile") {
    let sequence = [1,2,3,4].toObservable().takeWhile{ $0 < 3 }
    sequence.subscribe { e in
        print(e)
    }
}
