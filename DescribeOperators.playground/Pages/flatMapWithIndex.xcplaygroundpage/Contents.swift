//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next ignoreElements](@next)
example("flatMapWithIndex") {
    let sequence:Observable<Int> = Observable.of(10, 20, 30)
    let flatMapSequence:Observable<String> = sequence.flatMapWithIndex{val, idx  in Observable.of("A", "B", "C").map{"index: (\(idx)) - \($0) - \(val)"} }
    print(flatMapSequence.dynamicType)
    
    flatMapSequence.subscribe { e in
        print(e)
    }
}

example("flatMapWithIndex with wait") {
    let sequence:Observable<Int> = createSequenceWithWait([0,1,2], waitTime: 1) { $0 }
    let flatMapSequence:Observable<String> = sequence.flatMapWithIndex{val, idx in
        createSequenceWithWait(["A","B","C"], waitTime: 2) { element in
            "index: (\(idx)) - \(element) - \(val)"
        }
    }
    print(flatMapSequence.dynamicType)
    
    flatMapSequence.subscribe { e in
        print(e)
    }
}
