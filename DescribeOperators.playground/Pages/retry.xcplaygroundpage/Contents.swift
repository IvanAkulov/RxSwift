//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next retryWhen](@next)
example("retry full sequence") {
    let sequenceWithError = Observable.of(1, 2, 3, 4).concat(Observable.error(RxError.Unknown))
    let wholeSequenceWithErrorRetry = sequenceWithError.retry(2)
    
    wholeSequenceWithErrorRetry.subscribe { e in
        print(e)
    }
}

example("retry only error") {
    let sequenceWithRetryError = Observable.of(1, 2, 3, 4).concat(
        Observable.error(RxError.Unknown).retry(2)
    )
    
    sequenceWithRetryError.subscribe { e in
        print(e)
    }
}
