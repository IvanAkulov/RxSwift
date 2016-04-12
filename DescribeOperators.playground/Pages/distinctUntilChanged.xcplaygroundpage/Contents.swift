//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next doOn](@next)
example("distinctUntilChanged") {
    let sequence = Observable.of(1, 2, 2, 3, 4, 4, 4, 1).distinctUntilChanged()
    sequence.subscribe { e in
        print(e)
    }
}