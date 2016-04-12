//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next toObservable](@next)
example("toArray") {
    let sequence = Observable.of(1, 2, 3)

    let arraySequence = sequence.toArray()
    arraySequence.subscribe { e in
            print(e)
        }
}
