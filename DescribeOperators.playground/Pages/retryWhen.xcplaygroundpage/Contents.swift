//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//: [Next sample](@next)

example("retryWhen") {
    var counter = 0
    let sequenceWithError = Observable<Int>.create { observer in
        observer.on(.Next(1))
        observer.on(.Next(2))
        observer.on(.Next(3))
        observer.on(.Next(4))
        counter += 1
        if counter < 3 {
            observer.onError(RxError.Unknown)
        } /*else {
            observer.onError(RxError.Overflow)
        }*/
        observer.on(.Next(5))
        return NopDisposable.instance
    }.debug("with error")
    let sequenceWithoutError = Observable<Int>.create { observer in
        observer.on(.Next(10))
//observer.onError(RxError.NoElements)
        return NopDisposable.instance
        }.debug("without error")
    let retrySequence = sequenceWithError.retryWhen{ (error: Observable<RxError>) -> Observable<Int> in
        let seq:Observable<Int> = error.flatMap { (generatedError: RxError) -> Observable<Int> in
            if case .Unknown = generatedError {
                return sequenceWithoutError
            }
            return Observable<Int>.error(generatedError)
        }
        return seq

    }//.debug()
 
    retrySequence.subscribe { e in
        print(e)
    }
}
