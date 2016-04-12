//: [Previous](@previous)

import Foundation

import Foundation
import RxSwift

//: [Next window](@next)

class FakeDisposable: Disposable {
    func dispose() {
        print("disposed")
    }
}

example("using") {
    let sequence = Observable.using({
        return FakeDisposable()
        }, observableFactory: { d in
            Observable.just(1)
    }) as Observable<Int>

    
    sequence.subscribe { e in
        print(e)
    }
}

