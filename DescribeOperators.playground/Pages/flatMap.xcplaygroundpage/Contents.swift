//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next flatMapFirst](@next)

example("flatMap with wait") {
    let sequence:Observable<Int> = createSequenceWithWait([0,1,2], waitTime: 1) { $0 }
    let flatMapSequence:Observable<String> = sequence.flatMap{val in
        createSequenceWithWait([10,11,12], waitTime: 2) { element in
            "\(element) - \(val)"
        }
    }
    flatMapSequence.subscribe { e in
        print(e)
    }
}
