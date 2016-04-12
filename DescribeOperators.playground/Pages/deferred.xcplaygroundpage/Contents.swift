//: [Previous](@previous)

import Foundation
import RxSwift
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

//: [Next delaySubscription](@next)

example("without deferred") {
    var i = 1
    let justObservable = Observable.just(i)
    i = 2
    _ = justObservable.subscribeNext{ print ("i = \($0)") }
}

example("with deferred") {
    var i = 1
    let deferredJustObservable = Observable.deferred{
        Observable.just(i)
    }
    i = 2
    _ = deferredJustObservable.subscribeNext{ print ("i = \($0)") }
}


