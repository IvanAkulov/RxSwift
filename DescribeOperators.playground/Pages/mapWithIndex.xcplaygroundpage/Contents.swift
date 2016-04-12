//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next merge](@next)
example("mapWithIndex") {
    let sequence = Observable.of("A", "B", "C")
        .mapWithIndex({ "\($0) / \($1)" })
    sequence.subscribe { e in
        print(e)
    }
}
