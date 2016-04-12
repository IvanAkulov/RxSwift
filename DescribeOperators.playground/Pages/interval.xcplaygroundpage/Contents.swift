//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next just](@next)
example("interval") {
    let sequence = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
    sequence.subscribe { e in
        print(e)
    }
}

