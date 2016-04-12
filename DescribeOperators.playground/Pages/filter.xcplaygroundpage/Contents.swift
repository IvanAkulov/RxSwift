//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next flatMap](@next)
example("filter") {
    let sequence = Observable.of(1, 20, 3, 40)
        .filter{ $0 > 10}
    sequence.subscribe { e in
        print(e)
    }
}