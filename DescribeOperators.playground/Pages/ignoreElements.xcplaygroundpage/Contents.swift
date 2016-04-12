//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next interval](@next)
example("ignoreElements") {
    let sequence = Observable.of(1, 2, 3, 4)
        .ignoreElements()
    sequence.subscribe { e in
        print(e)
    }
}