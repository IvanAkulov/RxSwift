//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true


//: [Next concat](@next)0

example("combineLatest") {
    let firstSequence = createSequenceWithWait([1,2,3], waitTime: 2) { element in
        "\(element)"
    }.debug("firstSequence")
    let secondSequence = createSequenceWithWait(["A", "B", "C"], waitTime: 1) { element in
        "\(element)"
        }
        .delaySubscription(3, scheduler: MainScheduler.instance)
        .debug("secondSequence")
    
    let concatSequence = Observable.combineLatest(firstSequence, secondSequence) {
        first, second -> String in
        "\(first) - \(second)"
    }
    concatSequence.subscribe { e in
        print(e)
    }
}
