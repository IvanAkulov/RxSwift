//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next refCount](@next)
example("reduce") {
    let sequence = Observable.of(1, 2, 3, 4)
        .reduce(1) { $0 * $1 }
    sequence.subscribe { e in
        print(e)
    }
}
