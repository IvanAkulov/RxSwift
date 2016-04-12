//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

//XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

//: [Next replay](@next)
example("repeatElement") {
    let sequence = Observable.repeatElement(1, scheduler: MainScheduler.instance)
    sequence.subscribe { e in
        print(e)
    }
}
