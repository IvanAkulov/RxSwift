//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next subscribe](@next)
example("startWith") {
    let sequence = Observable.of(1, 2, 3).startWith(0)
    sequence.subscribe { e in
        print(e)
    }
}
