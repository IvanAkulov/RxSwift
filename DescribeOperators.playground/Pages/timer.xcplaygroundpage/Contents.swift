//: [Previous](@previous)

import Foundation
import RxSwift

import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next toArray](@next)
example("timer") {
    let sequence = Observable<Int64>.timer(2, period: 3, scheduler: MainScheduler.instance)
    sequence.subscribe { e in
        print(e)
    }
}
