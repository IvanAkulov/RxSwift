//: [Previous](@previous)

import Foundation
import RxSwift

//: [Next skipDuration](@next)
example("skip") {
    let sequence = Observable.of(1, 2, 3, 4).skip(2)
    sequence.subscribe { e in
        print(e)
    }
}
