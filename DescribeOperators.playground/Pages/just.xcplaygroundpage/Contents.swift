//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next map](@next)
example("just") {
    let sequence = Observable.just(100)
    sequence.subscribe { e in
        print(e)
    }
}
