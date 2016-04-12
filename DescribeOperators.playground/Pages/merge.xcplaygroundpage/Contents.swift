//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

//: [Next multicast](@next)0
example("simple merge") {
    let firstSequence = Observable<AnyObject>.of(1, 2, 3)
    let secondSequence = Observable<AnyObject>.of("A", "B", "C")

    let bothSequence = Observable.of(firstSequence, secondSequence)
    let mergedSequence = bothSequence.merge()
    
    mergedSequence.subscribe { e in
        print(e)
    }
}

example("merge with wait") {
    let firstSequence = createSequenceWithWait([1,2,3]) { element in
        "\(element)"
    }
    let secondSequence = createSequenceWithWait(["A", "B", "C"], waitTime: 2) { element in
        "\(element)"
    }

    let bothSequence = Observable.of(firstSequence, secondSequence)
    let mergedSequence = bothSequence.merge()
    
    mergedSequence.subscribe { e in
        print(e)
    }
}