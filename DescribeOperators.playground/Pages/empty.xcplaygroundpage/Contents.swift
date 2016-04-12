//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next error](@next)
example("empty") {
    let sequence = Observable<Int>.empty()
    sequence.subscribe { e in
        print(e)
    }
}

