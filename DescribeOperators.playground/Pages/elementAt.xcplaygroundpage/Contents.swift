//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next empty](@next)
example("elementAt") {
    let sequence = Observable.of(0, 10, 20, 30, 40)
        .elementAt(2)
    sequence.subscribe { e in
        print(e)
    }
}

