//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next combineLatest](@next)
example("without catchErrorJustReturn") {
    let sequenceWithError = Observable.of(1, 2, 3, 4)
        .concat(Observable.error(RxError.Unknown))
        .concat(Observable.just(5))
    sequenceWithError.subscribe { e in
        print(e)
    }
}

example("with catchErrorJustReturn") {
    let sequenceWithError = Observable.of(1, 2, 3, 4)
        .concat(Observable.error(RxError.Unknown))
        .concat(Observable.just(5))
    let sequenceIgnoreError = sequenceWithError.catchErrorJustReturn(-1)
    sequenceIgnoreError.subscribe { e in
        print(e)
    }
}
