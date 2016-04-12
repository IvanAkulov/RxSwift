//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next mapWithIndex](@next)
example("map") {
    let sequence = Observable.of(1, 2, 3)
        .map{ "\($0 * 5)" }
    sequence.subscribe { e in
        print(e)
    }
}
