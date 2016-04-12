//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next takeDuration](@next)
example("take") {
    let sequence = Observable.of(1, 2, 3, 4).take(2)
    sequence.subscribe { e in
        print(e)
    }
}
