//: [Previous](@previous)

import Foundation
import RxSwift


//: [Next publish](@next)
example("simple of") {
    let sequence = Observable.of(1, 2)

    sequence.subscribe { e in
        print(e)
    }
}

example("of for Observables") {
    let firstSequence = Observable<AnyObject>.of(1, 2, 3)
    let secondSequence = Observable<AnyObject>.of("A", "B", "C")
    
    let bothSequence = Observable.of(firstSequence, secondSequence)
    let mergedSequence = bothSequence.merge()
    
    mergedSequence.subscribe { e in
        print(e)
    }
}
