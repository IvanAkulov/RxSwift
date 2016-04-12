//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next reduce](@next)
example("range") {
    let sequence = Observable.range(start: 5, count: 3)
    sequence.subscribe { e in
        print(e)
    }
}
