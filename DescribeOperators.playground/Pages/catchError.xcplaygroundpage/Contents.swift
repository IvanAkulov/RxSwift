//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

//: [Next catchErrorJustReturn](@next)
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
example("without catchError") {
    let sequenceWithError = Observable.of(1, 2, 3, 4)
        .concat(Observable.error(RxError.Unknown))
        .concat(Observable.just(5))
    
    sequenceWithError.subscribe { e in
        print(e)
    }
}

example("with catchError") {
    let sequenceWithError = Observable<Int>.create { observer in
        observer.on(.Next(1))
        observer.on(.Next(2))
        observer.on(.Next(3))
        observer.on(.Next(4))
        observer.onError(RxError.Unknown)
        observer.on(.Next(5))
        return NopDisposable.instance
    }
    let sequenceIgnoreError = sequenceWithError.catchError{ error in
        return Observable.of(10, 11, 12)
    }
    
    sequenceIgnoreError.subscribe { e in
        print(e)
    }
}
